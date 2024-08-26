# Atari [5200](https://en.wikipedia.org/wiki/Atari_5200) and [Atari 800/800XL/65XE/130XE](https://en.wikipedia.org/wiki/Atari_8-bit_family) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki)

### This is the port of [Atari 800XL core by Mark Watson](http://www.64kib.com/redmine/projects/eclairexl)

### Installation
* Copy the *.rbf file to the root of the system SD card.
* Copy the files to Atari800/Atari5200 folder

## Usage notes

### System ROM
You can supply other A800 OS ROM as Atari800/boot.rom. 
Alternative Basic ROM can be placed to Atari800/boot1.rom. 

Integrated 800XL ROM includes SIO turbo patch (fast disk loading).

Turbo ROM has hot keys to control the turbo mode:
* SHIFT+CONTROL+N    Disable highspeed SIO (normal speed)
* SHIFT+CONTROL+H    Enable highspeed SIO 
  
Additionally, you can control the speed of turbo loading in OSD menu.

### Disks
A800: After mounting the disk, press F10 to boot.
Some games don't like the Basic ROM. Keep F8(Option) pressed while pressing F10 to skip the Basic.

### Differences from original version
* Joystick/Paddle mode switched by joystick. Press **Paddle1/2** to switch to paddle mode (analog X/Y). Press **Fire** to switch to joystick mode (digital X/Y).
* Use ` key as a **Brake** on reduced keyboards.
* Cursor keys are mapped to Atari cursor keys.
* PAL/NTSC mode switch in settings menu (A800)
* Video aspect ratio switch in settings menu
* Some optimizations and tweaks in file selector and settings menu navigation.
* Standard OSD menu for cartridge/disk selection.
* Mouse emulates analog joystick(Atari 5200) and paddles(Atari 800).
* Fire 2 and Fire 3 on joystick.

### Disable Basic ROM by Joystick.
Fire 2 on joystick acts as an OPTION key while reboot. It's valid only 2 seconds after reboot. After that Fire 2 doesn't affect the OPTION key.

### More info
See more info in original [instructions](https://github.com/MiSTer-devel/Atari800_MiSTer/tree/master/instructions.txt)
and original [manual](https://github.com/MiSTer-devel/Atari800_MiSTer/tree/master/manual.pdf).

## Download precompiled binaries
Go to [releases](https://github.com/MiSTer-devel/Atari800_MiSTer/tree/master/releases) folder.
