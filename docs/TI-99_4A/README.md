# [TI-99/4A](https://en.wikipedia.org/wiki/Texas_Instruments_TI-99/4A) Core for MiSTer Platform
See below for original readme

- Requires SDRAM Module.  Anything over 2Megs should work.
- Requires 994aROM.BIN and 994AGROM.BIN for base functionality.
- Reset and Detach Cart option added to wipe Cartridge Rom/Grom space and SAMS Ram before resetting.  
  This will also clear out any Cart data loaded via Boot0.rom and unsaved MiniMem NVRAM.
- The Disk and TIPI DSRs along with the PCode System and Speech ROMs are optional [speech working - use 5200 model in OSD] but required if you plan on using the features.
- System Roms/Groms, along with DSRs are no longer part of the Cartridge roms and are selected/loaded seperately.
- Switching to a new Cartridge Rom format to help make loading Multi-file cartridges easier.  
  Current "Full/Bin" roms are still supported for the time being but still require seperate System Roms/DSRs.  
  Can independently load Cartridge ROMs and Groms.  Multiple C/D must be properly combined before hand, same goes for Multiple Grom files.  
  Do note multi-grom files need to be padded to 8k each file before merging.
- Supports cartridges up to 32Megs (non-M99 roms can be loaded via the *Load Rom Cart* menu option.
- Support for MBX, Paged7, Paged378, Paged379 and MiniMem Cartridges.
- MiniMem utilizes 4K NVRAM file.  Use the MiniMem OSD sub menu to Select the NVRAM file then Load/Save to use it. A Blank 4k NVRAM.dat file is in the Releases folder.
- Up to three, Single and Double Sided Floppies are supported.  
  TI-FDC supports 40 Track Single Density only (SSSD/DSSD)   
  Myarc-FDC supports 40 Track up to Double Density (SSSD/DSSD/SSDD/DSDD)   
  Myarc-FDC-80 supports 40 and 80 Track Single and Double Density.  Diskutility 4.x formats 80 track DD as Quad Density.
- NTSC/PAL Video Modes are supported.
- SAMS memory (1Meg), can be disabled via OSD.
- Tipi support via User IO port.  TIPI DSR required from [Tipi Downloads](https://jedimatt42.com/downloads.html).
- Tipi CRU selectable in OSD menu. (>1000, >1100, >1200 and >1400)  **Selecting CRU 1100 disables TI FDC DISK **
- PCode System support.  Requires PCode Rom file.  Python Script to generate ROM file from Mame Rom set included in Tools folder.
- Turbo may work with some Cartridges and TI Basic.  DOES NOT work with Extended Basic (XB).  YMMV
- Python Scripts (based/derived from GHPS' pyTIrom scripts) to Generate M99 rom sets are included in the Tools folder.  Please see the [README file](Tools/README.md)
- To use an M99 rom file as default boot cartridge, rename it as **boot0.rom**
- Original pyTIrom scripts for legacy Full/Bin files are here: [pyTIrom](https://github.com/GHPS/pyTIrom)

## TIPI User I/O to Raspberry PI Wiring:

|RPI PIN|USER PORT PIN|USB Name|USB 3.1 Breakout Board Pin|
|:----:|:------------:|:--------:|:------------------------:|
|  31  |      6       |   TX+    |           (9)            |
|  33  |      2       |   TX-    |           (8)            |
|  35  |      3       |   GND_D  |           (7)            |
|  36  |      1       |    D-    |           (2)            |
|  37  |      0       |    D+    |           (3)            |
|  38  |      4       |   RX+    |           (6)            |
|  39  |      -       |GND/SHIELD|           (10)           |
|  40  |      5       |   RX-    |           (5)            |
    
- USB Breakout Board model B01MRK0REP used for reference.  Other board's noted pin #s may not match.
- **If you will use a breakout board, it MUST be a USB 3.1 Breakout board with 10 pins**
- Tipi on Raspberry PI Zero W via the USER IO can be flaky and may require code modification to get it working which beyond this README file.
- Instructions to modify the code to get a RPI Zero W working with MiSter will be in the [tipi_rpi_zero.md](tipi_rpi_zero.md) file.

## System Roms, Groms and DSRs
- These roms are no longer bundled with each cartridge rom and now must be specified in the **Hardware** submenu.
- The Roms/Groms/DSRs specified in the Hardware submenu persist through reboots.
- The *System Grom* (994AGROM.BIN) and the *System Rom* (994aROM.BIN) are required at a minimum.  
  Alternate Grom/Roms (ex 994AGrom-QI.BIN) can also be used.
- The standard TI-FDC DSR provides 40 Track SSSD/DSSD Floppy Support.  
  The Myarc-FDC DSR (crc32 042968A9) (found in MAME) provides 40 Track SSSD/DSSD/SSDD/DSDD,  
  while the Myarc-FDC-80Track DSR (crc32 7BF4862B) provides access to 3.5" Floppy Images.
- The Disk, TIPI and PCode DSR/Roms are optional, but required if you want to use the related feature.
- File names are not important, but must end in **.bin**.

## Original README 

# EP994A
My TI-99/4A clone implemented with a TMS99105 CPU and FPGA (master branch).  
Another version of the clone (the latest development in soft-cpu branch) includes my own  
TMS9900 CPU core written in VHDL.  

See the file LICENSE for license terms. At least for now (without contributors from others)  
the source code is made available under the LGPL license terms.  
You need to retain copyright notices in the source code.  

Latest changes
--------------
Commit 2018-01-03:
- So I have been very lacy at updating this README file. There has been a ton of changes.
  Note that there are two branches, master branch contains the **TMS99105** version and soft-cpu contains the **FPGA CPU** version. 


Commit 2016-11-13:
	
- Added firmware/diskdsr.asm which is a Device Service Routine for disk I/O support. It currently
	registers DSK1 and DSK2. It support LOAD and SAVE opcodes. Support means that it will
	pass the PAB to the PC host to read by copying it to system RAM at address 0x8020.
	There is a command buffer at address 0x800A..0x8013 which is used for communication between
	the TMS99105 system and the host PC.
	
- Refactored memloader code:
	- Added disk io support. Now if memloader is started with the command "-k" it 
		will not only poll keyboard but also poll memory location updated by the DSR when
		disk I/O requests happen.
		
	- Memloader now parses command line arguments better. Output is less verbose.
		
- FPGA code now supports SAMS memory extension, currently configured to 256Kbytes.
	This required a bunch of other changes, as the scratchpad area needs to be unpaged.
	This is done by remapping the scratchpad above the 256K area used by SAMS.

Hackaday
--------
Project is documented to an extent at Hackaday and AtariAge TI-99/4A forums.

https://hackaday.io/project/15430-rc201699-ti-994a-clone-using-tms99105-cpu

AtariAge
--------
The AtariAge forum thread talks about my other FPGA project as well, but contains information about 
http://atariage.com/forums/topic/255855-ti-994a-with-a-pipistrello-fpga-board/page-8

About the directories
---------------------
**firmware** test software I used to debug the hardware. Written in assembler. Also some loading scripts.
- 2016-11-13 now here is also the diskdsr.asm assembly module, which implements a starting point for disk access. Currently it relies on support by the PC program "memloader".

**fpga** the VHDL code implementing the TI-99/4A (except the CPU).

**memloader** a program for Windows (compiled with Cygwin) to transfer data from PC to the FPGA. This program is used for a few purposes:
- load software from PC to the memory of the EP994A
- reset the EP994A
- pass keypresses from host PC to the EP994A
- 2016-11-13: poll certain memory locations to enable disk access, i.e. saving and loading 
- 2016-11-13: Now there are project files for Visual Studio 2015 community edition. This is just a great IDE and speeds up programming.

**schematics** the schematics of the protoboard (incl. CPU, clock, a buffer chip) connected to the FPGA board. Note: the schematics are in a need of an update, the current version lacks to wires:
- CPU reset from FPGA to buffer to CPU
- VDP interrupt signal from FPGA to buffer to CPU

