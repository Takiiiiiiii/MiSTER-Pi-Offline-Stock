Altair8800_Mister
=================

![alt text](./images/Altair8800_MiSTer.png)
By Fred VanEijk and Cyril Venditti.

## What is an Altair 8800

<https://en.wikipedia.org/wiki/Altair_8800>

## How to control the MiSTer Altair8800

- To move the cursor use the directional arrow keys (Left – Right – Up – Down).

- Toggle switches
  - SENSE/DATA/ADDRESS
  - OFF/ON
  - STOP/RUN
    - 1 key - On - up
    - 2 or 0 key - Off - down

- Momentary switches
  - SINGLE STEP
  - EXAMINE
  - DEPOSIT
  - RESET
    - 1 key - Up
    - 2 key - Down

- Not implemented switches
  - CLR
  - PROTECT
  - AUX

## Available samples

These samples are accessible through the MiSTer Core OSD (F12) in the "Select Program" section. 

- Empty

      256 bytes of zeroed memory at address 0x0000.

- zeroToseven

      256 bytes of memory with 1st 8 bytes as 0 to 7.
      First press the RESET toggle, then you can use the EXAMINE NEXT to step through 
      the data in memory.  You will see the values 0 to 7 as binary on the data LEDs.
          
- KillBits

      Kill the Bit game by Dean McDaniel, May 15, 1975
      Object: Kill the rotating bit. If you miss the lit bit, another bit turns on leaving two bits to destroy. 
      Quickly toggle the switch, don't leave the switch in the up position. 
      Before starting, make sure all the switches are in the down position.
      see: rtl\roms\altair\killbits.txt
       
- SIOEcho (See Serial port section)

      256 bytes to test serial port at port 00/01.
      Just echos the character typed on the terminal.
      see: rtl\roms\altair\SIOEcho.txt
  
- StatusLights

      Demonstrate status light combinations.
      Halts the cpu when done so requires a reset of the core.
      Single Step this one.
      see: rtl\roms\altair\StatusLights.txt

- Basic4k32 (see Serial port section)

      This is the basic interpreter originally created by Bill Gates and Paul Allen.
      Basic interpreter in 4k ram at 0x0000 with a total of 8k of memory including the interpreter.
      Communication with the serial port requires SENSE swithes to be set to 0xFD.
      
      The Basic4k32 requires the serial port to be setup to interact with it on a serial terminal.  
      The sense switches to be set as follows (note the sense switches are the switches below the upper 8 address LEDs).  

      Basic will not start properly unless the sense switches are set as follows:
      - 15 to 10 ON
      - 9 OFF
      - 8 ON
      The sense switches control some aspects of initializing the serial port on the Altair8800.

## Altair operation

<https://altairclone.com/altair_experience.htm>

## OSD explanation

MiSTer Core OSD (F12 or OSD button) :

- “Select Program”

      See Available samples section.

- “Load Program”

      Do this switch sequence to run a progrm:
      - Turn the ON/OFF switch to ON
      - Insure that the STOP/RUN switch is STOP
      - Load a program by using the "Select Program" option then press "Load Program".
            Once you press "Load Program" the Core will place that program in memory.
      Finally do:
      - RESET with the RESET/CLR switch
      - Turn the STOP/RUN switch to RUN alternatively use SINGLE STEP

- “Enable TurnMon"

      Makes available the turn key monitor at address 0xFD00.
      See file "rtl\roms\altair\turnmon.txt".
      
- “Reset”

      This will reset the core. Note this is not the same as RESET on the fron panel (which sets the program counter to 0).
      
- “Help”

      This will show this document on the Mister display.  Note this option is on the System OSD display.
  
## Serial port

 We have implemented a serial port as part of the Altair8800 core.  To use it you need to have an I/O Board v5.5 or later with a USER I/O port.  If you do not have this I/O board you can wire directly to the DE10-Nano.

Without the I/O board:

- Any USB to 3.3V (NOT 5.5V) TTL Serial Cable Adapter should work.
  - TX of the TTL Serial Cable Adapter -> SCL Arduino_IO15 pin of the DE-10.
  - RX of the TTL Serial Cable Adapter -> SDA Arduino_IO14 pin of the DE-10.
  - Don't forget to wire the Ground.

With the I/O board:
The User Port (which looks like a USB 3.1A connector) is documented here: <https://github.com/MiSTer-devel/Wiki_MiSTer/wiki/emu---Top-Level-of-a-MiSTer-core>

- Any USB to 3.3V (NOT 5.5V) TTL Serial Cable Adapter should work.
  - TX of the TTL Serial Cable Adapter -> RX/SCL/D+ pin 3 of the User Port.
  - RX of the TTL Serial Cable Adapter -> TX/SDA/D- pin 2 of the User Port.
  - Don't forget to wire the Ground -> GND pin 4 of the User Port.
  
Use Putty or TeraTerm as a client and use the 19200 baud setting at 8 bits and no parity (this is required to run the Basic4k32 example).

This cable should work fine.
<https://a.co/d/dMlEKn4>

with this USB 3.0 adapter
<https://a.co/d/1VpqE5a>

![alt text](./images/DE-10_Serial.png)
  
## Credits

- Inspiration for displaying the Altair8800 front panel:
     <https://timetoexplore.net/blog/arty-fpga-vga-verilog-01>

- Altair8800 front panel image:
     <http://www.vintage-computer.com/altair8800.shtml>
  
- Core:
    <https://github.com/1801BM1/vm80a>

    <https://zeptobars.com/en/read/KR580VM80A-intel-i8080-verilog-reverse-engineering>

    <https://hackaday.com/2015/03/07/looking-inside-the-kr580vm80a-soviet-i8080-clone/>

    <https://jeelabs.org/2016/09/i-never-had-an-intel-8080/>

    <https://github.com/mmicko/s100fpga>

## Known issues

Depending on your monitor resolution the Altair8800 front panel might not be complete or centered.

## Not implemented

The following switches/functions are not implemented:

- CLR
- PROTECT
- AUX
