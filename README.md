# MiSTER Pi / MiSTer FPGA Offline Stock Install
This repository contains a complete snapshot installation of MiSTer FPGA. The default installation method for MiSTer software relies on many URLs that are blocked in certain countries. This distribution bypasses those limitations by delivering a complete installation as a GitHub release.

## Installation 

1. Download [MiSTer Fusion](https://github.com/MiSTer-devel/mr-fusion/releases/download/v2.9/mr-fusion-v2.9.img.zip) and [Rufus](https://github.com/pbatard/rufus/releases/tag/v4.5)
2. With a 32GB SD card or greater connected to your PC, open Rufus and select the `mr-fusion-v2.9.img.zip` file, ensure your SD card is selected under `Device`, and then click start.
3. Put the formatted SD card into your MiSTER and power it on. After the Mr-Fusion installation finishes, disconnect the power cable and put the card back in your computer. 
4. Download the latest [Offline Stock Release](https://github.com/Takiiiiiiii/MiSTER-Pi-Offline-Stock/releases)
5. Download [7-Zip](https://www.7-zip.org/) and use it to extract the .7z release to the root of your ExFAT SD card. Overwrite any files when prompted.
6. After you insert your SD card into your MiSTER and power it on, you should be greeted with a menu that includes Arcade, Computer, Console, Other, and Utility.

You can now add your ROMs to the `/games/` directory on the root of your card.

## Update All
If you want additional functionality, you can use Update All to install additional cores, files, and games. This script is not included in this distribution, but the installation instructions are provided here.

1. Download [update_all.sh](https://github.com/theypsilon/Update_All_MiSTer/blob/master/update_all.sh) and put it inside the `/Scripts/` folder on the root of your SD card.
2. Boot the system and press Escape on your keyboard to access System Settings.
3. Select Scripts -> Yes -> Update All, and use the menu to customize your installation.

## Extras

* [0MHz DOS Collection](https://archive.org/details/0mhz-dos) (Extract games to the root of SD) 
* [AmigaVision Collection](https://archive.org/details/amigavision-2024)
* [Commodore Collection](https://misterfpga.org/viewtopic.php?t=1540)
* [MiSTer_OpenBOR](https://github.com/SumolX/MiSTer_OpenBOR) (Put OpenBOR_Install.sh in `/Scripts/` and execute to install. Download [OpenBOR Games](https://openborgames.com/category/games))
* [Cave Story Port](https://archive.org/details/cave-story-mister-fpga)

## Credits

* [Mr-Fusion](https://github.com/MiSTer-devel/mr-fusion)
* [MiSTer_Favorites](https://github.com/wizzomafizzo/MiSTer_Favorites)
* [MiSTer Super Attract Mode](https://github.com/mrchrisster/MiSTer_SAM)
* [Wallpaper_Collection](https://github.com/RGarciaLago/Wallpaper_Collection)


