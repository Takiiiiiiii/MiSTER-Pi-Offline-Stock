# [Orao](https://en.wikipedia.org/wiki/Orao_(computer)) for MiSTer Platform

This is a FPGA implementation of Orao, old Croatian computer from the 1980s. It is designed to run on the MiSTer retro gaming platform.

![img](img/orao.jpg)

## How to install

Download the latest .rbf from releases folder and place it on your SD card. Create a folder called "ORAO" and download the .tar.gz containing .wav files you can find in this repository under "software".

Since programs are stored and uploaded to the core as raw .wav files, they are compressed to save space. Please note they take up to ~100 MB when unpacked, so pick the ones you want and save those to the SD card if storage space is an issue to you.

## Running the core

After turning on, first thing you see is just an asterisk with a blinking cursor - not very intuitive. This is the monitor mode which is a common thing for computers of this era.
```
To access basic, type BC and press enter, then again enter when asked about memory size.
```
![img](img/uputa.gif)

To load a program, press F12, select Load *.TAP and choose the desired file. It gets copied into the tape buffer and becomes available to the Orao loader routine. Next, you simply need to type:
```
LMEM ""
```
and press enter. Wait a bit and - voila!

Please note the sound of audio tape is played during loading, you might want to **turn down your audio volume first**.

The audio tape needs to be: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 8 bit, mono 44100 Hz.

## Basic

After loading basic following the instructions above, you can write and run your own programs. The basic is a Microsoft variant. Only documentation I have is a [manual](software/orao_manual.pdf) in croatian. Example program:

```
10 FOR I=0 TO 255
20 Y=100*SIN(I/40)+128
30 PLOT I,Y
40 NEXT
```

Known keywords:

* Numeric functions (ABS, INT, RND, SGN, SQR, EXP, LOG, SIN, COS, TAN, ATN)
* Characters and strings (ASC, CHR, LBFT, RIGHT, MID, LEN, STR, VAL)
* Flow control (FOR, NEXT, GOTO, GOSUB, RETURN, ON, IF, THEN)
* Graphics (DRAW, PLOT, OPENW, CLOSEW, OPENG, CLOSEG, LETTER, SMOVE, MOVE, DRAW, MODE, PLOT, CIR)
* Input - output (INPUT, DATA, READ, RESTORE, PRINT)
* Storage - (SAVE, LOAD, LMEM, DMEM)
* Misc - (RATE, PTR, PDL, CHAR, SOUND, CUR, VDU, EXIT)

![img](img/basic.gif)

#### Billy's clever hack

Some of the original Microsoft BASIC routines were used, supposedly written by Bill Gates himself. To make it easier to prove in court if somebody decided to use his code without proper licensing, he did a fantastic trick. Modifying the coefficients used to calculate trigonometry values like this:

```
(Found at memory 0xDE7C)
A1 54 46 8F 13 8F 52 43 89 CD

-> Reverse
CD 89 43 52 8F 13 8F 46 54 A1

-> Remove two most significant bits
0D 09 03 12 0F 13 0F 06 13 21

-> Add 64 (convert between PETSCII and ASCII)
4D 49 43 52 4F 46 54 61

-> Convert to ASCII and you get
"MICROSOFT!"
```

Can't dispute that, can you?

### About the computer

* CPU: MOS Technology 6502 at 1 MHz
* ROM: 16 KB
* RAM: 16-32 KB
* VRAM up to 24 KB
* Graphics: monochrome, 256×256 pixels
* Text mode: 32 lines with 32 characters per line
* Sound: single-channel, built in loudspeaker
* Keyboard: 61-key, QWERTZ layout
* I/O ports: video, cassette tape, RS-232C, printer, expansion connector
* Peripherals: 5.25" floppy drive, printer
* Dimensions: 420 x 230 x 70mm


#### Memory map:

* 0000 - 03FF - zero block (1K)
* 0400 - 5FFF - user RAM (23K)
* 6000 - 7FFF - video RAM (8K)
* 8000 - 9FFF - system locations (8K)
	* 8000-87FE - keyboard
	* 87FF - tape input register
	* 8800 - 8fff - audio generation
	* 9000 - 9fff - RS232
* A000 - AFFF - expansion (1K)
* B000 - BFFF - DOS (1K)
* C000 - DFFF - BASIC ROM (8K)
* E000 - FFFF - system ROM (8K)

#### Key control functions:

* CTL + L - erase screen
* CTL + G - produce audible beep
* CTL + F - erase text from cursor to end of screen
* CTL + H - move cursor left (VIM, anyone?)
* CTL + K - move cursor up
* CTL + I - move cursor right
* CTL + J - move cursor down
* CTL + V - toggle beep when key is pressed
* CTL + E - erase text from cursor to end of line
* CTL + B - turn on printer
* CTL + U - turn off printer
* CTL + D - move cursor to beginning of the first line
* CTL + M - move cursor to beginning of the current line
* CTL + C - abort program (break)
* PF1 - toggle caps
* PF2 - turns on printer
* PF3 - print inverted characters
* PF4 - copy text

#### Monitor mode commands

All addresses are in hex.

* *Xnnnn - displays disassembled code at address nnnn
* *X - continue disassembly from last used address
* *Ennnn mmmm - print memory contents between nnnn and mmmm
* *Hnnnn mmmm - print memory contents in both binary and ascii
* *Mnnnn - modify memory at address nnnn
* *Cnnnn mmmm - calculate sum starting from nnnn to mmmm. Used as a form of checksum.
* *Fnnnn mmmm xx - fills memory between nnnn and mmmm with bytes xx
* *Jnnnn - jump to address nnnn unconditionally
* *Unnnn - jump to address nnnn as a subroutine (save return address to stack)
* *#nnnn - convert hex nnnn to decimal
* *Qnnnn mmmm iiii - move memory to target nnnn, source block starting from mmmm to iiii.
* *Annnn - invoke mini-assembler, nnnn is the target where assembled code will be stored

#### Tips for tapes

* Sokoban is started using the command LNK4096
* Tetris is started using the command LNK2048

## Click to watch the original demo

[![Click to watch demo](img/youtube-link.png)](https://www.youtube.com/watch?v=gpQc9DPkCxk)

## Known issues

* Need to fix horizontal video borders
* Loading file occasionally fails

## License

This project is licensed under the MIT License.

## Acknowledgments

* Thanks to Alexey Melnikov - Sorgelig
* Thanks to Thomas Skibo and Peter Wendrich
* Thanks to Miroslav Kocijan, the designer of Orao
