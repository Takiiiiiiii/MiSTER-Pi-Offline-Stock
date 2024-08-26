# Sinclair QL for [MiSTer Board](https://github.com/MiSTer-devel/Main_MiSTer/wiki) 

This is a much advanced port of the Sinclair QL implementation for the [MiST](https://github.com/mist-devel/mist-board/tree/master/cores/ql)

### Changes from MiST implementation:
* Switched CPU to cycle-perfect fx68 core
* QL/16Mhz/24Mhz/42Mhz CPU speeds
* 896kB/4096kB of RAM
* Support for SMSQ/E operating system using a GoldCard like implementation and boot ROM ("MiSTer Gold Card", also contains TK2). Automatically enabled when 4MB RAM is selected
* Full QL-SD support using real QL-SD card in secondary slot or QL-SD images (often called "QXL.WIN" files) on primary card. Needs QL-SD driver 1.08 or higher
* Allow dynamic mounting of QL-SD images from OSD
* Allow switching OS from the OSD
* RTC

### Installation:
* Copy the *.rbf file to the root of the SD card. 
* Download the MiSTer_QL_OS zip file from https://www.kilgus.net/ql/mister/ and copy one of the files (JS, Minerva English or Minerva German) as boot.rom into QL folder.
* Download qlsd_win_demo.zip from same page and extract it as boot.vhd to QL folder (or QL.vhd in root folder) if it should automatically be mounted. Otherwise mount later using OSD.
* Optionally copy some *.mdv files to QL folder.

## Operating systems
All QL operating systems are supported. More ROMs are available from http://www.dilwyn.me.uk/qlrom/. ROM size should be 49152 for pure OS images or 65536 for OS + 16kB extension ROM. QL-SD can be used if the QL-SD driver is in the extension ROM, but otherwise ROMs like TK2 are supported, too.

Additionally the much enhanced SMSQ/E operating system is now supported. The MiSTer SMSQ/E version is basically a GoldCard SMSQ/E minus the floppy driver as that is not implemented. Download it from https://www.kilgus.net/ql/mister/. It should be put into a QL-SD image and then be executed using LRESPR.

## QL-SD images
The new QL-SD driver uses QLWA type hard drive image files. These are the same files also supported by most major emulators (QPC, QemuLator, SMSQmulator) and native hardware solutions (QL with QL-SD, Q40/Q60, Q68), so data exchange is fairly easy. Images on a secondary SD card must be contiguous or data loss can happen! Best to copy it onto a clean SD card. Images on the primary SD are not affected from this limitation.
When an image is mounted from the primary SD the secondary SD slot remains available as "card 2" and any file called "QXL.WIN" on it is automatically mounted as the "WIN2" device (e.g. "DIR win2_"). Different files can be mounted using the WIN_DRIVE command, see QL-SD manual for details.

## MDV images
Files can be loaded from microdrive images stored in MDV files in QLAY format. These files must be exactly 174930 bytes in size. Examples can be found in http://web.inter.nl.net/hcc/A.Jaw.Venema/psion.zip as well as in the [releases](https://github.com/MiSTer-devel/QL_MiSTer/tree/master/releases) directory.
