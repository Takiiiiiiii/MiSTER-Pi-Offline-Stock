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

# Version 1.2 - 2019-03-02 - Changed "/media/fat/timezone" to "/media/fat/linux/timezone", removed -k option from curl.
# Version 1.1 - 2019-01-08 - Changed "http://ip-api.com/json/" to "http://www.ip-api.com/json/".
# Version 1.0 - 2019-01-08 - First commit.

TIMEZONE="$(curl -sLf "http://www.ip-api.com/json/" | grep -o "\"timezone\" *: *\"[^\"]*" | grep -o "[^\"]*$")"
if echo "$TIMEZONE" | grep -q "/"
then
	cp "/usr/share/zoneinfo/posix/$TIMEZONE" "/media/fat/linux/timezone"
	echo "Timezone set to"
	echo "$TIMEZONE."
else
	echo "Unable to get"
	echo "your timezone."
fi
exit 0