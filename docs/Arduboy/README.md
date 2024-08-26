# Arduboy_MiSTer

Arduboy core for MiSTer, ported by Dan O'Shea and based on Iulian Gheorghiu's atmega core:

https://github.com/MorgothCreator/atmega-xmega-soft-core

A collection of .bin files converted and tested so far can be found here (you can hit the green 'Clone or download' button, and then 'Download ZIP' to get them all at once):

https://github.com/uXeBoy/ArduboyCollection

Arduboy .hex files first need to be converted to .bin using hex2bin (and be sure to use the command line option `-l 8000` to pad the files out to 32K):

https://sourceforge.net/projects/hex2bin/

TODO: work on more complete sound support, look at making EEPROM non-volatile, improve stability (some games will randomly reset, or not run at all), pull requests / improvements welcome!
