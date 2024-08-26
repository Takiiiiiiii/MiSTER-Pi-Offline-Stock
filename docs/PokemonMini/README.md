# [PokemonMini](https://en.wikipedia.org/wiki/Pokémon_Mini) for [MiSTer Platform](https://github.com/MiSTer-devel/Main_MiSTer/wiki)

# HW Requirements
SDRam module of any size is required

# Bootrom
PokemonMini_MiSTer comes with freebios, developed by team pokémé.
If you'd like to run an alternative bios, you can add bootrom files to the PokemonMini Folder and name it 'boot.rom'.

# Status
All official games should be playable.

# Features
- Zoom: The zoom is intended mostly for VGA output.
- Frame Blend (Flickerblend): 4 frames blending

# Refresh Rate
PokemonMini's LCD refresh rate is around 75Hz, but in reality, that varies depending on temperature, and framerate is usually capped at half that.
The core currently uses 4 framebuffers to do qudruple buffering, and refreshes the screen at 60Hz.

Commercial games take advantage of the LCD response time to create the illusion of additional shades by flickering an alternating grid of pixels. To support these additional shades, there is a 'Frame Blend' option for blending 4 frames to recreate this effect. Some homebrew go a step further, being able to produce 6 shades instead of the 3 shades that commercial games can produce. The core does not handle these as well, and further investigation in PokemonMini's LCD screen behavior would be needed to reproduce these effects more accurately.

# Missing Features
- IR functionality is not implemented.

# Special Thanks

* [asterick/scylus](https://github.com/asterick) for discussing pokemon mini details.
* [Robert Peip](https://github.com/RobertPeip) for helping out with HDL design problems.
* The MiSTer dev community on discord for all the help.

