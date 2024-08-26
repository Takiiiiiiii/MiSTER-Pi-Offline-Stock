# [SEGA Megadrive/Genesis](https://en.wikipedia.org/wiki/Sega_Genesis) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki)

This is the port of the [fpgagen](https://github.com/Torlus/fpgagen) core.

fpgagen - a SEGA Megadrive/Genesis clone in a FPGA.
Copyright (c) 2010-2013 Gregory Estrade (greg@torlus.com)
All rights reserved


## Installing
copy *.rbf to root of SD card. Put some ROMs (*.BIN/*.GEN/*.MD) into Genesis folder


## Hot Keys
* F1 - reset to JP(NTSC) region
* F2 - reset to US(NTSC) region
* F3 - reset to EU(PAL)  region


## Auto Region option
There are 2 versions of region detection:

1) File name extension:

* BIN -> JP
* GEN -> US
* MD  -> EU

2) Header. It may not always work as not all ROMs follow the rule, especially in European region.
The header may include several regions - the correct one will be selected depending on priority option.


## Additional features

* Multitaps: 4-way, Team player, J-Cart
* SVP chip (Virtua Racing)
* Audio Filters for Model 1, Model 2, Minimal, No Filter.
* Option to choose between YM2612 and YM3438 (changes Ladder Effect behavior).
* Composite Blending, smooth dithering patterns in games.
* Sprite Limit, enables more sprites.
* CPU Turbo, mitigates slowdowns.
