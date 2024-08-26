# Purpose of this document

This readme shall deliver a small introduction on how to write a GPIO gamepak module for GBA core.

There are several GPIO modules available, e.g.:
- Real-Time Clock (RTC)
- Solar Sensor
- Rumble
- Gyro Sensor
- ...

Each of these modules can be implemented into the GBA core in Verilog, VHDL or SystemVerilog.
(Please don't use other obscure languages that are unsupported by quartus out of the box).

While most of these modules are quiet small, some HDL knowledge is still helpful.

# How do the modules work?

Documentation is available here:

https://problemkaputt.de/gbatek.htm#gbacartioportgpio

Implementations can be found in the various emulators available.


# How to start

There is a dummy VHDL module in the repository:

https://github.com/MiSTer-devel/GBA_MiSTer/blob/master/src/gba_gpiodummy.vhd

You can keep the portlist and change the implementation to whatever is required to fulfill the functionality.


# Turn on GPIO Feature

As the GPIO Feature is based on normal gamepak addresses, 
games that don't use the GPIOs should not have them activated or the game will read wrong data.

Therefore the toplevel has a pin called "specialmodule" which should be set to '1' when testing the GPIO module with some game.

Once the first GPIO module is available in a public release, 
this switch will be handled as either menu option or quirk in the toplevel or autodetection.
