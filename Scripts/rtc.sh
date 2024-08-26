#!/bin/bash

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

# Copyright 2019 Alessandro "Locutus73" Miele

# You can download the latest version of this script from:
# https://github.com/MiSTer-devel/Scripts_MiSTer

# Version 1.0.2 - 2020-12-07 - Fixed a filesystem permission issue.
# Version 1.0.1 - 2019-06-10 - Pinging the NTP server for testing Internet connectivity instead of google.com.
# Version 1.0 - 2019-01-08 - First commit.

NTP_SERVER="0.pool.ntp.org"

if ! ping -4 -q -w1 -c1 ${NTP_SERVER} &>/dev/null
then
	echo "No Internet connection"
	exit 1
fi

echo "Syncing date and time with"
echo "$NTP_SERVER"
if ntpdate -s -b -u $NTP_SERVER
then
	echo "Date and time is:"
	echo "$(date)"
	mount | grep "on / .*[(,]ro[,$]" -q && RO_ROOT="true"
	[ "$RO_ROOT" == "true" ] && mount / -o remount,rw
	if hwclock -wu
	then
		echo "RTC set."
	else
		echo "Unable to set the RTC."
	fi
	[ "$RO_ROOT" == "true" ] && mount / -o remount,ro
else
	echo "Unable to sync."
fi
exit 0
