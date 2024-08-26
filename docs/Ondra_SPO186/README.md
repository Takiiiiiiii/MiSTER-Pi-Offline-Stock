# Ondra SPO 186
[![Ondra SPO 186 image](/pictures/Ondra_th.jpg)](/pictures/Ondra.jpg)  
[Ondra SPO 186](https://cs.wikipedia.org/wiki/Ondra_(po%C4%8D%C3%ADta%C4%8D)) is a [Czechoslovakian](https://en.wikipedia.org/wiki/Czechoslovakia) 8-bit computer developed in 1985 in [Tesla Liberec](https://en.wikipedia.org/wiki/Tesla_(Czechoslovak_company)) by [Ing. Eduard Smutný](https://cs.wikipedia.org/wiki/Eduard_Smutn%C3%BD), Ing. Tomáš Smutný a Ing. Jan Mercl as a cheap school and home computer. Tesla produced about 2000 Ondra computers.
And this is its implementation in Verilog for [MiSTer](https://github.com/MiSTer-devel/Main_MiSTer/wiki) FPGA.

## Short demo video of this core on youtube

https://youtu.be/YnFbf-u1D80 


Older video with load via serial port - not supported anymore  
https://youtu.be/B2MRWTKYOYU

## Specifications

* CPU [U880](https://en.wikipedia.org/wiki/U880) @4MHz - [GDR](https://en.wikipedia.org/wiki/East_Germany) clone of [Z80](https://en.wikipedia.org/wiki/Z80)
* 64 kB RAM (10kB used by video RAM)
* 4 - 16 kB ROM (EPROM) 
* TV output 
* up to 320x255 pixels B/W (40 columns x 24 rows)
* relay for cassette player control - often used for "sound (click) signaling"
* 7 frequency sound generator (only 7 different given frequencies)
* one 20 pins connector for joystick, Centronics parallel port (8-bit data out, Strobe_n out, Busy in), UART (Reserva In = RXD, Reserva Out = TXD)
* cassette player connector for SW load and save at 2400[Bd](https://en.wikipedia.org/wiki/Baud)

## Keyboard

Ondra has a modest keyboard with 37 keys only and so each key can serve for 2 or 3 different characters based on used modifier-key.

**Modifier keys:**  
**Ondra      -> PC Keyboard**  
Shift      -> Shift  
Symbols    -> Alt  
Ctrl       -> Ctrl  
Numbers    -> Tab  
ČS         -> Caps Lock (used for Czech diacritics)

Each modifier key needs to be pressed (and hold) before pressing character key. 
Here is mapping Ondra keys to PC Keyboard. Please note modifier keys are in different colors as invoked characters on other keys.

![Ondra Keyboard mapping](/pictures/OndraKeyboardMapping_small.jpg)

[Here](/pictures/OndraKeyboardMapping.jpg) is bigger picture of keyboard mapping.

## Graphics generation (Video circuit)

Ondra has a very unique video circuit. Video address counter is made with 2x КР580ВИ53 programmable interval timers - Russian clone of [i8253](https://en.wikipedia.org/wiki/Intel_8253). In fact although Ondra was designed and manufactured in Czechoslovakia most of ICs were "Made in [USSR](https://en.wikipedia.org/wiki/Soviet_Union)".
Timers are used for generating [VSync and HSync](https://en.wikipedia.org/wiki/Analog_television#Vertical_synchronization) start pulses as well as for generaing video address itself. Cheap, simple but not easy :)
Advantage of this solution is that screen resolution can be programmatically changed. Disadvantage is that CPU has to be while screen is being drawn. CPU works on about 18-20% only.


## What is implemented

* CPU
* 64 kB RAM
* Keyboard
* Sound (7 different sound - not forming a scale - as on real HW)
* Tape load via ADC MiSTer connector (line in)
* [Ondra SD](https://sites.google.com/site/ondraspo186/4-rom-card-sd) - modern HW for easier SW load from SD Card
* [OndraMELODIK](https://github.com/72ka/OndraMELODIK) - new HW for Ondra bringing better sound (sn76489 chip). Here is link to [youtube video](https://youtu.be/u5RyUs0VGdg) with demo app

## What is missing

* [Ondra SD](https://sites.google.com/site/ondraspo186/4-rom-card-sd) - RAW R/W support (required for [CP/M](https://sites.google.com/site/ondraspo186/8-ondra-cp-m))

## How to install core

* copy file **Ondra_SPO186_########.rbf** from **[releases](/releases)** folder to your MiSTer SD card to **Computer** folder
(*######## stands here for date of version - you might want to delete earlier from SD card if you have some*)
* in MiSTer menu navigate to Ondra_SPO186 item and start the core

## How to start

### Options
 
### Loading games via [Ondra SD](https://sites.google.com/site/ondraspo186/4-rom-card-sd) 

* No external HW required - Ondra SD is implemented inside FPGA

#### Preparing for use
* Create "**Ondra**" folder on your SD Card in **secondary SC card slot** 
* Copy there "**__LOADER.BIN**" and "**_ONDRADM.BIN**" from [OndraSD.zip](https://sites.google.com/site/ondraspo186/download/9-3-hardware/OndraSD.zip?attredirects=0&d=1)
* Copy there some game too :) Here is good source [https://sites.google.com/site/ondraspo186/download](https://sites.google.com/site/ondraspo186/download)  
Your SD Card should look like this

![SD Card content](/pictures/SDCard.jpg)

#### Using [Ondra SD](https://sites.google.com/site/ondraspo186/4-rom-card-sd) 
* Use **ViLi ROM** (Ondra greets you with message "Zdraví Vás ONDRA")
* type # (ALT + E) and press Enter - if Ondra SD doesn't react press enter again/for longer time or reset Ondra
* Ondra File Manager appears in few seconds after several beeps
* Choose file or folder and press Enter to change dir or load a file
* Shift change directory to root of SD card


### Loading games via audio line in

* connect your audio source (cassette player, mobile, ...) to MiSTer ADC (line in)
* Choose ViLi ROM
* press any key. Screen turn black and will flicker time to time. You can see text .KÓD 1. This is ok. Ondra turn off screen to gain more time for CPU and text .KÓD x will change as game will be loading to Ondra (x will raise from 1).
* start playing WAV file
* Enjoy the Ondra SPO 186 and the game :)

## For more info see

* http://www.sapi.cz/ondra/ondra.php
* https://cs.wikipedia.org/wiki/Ondra_(po%C4%8D%C3%ADta%C4%8D)
* https://sites.google.com/site/ondraspo186/home
* https://sites.google.com/site/ondra186/home 
* https://github.com/omikron88/jondra
* https://www.clous.cz/ondra-spo-186/
* https://www.old-computers.com/museum/computer.asp?st=1&c=612

Some of them are only in Czech or Slovak, but Google translate is your friend :)
