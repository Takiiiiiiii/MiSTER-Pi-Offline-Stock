# Gamate Handheld System for MiSTer

## General description
This is an FPGA implementation of the Gamate handheld system by Jamie Blanks. This was a Gameboy clone from the early 2000's from the Bit Corp, later to be part of UMC. There's not much to say about it.

This core is compatible with Gameboy *.gbp palette files which can be found with the Gameboy core.

## Setup
This core requires a 4kb bootrom to work, which should be named boot0.rom in the core's game folder. There's two (or more) versions of this BIOS, and neither is better than the other, but the "UMC" version of the bios is slightly newer. Valid CRC32's are 03A5F3A7 (Bit Corp) and 07090415 (UMC).

You may also copy a game to boot1.rom in order to have it boot to that game when the core loads.

## Special Thanks
Thanks to Moondandy for thorough testing and bug hunting.