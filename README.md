# MiSTER Pi / MiSTer FPGA Offline Stock Install
This repository contains a complete snapshot installation of MiSTer FPGA. The default installation method for MiSTer software relies on many URLs that are blocked in certain countries. This distribution gets around those limitations by delivering a complete installation as a GitHub release.

## Installation 

1. Format a new SD card as ExFAT.
2. Download the latest [Offline Stock Release](https://github.com/Takiiiiiiii/MiSTER-Pi-Offline-Stock/releases)
3. Download [7-Zip](https://www.7-zip.org/) and use it to extract the .7z release to the root of your ExFAT SD card.
4. After you insert your SD card into your MiSTER and power it on, you should be greeted with a menu that includes Arcade, Computer, Console, Other, and Utility.

You can now add your ROMs to the '/games/' directory on the root of your card.

## Extras

If you want additional functionality, you can use Update All to install additional cores, files, and games. This script is not included in this distribution, but the installation instructions are provided here.

1. Download [update_all.sh](https://github.com/theypsilon/Update_All_MiSTer/blob/master/update_all.sh) and put it inside the '/Scripts/' folder on the root of your SD card.
2. Boot the system and press Escape on your keyboard to get to the System Settings menu.
3. Select Scripts -> Yes -> Update All, and use the menu to customize your installation.


## Credits

* [Mr-Fusion](https://github.com/MiSTer-devel/mr-fusion)
* [MiSTer_Favorites](https://github.com/wizzomafizzo/MiSTer_Favorites)
* [MiSTer Super Attract Mode](https://github.com/mrchrisster/MiSTer_SAM)
* [Wallpaper_Collection](https://github.com/RGarciaLago/Wallpaper_Collection)
