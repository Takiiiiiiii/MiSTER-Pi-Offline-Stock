# Using purchased ROMs (gog-romset.xml)

Good Old Games (at least the Linux versions), Humble Bundle store and possibly
other sellers contain the image of individual ROM chips, unlike the Darksoft
rom pack which preprocessed these images.

This document will help you locate the ROM files in an installed game, get them
where you need them, and get the most out of your purchase.

Note: gog-romsets.xml needs to be renamed to romsets.xml for these games to function.

## BIOS images

Chances are, your purchase contains all the ROM images you need for MiSTer
(see the top-level README file in this repository), maybe located in an
archive named `neogeo.zip`.

## Locating game ROM images

You will need to do this once per game.

Once you have installed a game, you will need to locate the game ROMs.

Plain rom images have names which should look like `201-p1.p1` (number, dash,
one or two letters, a number, dot, one or two letters, a number). The number
identifies the game, and is listed in the tables below.

Chances are these files will be in a `.zip` archive. For Metal Slug, they would
be in a file named `mslug.zip`, for example.

Locate your game in the table below. In your MiSTer NeoGeo folder
(`/games/NeoGeo`), create a folder named like the
game (this would be `mslug` for Metal Slug) and put the ROM images there
(extracted from the `.zip` file if any).

Some games contain come in more than one version (ex: a Korean version). In
this case, create the folders listed in the "other versions" column, and they
will appear. Unless otherwise noted, you do not have to put anything in these
folders - they are just here to let MiSTer know these versions should be
displayed. Note: you must keep the main folder, as it contains the ROMs
actually being used.

## Game list

Grouped by MiSTer SDRAM requirements.

### 32 MB

| Number | Name | Title | Other Versions | Notes |
| --- | --- | --- | --- | --- |
| 056 | `aof2` | Art of Fighting 2 | `aof2a` |  |
| 041 | `bstars2` | Baseball Stars 2 |  |  |
| 058 | `fatfursp` | Fatal Fury Special | `fatfurspa` |  |
| 220 | `ironclad` | Iron Clad | ironclado | Most ROM names start with `proto_` |
| 016 | `kotm` | King of the Monsters | `kotmh` |  |
| 201 | `mslug` | Metal Slug |  |  |
| 201 | `mslug2` | Metal Slug 2 | `mslug2t` | `mslug2t` requires the [3rd-party "turbo" patch](http://blog.system11.org/?p=1442). This will produce the `941-p1.p1` file which you must place in the `mslug2t` folder. |
| 063 | `samsho2` | Samurai Shodown II | `samsho2k` `samsho2k2` |  |
| 200 | `turfmast` | Neo Turf Masters |  |  |
| 224 | `twinspri` | Twinkle Star Sprites |  |  |

### 64 MB

| Number | Name | Title | Other Versions | Notes |
| --- | --- | --- | --- | --- |
| 239 | `blazstar` | Blazing Star |  |  |
| 234 | `lastblad` | Last Blade (The) | `lastbladh` `lastsold` |  |
| 089 | `pulstar` | Pulstar |  |  |
| 240 | `rbff2` | Real Bout Fatal Fury 2 | `rbff2h` `rbff2k` |  |
| 246 | `shocktr2` | Shock Troopers - 2nd Squad |  |  |
| 238 | `shocktro` | Shock Troopers | `shcktroa` |  |

### 96 MB

(none working)

### 128 MB

(none)
