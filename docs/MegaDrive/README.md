# Nuked-MD port for MiSTer

![nukedmd_logo](rtl/nuked-md/nukedmd_logo.png)

[Original Nuked-MD repository](https://github.com/nukeykt/Nuked-MD-FPGA)

## Installing
copy rbf to root of SD card. Put some ROMs (.BIN/.GEN/.MD/.SMS) into MegaDrive folder


## Hot Keys
* F1 - reset to JP(NTSC) region
* F2 - reset to US(NTSC) region
* F3 - reset to EU(PAL)  region


## Auto Region option (Megadrive/Genesis carts only)
There are 2 versions of region detection:

1) File name extension:

* BIN -> JP
* GEN -> US
* MD  -> EU

2) Header. It may not always work as not all ROMs follow the rule, especially in European region.
The header may include several regions - the correct one will be selected depending on priority option.


## Sega Master System

Core supports SMS carts with the same compatibility level as original MegaDrive hardware. Not all SMS carts are compatible with MD hardware.


## Additional features

* Multitaps: 4-way, Team player, J-Cart
* SVP chip (Virtua Racing)
* Audio Filters for Model 1, Model 2, Minimal, No Filter.
* Option to choose between YM2612 and YM3438 (changes Ladder Effect behavior).
* FM chip for SMS carts.
* Composite Blending, smooth dithering patterns in games.
* Border/Borderless modes.
* Support many popular mappers.
