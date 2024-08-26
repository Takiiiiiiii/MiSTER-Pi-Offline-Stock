# [TSConf](http://forum.tslabs.info/viewforum.php?f=20&sid=137db6b31f9fb533b908742c2b18284e) for MiSTer Platform

This is the port of TSConf (an improvement to the [ZX-Evolution](https://www.facebook.com/zxatmevolution/) ZX spectrum clone) to MiSTer.

## Features of the port
* Scandoubler with HQ2x and Scanlines.
* RTC.
* Configurable CMOS settings through OSD.
* Supports both secondary SD and image on primary SD.
* Kempston Joystick.
* Kempston Mouse.
* Turbosound FM (dual YM2203)
* General Sound 512KB-2MB
* SAA1099

## Installation
place RBF into root of primary SD card. And then you have 3 options:
1) Format secondary SD card with FAT32 and unpack content of SDCard.zip to it.
2) Create TSConf.vhd image (non-MBR!) with FAT32 format and unpack SDCard.zip to it. Then place TSConf.vhd to root of primary SD card.
3) same as 2, but name the file boot.vhd and place it into TSConf folder on primary SD card.

Put some TAP, SNA, SCL, TRD, SPG files to secondary SD card (or to TSConf.vhd image) as well.

By default, if everything is done right, Wild Commander will be loaded where you can choose the games to start.

## VHD files
You can make several VHD files and put them into TSConf folder on primary SD card and then choose from OSD.

### Note
Although original CMOS setting page can be launched (CTRL+F11), the settings made there won't have effect. You need to use OSD for CMOS settings.

Original TSConf F12 key (reset) is transferred to F11.
