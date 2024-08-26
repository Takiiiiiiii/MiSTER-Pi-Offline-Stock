# [Commodore VIC-20](https://en.wikipedia.org/wiki/Commodore_VIC-20) for [MISTer](https://github.com/MiSTer-devel/Main_MiSTer/wiki)
MiSTer port with enhancements by Sorgelig

Original VIC-20 core by [MikeJ (Mike Johnson)](https://www.fpgaarcade.com/author/mikej/) and [WoS (Wolfgang Scherr)](https://www.researchgate.net/profile/Wolfgang_Scherr2)

## Features

* Options for 3 extended RAM regions.
* Automatic screen centering (many Vic20 games have off-center screen)
* Support for *.PRG files.
* Support for *.TAP files
* Cartridge support with and without header.
* Disk with write support (*.D64)
* Partly/fully Loadable system ROM for C1541, Kernal and Basic.
* Scandoubler with HQ2x and Scanlines
* PAL/NTSC TV modes
* Joystick support

## Instructions

System ROM can be loaded from SD card. Put boot.rom into VIC20 folder.  
Content of boot.rom: C1541(16KB) + PAL kernal(8KB) + NTSC kernal(8KB)  
You can load only part of whole ROM, for example only C1541 + PAL kernal (JiffyDOS).

There are 2 ways to reset the VIC20:
1. lctrl+lalt+ralt - cold reset with cartridge unloading - must be done before loading the new game!
2. ctrl+f11 - reset the CPU with cartridge autostart at $A000

Commodore VIC-20 has very messy and confusing expansions, so you need to be familiar with this computer to know how to run different cartridges and correct RAM expansion for different games. Multi-part cartriges only add more mess. Some cartridges have loading address in the first 2 bytes, some haven't so you only can guess where to load the cart. Usually loading address is written in the file name.

If the cartridge has one of these exact sizes: 2048, 4096, 8192, 16384 then it has no header.  
If the size is 2 bytes more than any of these sizes, then it has a header with a loading address.

You can find many dumps of multipart carts as a single CRT files - in most cases these dumps won't work as these parts usually aren't loaded into connected regions and must be loaded separately.

The core supports following extensions:
* .CRT - cartridges with header.
* .CTx - cartridges without header where x is one of 2-9,A,B(CT2-CT9,CTA,CTB) symbols denoting the loading address 2000-9000, A000, B000

You won't find the cartridges with CTx extensions. All the cartridges you will find have a CRT extension regardless if they have the header or not. So you need to rename them accordingly if they are headerless.

The best practice is to only use the carts with a header.

Since many cartridges are multi-part cartridges, there is no autostart procedure. You need to load all parts from OSD and if starting address is $A000(SYS 40960) then simply press CTRL+F11 to start. If starting address is different, then follow the instruction of the cartridge. Usually it's `SYS <address>` command.

RAM expansions aren't universal. Enabling all expansions won't automatically make the VIC-20 compatible with all games. So you need to find the info about that specific game's RAM requirements if it doesn't run. Or try different options.

Good luck while playing with this Zoo :)


**Sorgelig**
