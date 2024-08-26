# Camputers Lynx MiSTer FPGA Core



## General description

This is a Lynx48 running on Mister FPGA. it was ported from zx-uno (https://github.com/Kyp069/lynx) by rampa069.  Simulation support added by JimmyStones and alanswx, Tape Loading through the OSD by JasonA.

## The Camputers Lynx Home Computer
The Lynx was an 8-bit British home computer that was first released in early 1983 as a 48 kB model. The designer of the Lynx was John Shireff and several models were available with 48 kB, 96 kB or 128 kB RAM. It was possible reach 192 kB with RAM expansions on-board.

The machine was based around a Z80A CPU clocked at 4 MHz, (6 MHz for the 128/192 kB models) and featured a Motorola 6845 as video controller. 
The machine was quite advanced for the time, but the high price (48 kB : £225, 96 kB : £299, 128k : £345) compared to its competitors, the Sinclair ZX Spectrum and the Oric 1, and lack of software was probably the reason for its short life. Approximately 30,000 Lynx units were sold worldwide.

Unique features of this computer (compared to other home computers at the time) includes: 
A quite large Basic, including graphics commands, in line CODE sentence for inclusion of machine code in hex. Unlike most other computers interpreting from text, the lines were precompiled and stored in reverse polish binary format. 
All numbers were floating point BCD numbers (even line numbers). 
A monitor program allowed hex dumps, copy, compare etc. 
The computer always ran in "high" resolution graphics mode (256x252 pixels in eight colours) using 6 times 10 pixels characters. Only a few bytes of graphic memory could be manipulated during the horisontal sync period, and thus graphics were extremely slow compared to most other computers; but better looking! 
Up to 192 kB of RAM and 20 kB of ROM (16 kB on the smallest model) on a 16 bit address bus was implemented using special hardware. As a consequence, certain RAM areas shadowed by ROM could only be used for data storage and the video memory had a green and alternative green bank that could be switched by a hardware register. For sound it had a simple (4 bit ?) DAC. A comparator was included to serve as an ADC (primarily used for reading from tape drives). 

## What is working

* CPU.
* Lynx 48/96/96+scorpion
* Sound.
* Screen.
* Keyboard.
* Tape loading.
* Support for 96 and scorpion ROM.
* Joysticks. 
* CRTC


## Keys

* F11 - Reset
* F8  - Level9 adventures palete fix.

## Tape loading

There are two ways to load tape files (.tap):

### 1) using the MiSTer OSD menu
At the moment, only BASIC programs, and machine code programs are supported. Data programs,
and Level9 Computing programs are not supported yet. Better compatibility is coming soon, but this will play a lot of games.If
a game doesn't load in 48k mode, try 96k mode by switching the setting in the OSD.

Using the OSD menu, machine code files will reset the core, and start automatically.
If you are returned to the cursor prompt, it means the tape file is a BASIC program.
To run the loaded BASIC programs, simply type RUN, and press enter. The program should run.


### 2) load audio via audio in 

This should be more compatible.

To convert .tap files to wav files (the same as you need to load on a real Lynx machine)
* lynx2wav (Unix) (https://github.com/RW-FPGA-devel-Team/lynx2wav)
* Mike's lynx utilities (Windows) http://retrowiki.es/viewtopic.php?f=31&t=200036021
