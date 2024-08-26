<p align="center">
    <img style="width: 450px;" src="assets/casio-pv-2000.png">
</p>

# [Casio PV-2000](https://www.old-computers.com/museum/computer.asp?c=1167) for [MiSTer](https://mister-devel.github.io/MkDocs_MiSTer/)
This is an FPGA implementation of the Casio PV-2000 computer for the MiSTer FPGA platform.

## Features
- Cartridge Bin files (.bin)
- Joysticks for up to two players

## Required Files - Not Included
System Rom can be obtained from Mame and must be named boot0.rom in the games/Casio_PV-2000/ folder.
- Extract the hn613128pc64.bin file from pv2000.zip and rename it boot0.rom

## Joystick
- Support for two controllers, each with two Fire Buttons (Attack 0 and Attack 1), Select and Start.
- Configure buttons via in-core OSD menu.

## Keyboard Mapping
PC | Casio
-- | ----
<kbd>F1</kbd> | <kbd>Mode</kbd>
<kbd>F11</kbd> | <kbd>_</kbd>
<kbd>Insert</kbd> | <kbd>Insert/Delete</kbd>
<kbd>Delete</kbd> | <kbd>Insert/Delete</kbd>
<kbd>Home</kbd> | <kbd>Home/CLS</kbd>
<kbd>Left CTRL</kbd> | <kbd>Attack 0</kbd>
<kbd>Left ALT</kbd> | <kbd>Attack 1</kbd>
<kbd>Right CTRL</kbd> | <kbd>FUNC</kbd>
<kbd>Right ALT</kbd> | <kbd>COLOR</kbd>
<kbd>ESC</kbd> | <kbd>Stop/Cont</kbd>
<kbd>Page Up</kbd> | <kbd>Stop/Cont</kbd>
<kbd>Backspace</kbd> | <kbd>Cursor Left</kbd>
<kbd>Caps Lock</kbd> | Toggle Between English and Hiragana
<kbd>"</kbd> | <kbd>:</kbd>
<kbd>=</kbd> | <kbd>&#65509;</kbd>
<kbd>\\</kbd> | <kbd>@</kbd>

## Features not implemented
- Tape/Cassette support
- Printer Support

## Notes
- Mame contains three cartriges that are split into two rom files.  These files must be merged together into one rom file.
    - (Win Command Prompt) `copy /B Rom1.bin + Rom2.bin MyCart.bin`
    - (Linux/MiSTer) `cat Rom1.bin Rom2.bin > MyCart.bin`
