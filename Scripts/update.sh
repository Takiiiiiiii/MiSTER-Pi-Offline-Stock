#!/bin/bash
# Copyright (c) 2021-2022 José Manuel Barroso Galindo <theypsilon@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# You can download the latest version of this tool from:
# https://github.com/MiSTer-devel/Downloader_MiSTer

set -euo pipefail

download_file() {
    local DOWNLOAD_PATH="${1}"
    local DOWNLOAD_URL="${2}"
    for (( COUNTER=0; COUNTER<=60; COUNTER+=1 )); do
        if [ ${COUNTER} -ge 1 ] ; then
            sleep 1s
        fi
        set +e
        curl ${CURL_SSL:-} --fail --location -o "${DOWNLOAD_PATH}" "${DOWNLOAD_URL}" &> /dev/null
        local CMD_RET=$?
        set -e

        case ${CMD_RET} in
            0)
                export CURL_SSL="${CURL_SSL:-}"
                return
                ;;
            60)
                if [ -f /etc/ssl/certs/cacert.pem ] ; then
                    export CURL_SSL="--cacert /etc/ssl/certs/cacert.pem"
                    continue
                fi

                set +e
                dialog --keep-window --title "Bad Certificates" --defaultno \
                    --yesno "CA certificates need to be fixed, do you want me to fix them?\n\nNOTE: This operation will delete files at /etc/ssl/certs" \
                    7 65
                local DIALOG_RET=$?
                set -e

                if [[ "${DIALOG_RET}" == "0" ]] ; then
                    local RO_ROOT="false"
                    if mount | grep "on / .*[(,]ro[,$]" -q ; then
                        RO_ROOT="true"
                    fi
                    [ "${RO_ROOT}" == "true" ] && mount / -o remount,rw
                    rm /etc/ssl/certs/* 2> /dev/null || true
                    echo
                    echo "https://curl.se/ca/cacert.pem"
                    curl -kL "https://curl.se/ca/cacert.pem"|awk 'split_after==1{n++;split_after=0} /-----END CERTIFICATE-----/ {split_after=1} {if(length($0) > 0) print > "/etc/ssl/certs/cert" n ".pem"}'
                    echo
                    echo "Installing cacert.pem into /etc/ssl/certs ..."
                    for PEM in /etc/ssl/certs/*.pem; do mv "$PEM" "$(dirname "$PEM")/$(cat "$PEM" | grep -m 1 '^[^#]').pem"; done
                    for PEM in /etc/ssl/certs/*.pem; do for HASH in $(openssl x509 -subject_hash_old -hash -noout -in "$PEM" 2>/dev/null); do ln -s "$(basename "$PEM")" "$(dirname "$PEM")/$HASH.0"; done; done
                    sync
                    [ "${RO_ROOT}" == "true" ] && mount / -o remount,ro
                    echo
                    echo "CA certificates have been successfully fixed."
                    export CURL_SSL=""
                    continue
                fi

                set +e
                dialog --keep-window --title "Insecure Connection" --defaultno \
                    --yesno "Would you like to run this tool using an insecure connection?\n\nNOTE: You should fix the certificates instead." \
                    7 67
                DIALOG_RET=$?
                set -e

                if [[ "${DIALOG_RET}" == "0" ]] ; then
                    echo
                    echo "WARNING! Connection is insecure."
                    export CURL_SSL="--insecure"
                    sleep 5s
                    echo
                    continue
                fi

                echo "No secure connection is possible without fixing the certificates."
                exit 1
                ;;
            *)
                echo "No Internet connection, please try again later."
                exit 1
                ;;
        esac
    done

    echo "Internet connection failed, please try again later."
    exit 1
}

echo "Running MiSTer Downloader"
echo

SCRIPT_PATH="/tmp/downloader.sh"

rm ${SCRIPT_PATH} 2> /dev/null || true

download_file "${SCRIPT_PATH}" "https://raw.githubusercontent.com/MiSTer-devel/Downloader_MiSTer/main/dont_download.sh"

chmod +x "${SCRIPT_PATH}"

export DOWNLOADER_LAUNCHER_PATH="${BASH_SOURCE[0]}"

if ! "${SCRIPT_PATH}" ; then
    echo -e "Downloader failed!\n"
    exit 1
fi

rm ${SCRIPT_PATH} 2> /dev/null || true

exit 0
