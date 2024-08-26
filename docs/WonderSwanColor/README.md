# [WonderSwan](https://en.wikipedia.org/wiki/WonderSwan) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki)


# HW Requirements
SDRam module of any size is required

# Bootrom
You need to add Bootrom files for both WonderSwan and WonderSwan Color to the WonderSwan Folder and name it:  
boot.rom -> WonderSwan bootrom  
boot1.rom -> WonderSwan Color bootrom

Checksums for valid Bootroms:

WonderSwan (4Kbyte)  
SHA-1: 4015BCACEA76BB0B5BBDB13C5358F7E1ABB986A1  
MD5: 54B915694731CC22E07D3FB8A00EE2DB

WonderSwan Color (8Kbyte)  
SHA-1: C5AD0B8AF45D762662A69F50B64161B9C8919EFB  
MD5: 880893BD5A7D53FFF826BD76A83D566E

# Status
Most official games should be playable.

Not working games:
- cho denki card battle yofu makai kikuchi shugo

# Features
- Savestates
- FastForward - speed up game by factor 2.5, hold button or tap Button to toggle
- CPU Turbo - give games additional computation power
- Rewind: go back up to 20 seconds in time
- Orientation: rotate video by 90 or 270 degree
- Flickerblend: 2 or 3 frames blending

# Refresh Rate
WonderSwan uses a refresh rate of 75.4Hz.  
You can choose to run the core at either 60Hz(compatibility mode) or 75.4Hz.

For 60Hz mode you can either:
- live with tearing
- Buffer video: triple buffering for clean image, but increases lag

For 75.4Hz mode:
Please use "Sync core to Video -> On" to help the core sync back to video after reset, savestate, pause, fastfoward.

# Rotation
WonderSwan has built in rotation.  
With option autorotate the image will rotate according to requests from the game itself.  
Or you can set a fixed rotation.

# Savestates
Core provides 4 slots to save and restore the state.  
Those can be saved to SDCard or reside only in memory for temporary use(OSD Option).  
Usage with either Keyboard, Gamepad mappable button or OSD.

Keyboard Hotkeys for save states:
- Alt-F1..F4 - save the state
- F1...F4 - restore

Gamepad:
- Savestatebutton+Left or Right switches the savestate slot
- Savestatebutton+Start+Down saves to the selected slot
- Savestatebutton+Start+Up loads from the selected slot

# Rewind
To use rewind, turn on the OSD Option "Rewind Capture" and map the rewind button.  
You may have to restart the game for the function to work properly.  
Attention: Rewind capture will slow down your game by about 0.5% and may lead to light audio stutter.  
Rewind capture is not compatible to "Pause when OSD is open", so pause is disabled when Rewind capture is on.

# Missing features
- All Multiplayer/Internet features
- Internal EEPROM (Name, Birthdate) not saved to SDCard
