# [Oric-1 / Oric Atmos](https://en.wikipedia.org/wiki/Oric) for MiSTer Platform

Original Read.Me for MiST. Not all info is releavant to MiSTer.
-----------------------------------------------------

# Oric 48K in MiST and SiDi FPGA

Oric-1 and Oric Atmos re-implementation on a modern FPGA.

### Background:

There is one version made and ported by [Gehstock](https://github.com/Gehstock/Mist_FPGA/tree/master/Computer_MiST/OricInFPGA_MiST) at GitHub, but it's far from a functional Oric.
Gehstock's version for MiST board was realeased as a proof of concept with only 32KB RAM (no Oric existed with that memory, only **16K** ,**48K** and **64K**)(64KB is real RAM) so there were errors managing **HIRES** mode) and no way to load audio tapes and lots of graphics errors on screen.

### What can you expect from Oric 48K in MiST and SiDi FPGA ?

This project began in november 2019 with the aim to preserve the Oric's computer family into FPGA.

Actually Oric 1, Oric Atmos and Microdisc are fully functional.

* **ULA HCS10017**.
* **VIA 6522**.
* **CPU 6502**.
* Full 64KB of **RAM**.
* Keyboard managed by GI-8912.
* Sound (**AY-3-8910**).
* Switchable **ROM** (between 1.1a ATMOS version and 1.0 ORIC 1 version).
* Tape loading working (via audio cable on the RX pin).
* Oric Microdisc implementation vía **CUMULUS**
* Disc Read / Write operations fully supported with EDSK (The same as Amstrad CPC) format.
* Disc Sedoric/OricDOS Operating System Loading fully working

### TODO

 * Debugging, checking for possible bugs at video and improving the core.


### KNOWN BUGS

* Issue [loading files on multipart dsks](https://github.com/MiSTer-devel/Oric_MiSTer/issues/4); i.e. programs using CLOAD to load in other data from the dsk.

..if you find others, let us know, please.

### HOW TO USE AN ORIC 1 & ATMOS WITH MiST, MiSTica and SiDi FPGA boards.

* **Create a directory called ORIC at your sd's root and put inside the disc images to work on**

   * Once the core is launched:

   Keyboard Shorcuts:
   * F10 - NMI button, acts like original ORIC NMI
   * F11 - Reset. Use F11 to reboot once a DSK is selected at OSD
   * F12 - OSD Main Menu.

   ![shortcuts](img/shorcuts.jpg?raw=true "Keyboard shortcuts")

   * Activate FDC controller at OSD MENU
   * Select an Image from games/Oric directory, exit OSD and press F11. System will boot inmeddiately



## The Oric Fpga preservation TEAM

   * Ron Rodritty:  Team coordination and QA testing.
   * Fernando Mosquera: FPGA guru.
   * Subcritical: Verilog and VHDL.
   * ManuFerHi: Hardware consulting.
   * Chema Enguita: Oric Software gurú
   * SiliceBit: Oric hardware Gurú
   * ZXMarce: Hardware support 24/7...
   * Ramón Martínez:  Oric hardware, Some software, and fpga coding.
   * Slingshot: SDRAM work and advisor.

* Kudos to: Sorgelig, Gehstock, DesUBIKado, RetroWiki and friends.

## About disk images

  Despite the .dsk extension, Disk images must use the defacto standard **edsk** for disk preservation (also known as "AMSTRAD CPC EXTENDED FORMAT"). To convert images
  from the Oric "dsk" to the needed "edsk" you need the [HxCFloppyEmulator](https://hxc2001.com/download/floppy_drive_emulator/HxCFloppyEmulator_soft.zip) tool
  (source code [here](https://sourceforge.net/projects/hxcfloppyemu/)).

  Load the Oric disk and export it as **CPC DSK file** The resulting image should load flawlessly on the Oric. Always use a `.dsk` extension for your output file
  These images are also compatible with fastfloppy firmware on gothek, cuamana reborn, etc. working with real Orics.

## About tape images

  Loading from a `tap` file is currently supported in this core, but you can also convert `.tap` files to `dsk` with the [OricDSK Disc Manager Tool](https://github.com/teiram/oric-dsk-manager).
  Then convert the resulting "dsk" to the supported "edsk" (CPC format) with [HxCFloppyEmulator](https://hxc2001.com/download/floppy_drive_emulator/HxCFloppyEmulator_soft.zip) as explained above.

  Tape to dsk conversion is also possible with [tap2dsk](https://sourceforge.net/projects/euphorictools/files/disk%20image%20tools/Sedoric%20tool/) from
  the [Euphoric Tools](https://sourceforge.net/projects/euphorictools/) pack.

  This core does also support real-world (physical) Tape loading (via audio cable on the RX pin).

## Troubleshooting disks

  * If dsk is bootable, simply select the image, exit the MiSTer OSD, then press F11.
  * If dsk is NOT bootable, after inserting, try `DIR` to list contents then `!NAME_OF_FILE_TO_RUN` to load and run.
  * If you see errors like `Insert System Disk` try loading the SEDORIC first, exiting to the BASIC prompt, insert your dsk and use `DIR`, `!NAME_OF_FILE_TO_RUN`.

  *NOTE*: There are known [loading issues](https://github.com/MiSTer-devel/Oric_MiSTer/issues/4) with multipart dsks; e.g. programs that use CLOAD to load in additional data from the dsk.

## Software redistribution.

 In the dsk directory, you will find some disk images in the proper format.

* **SEDORIC 4.0** operating System disk image redistributed with permission from Symoon.
* **Blake's 7** game, redistributed with permission of chema enguita you can download manual and additional info from [Defence force](http://www.defence-force.org/index.php?page=games&game=blakes7)
* **Oricium** game, redistributed with permission of chema enguita you can download manual and additional info from [Defence force](http://www.defence-force.org/index.php?page=games&game=oricium)
* **Space:1999** game, redistributed with permission of chema enguita you can download manual and additional info from [Defence force](http://www.defence-force.org/index.php?page=games&game=space1999)
* **1337** game, redistributed with permission of chema enguita you can download manual and additional info from [Defence force](http://www.defence-force.org/index.php?page=games&game=1337)
