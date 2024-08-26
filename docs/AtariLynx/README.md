# [Atari Lynx](https://en.wikipedia.org/wiki/Atari_Lynx) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki)


# HW Requirements
SDRam module of any size is required

# Bootrom
You need to add the Bootrom file(often called lynxboot.img) to the AtariLynx Folder and name it: boot.rom

Checksum for valid Bootrom:

SHA-1:
E4ED47FAE31693E016B081C6BDA48DA5B70D7CCB

MD5:
FCD403DB69F54290B51035D82F835E7B

# Status
All official games should be playable.
Most Homebrew works.

# Features
- Savestates
- FastForward - speed up game by factor 4, hold button or tap Button to toggle
- CPU GPU Turbo - give games additional computation power
- Rewind: go back up to 80 seconds in time
- Orientation: rotate video by 90 or 270 degree
- 240p mode: doubled resolution, mainly for CRT output
- Flickerblend: 2 or 3 frames blending like real Lynx Screen

# Refresh Rate
Lynx uses custom refresh rates from ~50Hz up to ~79Hz.
Some games switch between different modes.
To compensate you can either:
- live with tearing
- Buffer video: triple buffering for clean image, but increases lag
- Sync core to 60Hz: Run core at exact 60Hz output rate, no matter what internal speed is used

# Rotation
Lynx has built in rotation, supported by most games, using the Joypad Keys "Option2" + "Pause"

# Savestates
Core provides 4 slots to save and restore the state. 
Those can be saved to SDCard or reside only in memory for temporary use(OSD Option). 
Usage with either Keyboard, Gamepad mappable button or OSD.

Keyboard Hotkeys for save states:
- Alt-F1..F4 - save the state
- F1...F4 - restore

Gamepad:
- Savestatebutton+Left or Right switches the savestate slot
- Savestatebutton+Pause+Down saves to the selected slot
- Savestatebutton+Pause+Up loads from the selected slot

# Rewind
To use rewind, turn on the OSD Option "Rewind Capture" and map the rewind button.
You may have to restart the game for the function to work properly.
Attention: Rewind capture will slow down your game by about 0.5% and may lead to light audio stutter.
Rewind capture is not compatible to "Pause when OSD is open", so pause is disabled when Rewind capture is on.

# Missing features
Comlynx/UART only implemented for Interrupts
Custom external EEPROM not supported(not used in official games, only homebrew)