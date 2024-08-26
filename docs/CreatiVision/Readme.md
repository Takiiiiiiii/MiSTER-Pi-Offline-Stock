# VTech Creativision

VTech CreatiVision core for MiSTer FPGA by Kitrinx

## General description
The CreatiVision, also known as the "Dick Smith Wizzard" in Australia and New Zealand, was released in 1982 and is a console-cum-computer from the era of the Coleco Adam and Intellivision. The system would see 18 games released for it on cart, as well as a Visual Basic cart to allow writing code, and a cassette add-on for saving and loading code from Basic.

A novel feature of the system are the controllers. Two joysticks sit either side of a QWERTY keyboard on the console, each of which can be removed and rotated 90 degrees for gameplay. The unique aspect here is half of the keyboard is attached to each joystick and form additional buttons utilised in games which each had a simple overlay provided renaming the buttons in use. In addition to the keyboard buttons each joystick also had a button on each side. Despite the extra keyboard buttons, most carts only used two for start and select, and relied solely on the side buttons for gameplay.

The CreatiVision was slightly revised and released as the home computers the "Laser 2001" in West Germany and France, while in Finland it was released by Salora as the "Manager" with a Finnish keyboard layout and character set. These computers are fully supported in the core and can be experienced by loading the corresponding BIOS for the system. The computers boot straight into Basic.

## Setup
This core requires a BIOS. Any of the BIOSes will work, but the best one is for either the funvision or the Creativision. The Laser2001 bios doesn't have any real advantages. BIOS can be loaded either by naming it boot0.rom, or loading it from the menu. Boot1.rom can be a game of your choosing that you want loaded by default.

## ROM Compatibility
The roms for this system don't have a consistent format. All games have been tested to work using [this](http://www.madrigaldesign.it/creativemu/news.php) site as a reference. The rom loading also complies with the way mame loads them. Some packs may have older or other formatted roms which don't load correctly because they have a different data order.

## TODO
Casette loading is not finished yet. Right now you can load .bas file to have the system emulate typing them into the basic prompt. In the future this will be expanded to load proper audio casettes and enter the text directly into memory.
