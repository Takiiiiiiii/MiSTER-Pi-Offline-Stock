# [ZX Spectrum](https://en.wikipedia.org/wiki/ZX_Spectrum) for MiSTer Platform

Some verilog models from Till Harbaum [Spectrum](https://github.com/mist-devel/mist-board/tree/master/cores/spectrum) core were used in this project.

### Features:
- Fully functional [ZX Spectrum 48K, 128K, +3](https://en.wikipedia.org/wiki/ZX_Spectrum) and [Pentagon 128](https://en.wikipedia.org/wiki/Pentagon_(computer)) with correct CPU and Video timings.
- Pentagon 1024K and Profi 1024K memory interfaces.
- Turbo 7MHz, 14MHz, 28MHz, 56MHz.
- [ULA+ v1.1](https://sinclair.wiki.zxnet.co.uk/wiki/ULAplus) programmable palettes with extended Timex control.
- Timex HiColor, HiRes modes.
- TAP tape format with turbo (direct byte injection) and normal loading.
- TZX and CSW tape formats with fast(16x) and normal loading.
- Z80/SNA snapshot loading.
- [TR-DOS](https://sinclair.wiki.zxnet.co.uk/wiki/TR-DOS_filesystem) (Beta Disk Interface) - TRD(read/write) and SCL(read-only) images.
- [G+DOS](https://en.wikipedia.org/wiki/%2BD) (MGT +D Disk Interface) and IMG, MGT images (only in non +2A/+3 memory modes).
- +3 Disk drive usable with +3DOS.
- DivMMC with ESXDOS.
- [Multiface 128 and Multiface 3](https://en.wikipedia.org/wiki/Multiface) (in +3 mode) add-on.
- Memory snapshot save/load in +D and Multiface.
- Kempston Mouse.
- Joysticks: Kempston, Sinclair I/II, Cursor
- [General Sound](https://8bit.yarek.pl/interface/zx.generalsound/index.html) with 512KB-2MB of RAM
- [Turbosound-FM](http://speccy.info/TurboSound_FM) (dual YM2203 incl. dual YM2149)
- SAA1099

### Installation:
Copy the *.rbf to the root folder, copy boot.rom to games/Spectrum/ on the SD card.

### Notes about supported formats:
**TRD** is TR-DOS image used with Beta Disk Interface (BDI). To use TR-DOS you need to choose TRD image in OSD first. In 128K mode use menu to enter TR-DOS.
In 48K mode use command **RANDOMIZE USR 15616** to enter TR-DOS. In +3 mode, enter to 48K mode from the +3 BASIC via the USR0 command,
then issue **RANDOMIZE USR 15616**. Use command **RETURN** to leave TR-DOS.

**Note:** Not all TRD have autostart and it's cumbersome way to enter TR-DOS from 48K mode, there is GLUK ROM included. So insert TRD/SCL dosk and press **F11**, you will enter to GLUK menu, then choose **GLUK BOOT** where you can select the file to boot. That's all.

**IMG** is G+DOS image used with +D Disk interface. Although it's fully supported, i couldn't find any games on such disks. The main purpose of these images is to use snapshot function of +D and Multiface.

**MGT** is G+DOS and MasterDOS (SAM Coupe) image. It's similar to IMG but uses different layout. The main purpose is to transfer data to/from SAM Coupe.

**DSK** +3 disk format. In none- +3 modes, +D tries to mount it, however +3 disk images are not compatible with G+DOS.
The original +3 disk drive is a single-sided single-destiny drive, but this core supports double-sided double-destiny images, too.
An empty [DSDD image](https://github.com/MiSTer-devel/ZX-Spectrum_MISTer/tree/master/releases/dsdd720k.dsk.gz) is great for saving from Multiface.
***Note:*** in +3 mode, both the Beta and the +3 disk drive are supported, but only one image can be mounted, so both cannot be used at the same time.

**TAP** is simple tape dump format. It is possible to use normal and **turbo** loading (only if application uses standard loading routines from ROM). To load in turbo mode, you need to choose TAP file in OSD **first** and then start to load app through menu (128K) or by command **LOAD ""** (48K, 128K). To load TAP file in normal mode through internal AUDIO IN loop, you need to start loading through menu or command **first** and then choose TAP file though OSD. If application uses non-standard loader, then TAP file will be played in normal mode automatically. Thus it's safe to always choose the turbo mode. Some applications are split into several parts inside one TAP file. For example DEMO apps where each part is loaded after finish of previous part, or games loading levels by requests. The core pauses the TAP playback after each code part (flag=#255). If application uses standard loader from ROM, then everything will be handled automatically and unnoticeable. If app uses non-standard loader, then there is no way to detect the loading. In this case you need to press **F1 key** to continue/pause TAP playback. Do not press F1 key while data is loading (or you will have to reset and start from beginning). To help operate with TAP (for non-standard loaders) there is special yellow LED signaling:
- LED is ON: more data is available in TAP file.
- LED is flashing: loading is in process.
- LED is OFF: no more data left in TAP file.

In normal mode, while TAP loading, the following keys can be used:
- F1 - pause/continue
- F2 - jump to previous part (if pressed while pilot tone), or beginning of current part (if pressed while code is transferring).
- F3 - skip to next part

If game uses non-standard loader, then loading usually paused after loading of first part. Press **F1** to continue loading.

OSD option **Fast tape load** increases CPU frequency to 56MHz while tape loading.

Use **F10** key to switch into 48K basic (won't lock 48K mode) and automatically enter **LOAD ""** if game/app doesn't load from 128K menu.

### Turbo modes
You can control CPU speed by following keys:
- F4 - normal speed (3.5MHz)
- F5 - 7MHz
- F6 - 14MHz
- F7 - 28MHz
- F8 - 56MHz
- F9 - pause/continue
Speed can be controlled from OSD as well.

Due to SDRAM speed limitation 28MHz and 56MHz speeds include wait states, so effective CPU speed is lower than nominal.


### Memory Configurations with extra RAM:
- **Pentagon 512K** uses bits 6 and 7 in port 7FFD to access additional memory.
- **Profi 1024K** uses bits 0-2 in port DFFD to access additional memory.

### Mouse and Joystick:
Kempston mouse has no strict convention which bit (D0 or D1) reflects a main button. After each reset, the first button pressed on mouse (left or right buttons only) will be represented by bit D0 (other button will be represented by bit D1). So, if you are not satisfied by mouse button map, then simply press reset and then press other button first.
Due to port conflict with Kempston joystick, core uses autodetection. Any mouse activity will switch port to mouse control. Any joystick activity will switch port to joystick control.
Some games/apps autodetect the mouse. So, move the mouse or click its button before use such games/apps.

### Snapshots:
Core supports snapshot functionality of +D. In order to use it, you need to mount IMG or MGT image. ROM includes preloaded G+DOS image, thus you can mount IMG/MGT at any time (even while playing the game). **Note #1**: preloaded G+DOS has been patched to allow disk change on-the-fly. So, if you will load G+DOS from disk, then be careful - it may corrupt previous saves if you will change the disk! **Note #2:** only one disk image can be mounted at any time. Thus make sure if you use game from TRD image, the game won't save anything later to its disk. 

To save snapshot using +D (preferred way), press **F11 key**. You will see stripes on border and game will freeze. You can press following keys:
- 3 - to save the screen.
- 4 - to save 48K snapshot.
- 5 - to save 128K snapshot.
Original +D ROM requires to press additional Y/N keys in 128K mode to choose the correct screen buffer. Included ROM has been pre-patched to automatically detect the screen. So, just press 5 for 128K snapshot.

To load snapshot, just mount IMG/MGT and go to basic prompt where type **CAT 1** to list its content. Note the number of snapshot file. Then type **LOAD pX** where X is the number of shapshot file. For other disk commands please find and read G+DOS (MGT +D) manual.

### Multiface 128 and Multiface 3:
You can enter Multiface ROM using **RShift+F11**. Multiface 128 includes preloaded debugger (Genie) where you can trace or modify the game.
If you prefer to use bare Multiface 128 ROM then do following procedure: Press and hold **ESC**, then press **RShift+F11**.
You will be able to use bare Multiface ROM by simple subsequent presses of **RShift+F11** till core reload. Multiface provides snapshot functionality by saving to IMG/MGT disks. Please find and read Multiface 128 manual.
**Note:** Multiface 128 expose its port, thus if game has protection against Multiface, it won't work, unless you press (o)ff before you exit from the Multiface menu. Thus using +D snapshot is prefered.
When using the Spectrum +2A/3 mode, the Multiface 3 is supported. There's no Genie for the +3, but there are useful toolkit routines in the stock ROM.

### DivMMC
Supported both VHD images and secondary SD card. Default **auto** mode makes DivMMC hidden til VHD image gets selected.
You have to get ESXDOS package, rename **ESXMMC.BIN** to **boot1.rom** and place to **games/Spectrum/**
Make sure boot1.rom and files inside VHD (or SD card) are from the same ESXDOS version.


### Special Keys:
- Ctrl+F11 - warm reset
- Alt+F11 - cold reset will disk unload
- Ctrl+Alt+F11 - reset to ROM0 menu
- F10 - switch to Basic 48 (without 48K lock) and issue **LOAD""**
- RShift+F10 - same as F10 with 48K lock
- F11 - enter +D snapshot menu (or ROM0 menu if IMG/MGT not mounted) or DivMMC file browser.
- RShift+F11 - enter Multiface 128 menu
- F12 - OSD menu

Quick switch between models:
- Alt+F1 - ZX Spectrum 48K (48KB, ULA-48)
- Alt+F2 - ZX Spectrum 128K (128KB/+2, ULA-128)
- Alt+F3 - ZX Spectrum +3 (128KB +3, ULA-128)
- Alt+F4 - Pentagon 48K (48KB, Pentagon)
- Alt+F5 - Pentagon 128K (128KB, Pentagon)
- Alt+F6 - Pentagon 1024K (1024KB, Pentagon)
CPU speed will reset to original.

### Download precompiled binaries and system ROMs:
Go to [releases](https://github.com/MiSTer-devel/ZX-Spectrum_MISTer/tree/master/releases) folder.

### boot.rom Structure

boot.rom is a collection of required ROMs, however it does not contain a full set of ROMs for each supported machine and/or hardware, it only includes the necessary subset.

| N | Base Offset (Hex) | Chunk Size (Hex) | SHA1 Of the Original | Description |
| ---: | ---: | ---: | :---: | :--- | 
|  1 | 00000 | 4000 | 5f40f5af51c4c1e9083eac095349d7518545b0e0 | glukpen.rom Mr Gluk Boot Service version 6.61 |
|  2 | 04000 | 4000 | ??? (doesn't match known 5.04t or 5.04t-bugfixed) | TR-DOS 5.04T |
|  3 | 08000 | 4000 | d07fcdeca892ee80494d286ea9ea5bf3928a1aca | 128p-0.rom (128K editor and menu), the first half of the Pentagon 128 ROM |
|  4 | 0C000 | 4000 | 80080644289ed93d71a1103992a154cc9802b2fa | 128-1.rom English 128 ROM 1 (48K BASIC) |
|  5 | 10000 | 4000 | 62ec15a4af56cd1d206d0bd7011eac7c889a595d | plus3-4.1-english-0.rom English +2B/+3B v4.1 ROM 0 (128K editor) |
|  6 | 14000 | 4000 | 1a7812c383a3701e90e88d1da086efb0c033ac72 | plus3-4.1-english-1.rom English +2B/+3B v4.1 ROM 1 (128K syntax checker) |
|  7 | 18000 | 4000 | 8df145d10ff78f98138682ea15ebccb2874bf759 | plus3-4.1-english-2.rom English +2B/+3B v4.1 ROM 2 (+3DOS) |
|  8 | 1C000 | 4000 | be365f331942ec7ec35456b641dac56a0dbfe1f0 | plus3-4.1-english-3.rom English +2B/+3B v4.1 ROM 3 (48K BASIC) |
|  9 | 20000 | 2000 | 6b841dc5797ef7eb219ad455cd1e434ca3b9d30d | plusd-1.A.rom MGT's +D disk interface ROM v1.A |
| 10 | 22000 | 2000 | **CUSTOM** | plusd-sys.bin MODIFIED version of the +D system code, based on the chunk CONFIG2 from "Plus D System Tape" |
| 11 | 24000 | 2000 | 8df204ab490b87c389971ce0c7fb5f9cbd281f14 | mf128-87.2.rom (CRC32: 78ec8cfd) Miltuface 128 (87.2) |
| 12 | 26000 | 2000 | 926425b3e84180683f0872aee9ebf6f4b9dfaf5f | genie128-2.rom GENIE 128K V2.1, the second half of the Genie 128 Disassembler ROM |
| 13 | 28000 | 2000 | 5d74d2e2e5a537639da92ff120f8a6d86f474495 | mf3-3.C.rom (CRC32: 2d594640) Multiface 3 (3.C) |
| 14 | 2A000 | 2000 | N/A | zeroes.bin unused 8K, padding for the MF3 ROM to fill remaining space in 16K block |
| 15 | 2C000 | 4000 | 5ea7c2b824672e914525d1d5c419d71b84a426a2 | 48.rom BASIC for 16/48K models |
