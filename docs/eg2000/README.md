# EACA EG2000 Colour Genie FPGA implementation for MiSTer

This core is a RW-FPGA dev team project implemented by Ricardo Martinez (KYP) initially in ZXUno.
A port to Altera has been made, covering the boards, MiST, MiSTica, SiDi and MiSTer by KYP and rampa069.
This core has been designed from scratch.

Port to MiSTer by alanswx, CAS tape support by Flandango.

## Background

The Colour Genie was released in 1982.  It was an attractive machine, with a solid 
full-stroke keyboard and 16K BASIC in ROM. 
As well as the 63-key typewriter keyboard and powerful BASIC, it featured the 
trusty Z-80, running at 2.2 MHz, 16k-32k of RAM, 3 channels of sound, 8 colours 
(4 for text), 40 columns x 24 rows for text (initially) and 160 x 102 pixels 
for graphics.Ports which included RS-232, Joysticks (2), light pen, RGB and audio.  

## Specifications:

Z80 running at 2.2 MHz

Video Hardware

    Motorola 6845 CRTC
    40×24 text (original ROMs) or 40×25 text (upgraded ROMs), 16 colours, 
    128 user defined characters
    
    160×96 graphics (original ROMs) or 160×102 graphics (upgraded ROMs), 
    4 colours x up to 4 pages

Sound Hardware

    General Instruments AY-3-8910
    3 sound channels, ADSR programmable
    1 noise channel
 
## Coverage

The core works in RGB (15khz), VGA (31Khz) and HDMI. 
Both Basic and Machine Code programs are loaded through the audio input ( CLOAD or SYSTEM ) TRS-80 style. CAS tape support via OSD (see instructions below). 

## OSD CAS Loading Instructions

When the computer starts, you will see this:

    MEMORY?

press ENTER

This prompt will appear:

    COLOUR BASIC
    READY
    >

type "SYSTEM" and press ENTER

Then at this prompt:

    *?

press FIRST LETTER OF THE CAS FILE (for example T) and press ENTER

Choose any CAS file with the same first letter and select Play/Pause in the OSD

You will see some "**" appear in the top right as the CAS file loads. It is real-time, and might take a minute or two.

Then at this prompt:

    *? 

press "/" and press ENTER

The loaded CAS file will now run.

## Keys
 * **F5** NMI.
 * **F11** Reset on MiSTer.
 * **F12** OSD on MiSTer.