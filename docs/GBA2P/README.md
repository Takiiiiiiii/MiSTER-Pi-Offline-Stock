# [Gameboy Advance](https://en.wikipedia.org/wiki/Game_Boy_Advance) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki)

This branch is a special version for splitscreen multiplayer.
In case you are searching for the normal GBA, please go here:
https://github.com/MiSTer-devel/GBA_MiSTer

# HW Requirements/Features
SDRAM addon is required.

32MB SDRAM for games less than 32MB. 32MB games require either 64MB or 128MB module.

# Foldername
All Games and BIOS go to GBA2P folder. 

It is seperated from the normal GBA folder to ensure safe savegame handling.

You can create a symlink to GBA folder if you want to use the same games/BIOS.

# Bios
Opensource Bios from Normmatt is included, however it has issues with some games.
Original GBA BIOS can be placed to GBA folder with name boot.rom

PLEASE do not report errors without testing with the original BIOS

# Status
Normal and Multiplayer serial connection modes are implemented. 

UART and GPIO modes are missing.

Most popular games should work in multiplayer mode, but there are some games known that are not working.

Single Cart multiplayer is currently unsupported.

# Savegames
Saves created contain savegames for both players. 

For compatibility, all saves are 256Kbyte in size, 128 KByte for each player.

Saves can be copied from singleplayer, but only player 1 will have a savegame then.
"Dupe Save to GBA 2" option can be used to load singleplayer savegames for both players.

Saves can be copied to singleplayer, but when saved again in singleplayer, the second player savegame is lost.

# Loading different games

The option "Rom for second GBA" can be used to load two different games.
First load the game for Player 1 with the option off, then activate the option and load another game for player 2.
Both GBAs will reset on loading the second game.

Saving when playing two different roms will create a combined savegame with the gamename of the second loaded game,
which can be loaded again with the same load order next time.

Importing combined singleplayer savegames from different games must be handcrafted(concat padded 128kbyte per save in one file)

# Video Output
VGA will always output screen/core 2.

HDMi output can be selected to show:
- horizontal splitscreen
- vertical splitscreen
- screen 1
- screen 2

In case of splitscreen, a seperation line can be enabled in OSD, which will turn the last/first pixel black.

# Audio Output
Selectable in OSD:
- Core 1 to both Channels(left/right)
- Core 2 to both Channels(left/right)
- Mix both cores
- Core 1 to left Channel, Core 2 to right Channel

# Not included in this version:
- Savestates/rewind
- Fastforward
- 2x rendering
- Shadercolors
- CPU Turbo
- Cheats
