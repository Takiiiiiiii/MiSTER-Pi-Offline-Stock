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

# Version 1.0.3 - 2021-08-23 - New method for checking if the script is run on a real MiSTer system (thanks to MiSTer Addons).
# Version 1.0.2 - 2019-02-03 - Remounting / as RW only when needed; downgraded version from 1.1 to 1.0.2.
# Version 1.0.1 - 2019-02-02 - Remounting / as RW before altering /etc/init.d/ so the script actually works from OSD.
# Version 1.0 - 2019-02-02 - First commit



if [ ! -f "/media/fat/MiSTer" ]; 
then
	echo "This script must be run"
	echo "on a MiSTer system."
	exit 1
fi

mount | grep "on / .*[(,]ro[,$]" -q && RO_ROOT="true"
[ "$RO_ROOT" == "true" ] && mount / -o remount,rw
mv /etc/init.d/_S91smb /etc/init.d/S91smb > /dev/null 2>&1
sync
[ "$RO_ROOT" == "true" ] && mount / -o remount,ro
if [ -f /media/fat/linux/iptables.up.rules ]
then
	sed -e '/--dport 137 /s/^#//g' -i /media/fat/linux/iptables.up.rules
	sed -e '/--dport 138 /s/^#//g' -i /media/fat/linux/iptables.up.rules
	sed -e '/--dport 139 /s/^#//g' -i /media/fat/linux/iptables.up.rules
	sed -e '/--dport 445 /s/^#//g' -i /media/fat/linux/iptables.up.rules
fi
sync
if [ -f /etc/network/if-pre-up.d/iptables ]
then
	/etc/network/if-pre-up.d/iptables
fi
/etc/init.d/S91smb start

echo "Samba is on and"
echo "active at startup."
echo "Done!"
exit 0