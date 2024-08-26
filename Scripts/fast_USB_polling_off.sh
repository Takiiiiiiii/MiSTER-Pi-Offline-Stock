#!/usr/bin/env python

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

# You can download the latest version of this script from:
# https://github.com/MiSTer-devel/Scripts_MiSTer

# Version 1.0 - 2020-01-22 - first version
# Version 1.1 - 2021-09-12 - removed "MiSTer" hostname check

import os
import sys
import time
import re
from os import path

UBOOT_PATH = "/media/fat/linux/u-boot.txt"

if path.exists(UBOOT_PATH):

    poll_prefixes = ("v=loglevel=","usbhid.jspoll=","xpad.cpoll=")

    #reads lines, removing old polling choices and stripping whitespace
    with open("/media/fat/linux/u-boot.txt","r") as file:
        lines_out = []
        for l in file.readlines():
            stripped_line = re.sub("(%s|%s|%s)\d+\s*" % poll_prefixes,"",l).strip()
            if len(stripped_line) > 0:
                lines_out.append(stripped_line)

    #rewrites cleaned output with 1ms polling turned off
    with open("/media/fat/linux/u-boot.txt","w") as file:
        for l in lines_out:
            file.write(l + "\n")
        file.write("v=loglevel=4 usbhid.jspoll=0 xpad.cpoll=0\n")

else:
    with open("/media/fat/linux/u-boot.txt","w") as file:
        file.write("v=loglevel=4 usbhid.jspoll=0 xpad.cpoll=0\n")

os.system("clear")

print ("""
Fast USB polling is OFF and
will be inactive after reboot.

Rebooting in:
""")

time.sleep(2)

t = 5
while t > 0:
    print ("...%x" % t)
    t -= 1
    time.sleep(1)

print ("...NOW!")
os.system("reboot")

time.sleep(10) # Reboot without showing "Press any key..."
