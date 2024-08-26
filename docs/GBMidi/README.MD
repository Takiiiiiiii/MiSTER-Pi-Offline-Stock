# GBMidi core for [MiSTer FPGA](https://mister-devel.github.io/MkDocs_MiSTer/)

A sound module for sending midi data to the sound hardware of a Game Boy (or multiple), utilizing gbc_snd from Gameboy_MiSTer by Tim Harbaum and Sorgelig, and using code from Input Tester by JimmyStones (see below).

## Instructions

It works with USB Midi keyboard/controllers natively, just press right on the OSD then select UART mode, Connection: MIDI, MidiLink: USB, then save. If you want to control via UDPMidi you will need to edit the Midilink.ini file located in `./linux/` on the MiSTer's MicroSD card. Add the following entry:

```ini
[GBMIDI]
UDP_BAUD            = 31250
```

For Midi Din, use any of the existing methods to plug Din into MiSTer, then choose Din under Midi Source (first option on the main OSD screen). Or, you can use "Musical Gamepad" to play notes using the face buttons of a game controller. CAUTION: MIDI IS BYPASSED WHEN MUSICAL GAMEPAD IS ON!

You can also use Binarybond007's [udpmidi version 2](https://github.com/bbond007/UDPMIDI20) alongside [loopmidi](https://www.tobias-erichsen.de/software/loopmidi.html) to [play midi from your computer over the network using UDP packets](https://www.youtube.com/watch?v=1LbvnLnmczY) (that's what the UDP_BAUD setting above is for).

By default, it dedicates a midi channel per voice, so midi channel 1 to pulse1, channel 2 to pulse2, channel 3 to wave, channel 4 to noise. You can also change the default channel assignments via the "Midi Ch 1 Voice" OSD setting, where you can cycle which voice (pulse1, 2, wave or noise) is being played by midi channel 1 (the default for midi controllers), and the others cycle to suit, only ever using channels 1-4.

In Auto-Polyphony mode, it utilizes 4 instances of the gbc_snd module to allow for 8 note polyphony (using pulse1 and 2 of each instance), using only midi channel 1!

Some settings don't work with others, as indicated by settings being greyed out. Play with it to see what can be done. Note, turning echo on while auto-poly is on will result in no sound (they can't be used together).

Each voice has its own settings, in which the "Patch" setting collects settings together into patches, which you can see reflected in the settings as you cycle between the patches. Note echo and auto-poly are affected by Pulse 1 patches.

Wave specifically has the "waveform" setting for switching between an assortment of preset waveforms. More to come (feel free to request them through whatever means of communication you'd like). Custom waveform building is planned but out of the scope of this release.

Note the lowest usable note for all voices is C2 (2 octaves below middle C), any lower and things get... funny. The Wave "kick" patch only works as intended at C7 and above (3 octaves above middle C). Noise is "functional" past G4 or so (G above middle C).

This is in active development so expect to see more from it in the future! :)

If you like this and would to see it (and/or future projects) flourish, please consider joining my patreon. Your contribution can directly impact the time I can spend working on these projects rather than the "day job". :)

https://www.patreon.com/user?u=6046340

### License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

##	MiSTer Input Tester Readme

### Acknowledgements

Created by JimmyStones (http://github.com/jimmystones), with thanks to:
- alanswx (https://github.com/alanswx) for ideas, cross-platform simulation support, and the tutorial this core was based on
- Jotego (https://github.com/jotego) for his very tidy JTFRAME modules
- Darrin Cardani for the quality YM music
- Porkchop Express (https://misteraddons.com/) for testing a bunch of devices I couldn't
- M. Walrus (@WalrusFPGA) for more testing
- Sorgelig (https://github.com/sorgelig) for testing, finding bugs and suggesting new features.  Oh, and the MiSTer project :)

### Hardware

The InputTest core is based on my Aznable 'custom hardware' project.  See the main repo for hardware and software details, build instruction, etc 
https://github.com/JimmyStones/Aznable 

### License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
