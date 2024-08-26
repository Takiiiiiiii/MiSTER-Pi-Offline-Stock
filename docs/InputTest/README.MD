#	MiSTer Input Tester

## Overview

A custom mini-system running an input test utility.  There are 4 test screens available:
 - Digital - shows joypad buttons for first two input devices
 - Analog - shows analog axes for selected input device (cycle with a/b)
 - Advanced - shows all standard HPS sourced inputs (joystick, analog, paddle, spinner, ps2 keyboard and mouse) simultaneously
 - Button test - guided button test to help detect bounce / missed inputs and test man+machine lag

To access the menu:
- Hold (select) on the first joypad
- Press Escape on a keyboard
- Press the USER button
- Use the OSD option

There are two secrets to find...

## Acknowledgements

Created by JimmyStones (http://github.com/jimmystones), with thanks to:
- alanswx (https://github.com/alanswx) for ideas, cross-platform simulation support, and the tutorial this core was based on
- Jotego (https://github.com/jotego) for his very tidy JTFRAME modules
- Darrin Cardani for the quality YM music
- Porkchop Express (https://misteraddons.com/) for testing a bunch of devices I couldn't
- M. Walrus (@WalrusFPGA) for more testing
- Sorgelig (https://github.com/sorgelig) for testing, finding bugs and suggesting new features.  Oh, and the MiSTer project :)

## Hardware

The InputTest core is based on my Aznable 'custom hardware' project.  See the main repo for hardware and software details, build instruction, etc 
https://github.com/JimmyStones/Aznable 

## License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
