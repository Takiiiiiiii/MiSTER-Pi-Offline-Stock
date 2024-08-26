![](https://github.com/modalmodule/GenMidi_MiSTer/blob/main/GenMidiscreenie.png)
# GenMidi core for [MiSTer FPGA](https://mister-devel.github.io/MkDocs_MiSTer/)

A sound module/synthesizer for sending midi data to the sound hardware of the Sega Genesis/Mega Drive, utilizing jt12/jt89 and misc other related modules by Jose Tejada Gomez, genesis_lpf/audio_iir_filter by Gregory Hogan, and using code from Input Tester by JimmyStones (see below), as well as from ADCTest by David Shadoff.

## Features

- Play sound from all 10 voice channels; 6 FM, 3 PSG, and 1 noise, using a Midi channel per voice (1 to FM0, 2 to FM1... 7 to PSG0, etc).
- Play either with Midi devices (USB, DIN, or UDP) or even a GamePad!
- Choose from 127 built in FM patches from classic Genesis titles (see instructions).
- Load custom FM patches (using TFI format), or even an entire 127 FM Patch Bank (made using external software, see instructions).
- Use FM5 as DAC sampler, with Kick and Snare samples loaded (see instructions).
- Auto-vibrato per voice.
- Vibrato using Modwheel (or Midi CC1).
- Modwheel to Modulating Operators (altering amount of frequency modulation) (or Midi CC2).
- Pitch Bend wheel functionality.
- Echo FM0 to FM1.
- Echo PSG0 to PSG1.
- Detune PSG1 (for classic tone when using echo PSG0 to PSG1).
- Unison FM0 + PSG0 (or combine all three for epic lead setting).
- Auto-Polyphony: hold multiple notes and the core routes each to an available FM voice channel (up to the 6 the YM2612 has)
- Visual: choice between Data (notes per voice channel and patch choice), Scope (realtime waveform of summed signal), or both.

## Instructions

It works with USB Midi keyboard/controllers natively, just press right on the OSD then select UART mode, Connection: MIDI, MidiLink: USB, then save. If you want to control via UDPMidi you will need to edit the Midilink.ini file located in `./linux/` on the MiSTer's MicroSD card. Add the following entry:

```ini
[GBMIDI]
UDP_BAUD            = 31250
```

For Midi Din, use any of the existing methods to plug Din into MiSTer, then choose Din under Midi Source (first option on the main OSD screen). Or, you can use "Musical Gamepad" to play notes using the face buttons of a game controller. CAUTION: MIDI IS BYPASSED WHEN MUSICAL GAMEPAD IS ON!

You can also use Binarybond007's [udpmidi version 2](https://github.com/bbond007/UDPMIDI20) alongside [loopmidi](https://www.tobias-erichsen.de/software/loopmidi.html) to [play midi from your computer over the network using UDP packets](https://www.youtube.com/watch?v=1LbvnLnmczY) (that's what the UDP_BAUD setting above is for).

By default, it dedicates a midi channel per voice, so midi channel 1 to FM0, 2 to FM1... 7 to PSG0, etc. You can also change the default channel assignments via the "Selected Voice" OSD setting, where you can cycle which voice (FM0, FM5 (for sample use), PSG0 or noise) is being played by midi channel 1 (the default for midi controllers). This also effects which voice the GamePad plays.

In Auto-Polyphony mode, it utilizes all 6 FM voice channels for 6 note polyphony, using only midi channel 1!

Some settings don't work with others, as indicated by settings being greyed out. Play with it to see what can be done. Note, turning echo on while auto-poly is on will result in no sound (they can't be used together).

Each voice channel has its own settings, for example FM voices have "Patch" which lets you choose the patch (details below), each voice channel (except Noise) has "Vibrato", PSG/Noise have "Fade Out" and "Fade Speed", and PSG1 has "Detune" (for classic tone when using echo PSG0 to PSG1).
FM5 has "FM5 as sampler (DAC)" which puts FM5 in DAC mode, and subsequently can be used to play back a kick drum and snare drum sample, kick mapped to every note from C2 (2 octaves below middle C) and lower (displayed as C3 in the data display), and snare mapped to every note above that (following standard mapping for midi drum kits). Note when FM5 is in DAC mode it is no longer a part of auto-polyphony.

FM patches can be changed using different methods: 
- To start there is 4 patches to cycle between in the OSD, per FM voice channel, the last being a custom slot, where if selected, you can then load a TFI file (option directly below the patch setting), which needs to be placed in the GenMidi folder of the sd card ahead of time. If FM0 is changed while echo to FM1 is set, it will update FM1's patch as well, likewise if auto-poly is set, all FM voice channels will be updated with FM0's patch (upon change only).
- If you press R on the GamePad, the patch choice for FM0 will switch out of OSD mode, and instead increment within the 127 patches within the Patch Bank, the default of which has a collection of patches from classic games (listed [here](https://github.com/modalmodule/GenMidi_MiSTer/blob/main/patchlist.txt), in patchlist.txt). Pressing L will decrement the patches, and returning to "0" (Titled OSD on the data display), will revert to the OSD-based patch choice. Same behaviors from FM0 for echo and auto-poly as listed in previous bullet.
- Midi Program Change messages can be sent and have the same behavior as L and R on the GamePad, but are *per Midi channel* (see Midi Capability Details section).
- Finally, you can also load an entirely custom 127 Patch Bank, but you need to make it/acquire it and place it in the GenMidi folder first, then can choose "Load Patch Bank *.GPB" toward the bottom of the main OSD page. Creating the patch bank can be done through [this](https://github.com/modalmodule/GenMidi_MiSTer/tree/main/sw), GenTFIstoPBank.exe in /sw. 

Midi Capability Details:
- Midi CC1 (ModWheel default CC) is set to enable/disable vibrato per channel. This can be changed to affect Modulator Operators instead, via the OSD ("ModWheel to:" setting), in which case it affects their level, and thus the Frequency Modulation amount.
- CC2 is dedicated to Modulation Operator manipulation (for those using gear that can select CCs, the "ModWheel to:" setting is for basic controller use)
- CC10 is for panning, which the YM2612 (FM chip) is only capable of hard panning, and the PSG/noise chip has no panning capability.
- Sustain, Pitch Bend, and velocity work as expected.
- Program Change messages select the patch from the patch bank based on their value - 1 (midi data starts at 0 despite user facing data showing 1) for anything > 1, and revert to OSD choice for 1 (like GamePad L and R). This is *per Midi Channel*, as in Midi channel 1 program change message will affect FM0, 2 affects FM1 etc.

Note the lowest usable note for PSG is A3 (1 octave+ below middle C), any lower and things get... funny. Meanwhile FM can go all the way to what would be C-1, but is mapped through the data display as C0.

OSD Settings can be saved with "Save Settings" on OSD second screen (press right from main screen), however this doesn't save any custom TFIs or Patch Bank, but I will implement a separate "save state" feature for those (thanks @tsc for the question that led to the idea for this).

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
