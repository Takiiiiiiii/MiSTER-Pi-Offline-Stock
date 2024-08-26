# [TurboGrafx 16 / PC Engine](https://en.wikipedia.org/wiki/TurboGrafx-16) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki) 

### This is the port of Gregory Estrade's [FPGAPCE](https://github.com/Torlus/FPGAPCE)

Port to MiSTer, Arcade card, DDR3, mappers and other tweaks [Sorgelig](https://github.com/sorgelig)

Tweaks and CD Support added by [srg320](https://github.com/srg320)

Additional bug fixes by [greyrogue](https://github.com/greyrogue)

Palettes & audio filters by [Kitrinx](https://github.com/Kitrinx)

Further refinements and maintanance by [dshadoff](https://github.com/dshadoff)

## Features
 * SuperGrafx mode
 * saves
 * Completely rewritten CPU and VDC for cycle accuracy
 * Uses DDR3 and SDRAM for cartridge's ROM (SDRAM is recommended for accuracy)
 * 2-button, 2-button 'turbo', and 6-button joystick support
 * XE-1AP analog controller
 * Turbotap(multiple joysticks)
 * Mouse
 * Pachinko controller
 * Memory Base 128 storage unit
 * Street Fighter II and Populous mappers
 * CD-ROM / Super CD-ROM
 * Arcade Card
 * Cheat engine
 * CHD Support

## Installation:
Copy the *.rbf file at the root of the SD card. Copy roms (*PCE,*BIN) to **TGFX16** folder. You may rename ROM of your favorite game to **boot.rom** - it will be automatically loaded upon core loading.
Use SGX file extension for SuperGrafx games.

## CD-ROM games
CD-ROM images must be in BIN/CUE or CHD format, and must be located in the **TGFX16-CD** folder. Each CD-ROM image must have its own folder.
**cd_bios.rom** must be placed in the same TGFX16-CD folder as the images mentioned above. **Japanese Super CD-ROM v3.00 is recomended for maximum compatibility**. 
Additionally you can use a different bios for specific games (for example from Games Express) by placing cd_bios.rom inside the game image's folder.

**Do not zip CD-ROM images! It won't work correctly.**

**Attention about US BIOS:** MiSTer requires original dump of US BIOS to work properly. It needs to be of 262144 bytes.
If you can read copyright string at the end of US BIOS file, then it's not correct dump! It's already pre-swapped for emulators.
While it will work on MiSTer, some CD games will refuse to start. **Correct US BIOS file is when copyright string is not readable.**

## Cheat engine
Standard cheats location is supported for HuCard games. For CD-ROM game all cheats must be zipped into a single zip file and placed inside game's CD-ROM folder.

## Joystick
Both Turbotap and 6-button joysticks are supported.
XE-1AP analog joystick is supported for the 4 games which are supported (After Burner II, Forgotten Worlds, Operation Wolf, Outrun)
Do not enable the above features for games not supporting it, otherwise game will work incorrectly.
For 2-button 'turbo' joypad (sync'd as in original system), turbo fire is provided by alternate buttons : A, B (normal), X, Y (turbo 1 level), and L, R (turbo 2 level)

## Mouse
Mouse is supported.
Do not enable this feature for games not supporting it, otherwise game will work incorrectly.

## Pachinko
Pachinko controller is supported through either paddle or analog joystick Y axis.

## Palettes
The 'Original' palette is based on reverse engineering work of the VDP by [furrtek](https://github.com/furrtek). An RGB to YUV lookup table was discovered that translates the colors to their intended values with the composite output of the console. Further work was done by [ArtemioUrbina](https://github.com/ArtemioUrbina) to verify the color output. [Kitrinx](https://github.com/Kitrinx) created a tool to generate the resulting [palette](https://github.com/Kitrinx/TG16_Palette).

## Reset
Hold down Run button then press Select. Some games require to keep both buttons pressed longer to reset. The PC Engine/Turbografx-16 did not have a hardware reset button, and instead relies on this button combination. With this method, in-game options will remain if you have changed them, whereas the MiSTer OSD reset will revert them.
(Note: this reset method is suppressed in a small number of games)

## SDRAM
This core may work without SDRAM (using on-board DDR3), but it may have different kinds of issues/glitches due to high latency of DDR3 memory. Thus SDRAM module is highly recommended for maximum accuracy.

### Notes:
* Both headerless ROMs and ROMs with header (512b) are supported and automatically distinguished by file size.

## Download precompiled binaries
Go to [releases](https://github.com/MiSTer-devel/TurboGrafx16_MiSTer/tree/master/releases) folder. 
