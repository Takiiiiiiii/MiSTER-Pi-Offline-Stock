# [Bally Astrocade](https://en.wikipedia.org/wiki/Bally_Astrocade) for MiSTer Platform

### This is an FPGA implementation of the Bally Astrocade based on a project by MikeJ.

## Features
 * Supports full keypad.
 * Supports paddle control as analog stick.

## Installation
Copy the Astrocade_\*.rbf file to the root of the SD card. Create an **Astrocade** folder on the root of the card, and place Astrocade roms (\*.BIN) inside this folder. Search the web for a copy of the Bally Astrocade BIOS and rename it **boot.rom** and then place it in the **Astrocade** folder. Use the keyboard to select the game if prompted.

## Astrocade Controls
The Astrocade had a very unusual controller. It was a gun-grip style handle with a joystick on the top, which had an integrated pot switch serving as a paddle control. This translates poorly to modern controllers. MiSTer only offers analog data for the first two axes of the controller, which is most often the left analog stick. For games which require paddle controls, directional movement, and the trigger button used together, I suggest mapping the controller such that the right analog stick is dpad motion, one of the shoulder buttons is the trigger button, and the left analog stick is the paddle.

## Cart Expansions
No cart expansions are implemented at this time.

## Known Issues
The video timings of the Astrocade seem to create problems with the first and last lines of each field. This seems to work okay on actual CRTs, but scandoublers like OSSC may be confused by it.
