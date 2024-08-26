# [Homelab](https://ajovomultja.hu/homelab-2?language=en) for [MiSTer FPGA](https://mister-devel.github.io/MkDocs_MiSTer/)

![Hungarian Homelab KIT series computers](homelab.png)

## Description

This is a Homelab running on Mister FPGA.

Original [MiST core by gyurco](https://github.com/gyurco/Homelab-FPGA).  
It was ported to MiSTer by [JasonA](https://github.com/JasonA-dev). HTP support was added by Flandango.  
Homelab was a series of Hungarian KIT computers in the 1980s invented by József Lukács and Endre Lukács.

## Features

- Homelab-3 and Homelab-4 models supported (model switching is done via the OSD)
- Increased RAM size to 48k from default 16k
- 32 character and 64 character video modes selectable via OSD
- HTP rom loading via OSD
- HTP rom loading via ADC
- Turbo mode option for HTP rom loading
- Character rom loading via OSD
- Selectable monochrome video color via OSD

### HTP Support via OSD

Type `LOAD ""` and press enter. This will put the core into loading mode. Select `Load HTP ROM` from the OSD. Then select `Play` from the OSD. The user LED will blink as the HTP is loading, and switch off once loading is complete. The core will usually display `OK` and a blinking cursor afterwards.

Two options are possible to start the HTP file. The first, is typing RUN and pressing enter. Some HTP ROMs though will not work using this. They require an alternative method. This is using the `CALL` command.

In the HTP filename, a number is usually written for where to call. If it states CALL in the filename, then RUN will not work.

Example:
`CALL $5100` and press enter.  
This is an example of one, where is states `CALL $5100` in the filename. This is not for all HTP files. You will need to check the number in the filename.

### HTP Support via ADC

ADC support has been added to the core for loading wav files of the roms via ADC in. You will need the ADC adapter hardware upgrade for MiSTer if using the Analog IO board. The Digital IO board has an ADC-in jack already soldered onto it. The user LED will blink as the HTP is loading, and switch off once loading is complete.

### Character ROM support via OSD

Some HTP roms require unique character roms also, to display the video correctly.  
Load the relevant character rom needed for each HTP rom, using the option for this in the OSD.

### Turbo Mode for HTP Loading

A turbo mode option can be found in the OSD. This will switch the CPU to 120MHz during HTP loading to reduce the loading time. Once loading is complete, the CPU is slowed back to normal mode. This is an optional feature, and not necessary for HTP loading, if not desired.

## Additional Homelab Reference Links

- [Homelab Reference Information (Hungarian Language)](http://homelab.8bit.hu/index.html)
- [József Lukács discussing the hardware and the Homelab club](https://www.youtube.com/watch?v=0xv9tILTgBs)
- [Old-Computers.com article on the Homelab series of computers](https://www.old-computers.com/museum/computer.asp?st=3&c=1095)
