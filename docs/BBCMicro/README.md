# BBC Micro B/Master 128K for [MiSTer Board](https://github.com/MiSTer-devel/Main_MiSTer/wiki)

This is the port of [BeebFpga](https://github.com/hoglet67/BeebFpga) by David Banks, Mike Sterling.


### Features and enhancements:
- Models B and Master 128K.
- Respective CPU per model for best compatibility: 6502 for B, 65C02 for Master 128K.
- Co-Processor module with 65C02.
- Support Secondary SD card as well as images on Primary SD card.
- Scandoubler with HQ2x for all modes.
- Support analog joysticks.
- Emulate joystick with mouse.
- Real Time Clock support with actual time.

### Installation:
Copy the *.rbf file to the root of the SD card. Copy *.vhd to BBCMicro folder.

### Supported formats:
Currently only **BEEB.MMB** format is supported. This is a container of multiple disks/apps with integrated Menu system.

Core supports secondary SD card which should be formatted in FAT16/FAT32. BEEB.MMB file should be placed first on the card.

Alternatively core supports *.VHD images on primary SD card - in this case secondary SD card is not required.

**VHD** image is just renamed BEEB.MMB file.

### Notes:
* BREAK key combo is **CTRL+F11**
* If autostart is disabled, then **SHIFT+CTRL+F11** performs reset+autostart. 
* If autostart is enabled, then **SHIFT+CTRL+F11** performs reset without autostart.
* Perform reset to apply the Model.
* You can place **boot.vhd** into BBCMicro folder to autoload it at start.

---
Sorgelig
