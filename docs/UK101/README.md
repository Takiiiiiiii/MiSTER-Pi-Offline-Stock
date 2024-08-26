# [Compukit UK101](https://en.wikipedia.org/wiki/Compukit_UK101) for [MiSTer](https://github.com/MiSTer-devel/Main_MiSTer/wiki)

Port by [danielb0](https://github.com/danielb0)

## Description

This core is a port of [Grant Searle's UK101 FPGA project](http://searle.x10host.com/uk101FPGA/index.html) to MiSTer FPGA. It is a reconstruction of a kit computer from the late 1970s, which was based on a 6502 processor that ran at 1 MHz and originally came equipped with 8Kb of RAM.

The core includes some enhancements over Grant's original project, such as extra selectable monitor software, two additional modes which simulate an Ohio Scientific C1P or C2P computer, selectable clock speed, selectable screen modes and selectable memory sizes. The OSI C2P mode also supports software control of text resolution, in order to support games which use it. Select "auto" mode from the menu, and then POKE 56832,1 sets high res, POKE 56832,0 sets it back to low res.

Basic programs can be loaded from text files, or via the UART at 9600 baud. Text files must have a .TXT extension. Instructions for loading can be found on Grant's page and in the [Compukit UK101 manual](http://uk101.sourceforge.net/docs/pdf/manual.pdf).

### Original sources

[Grant Searle's original UK101 FPGA site](http://searle.x10host.com/uk101FPGA/index.html)

### Acknowledgements
Many thanks to alanswx for the original text file loading code, and to Leslie Ayling for his help in adding the OSI mode to the core. Also, thanks to Doug Gilliland for the use of the outlatch.vhd code.

### Licenses 

#### Grant Searle's original license:
```
By downloading these files you must agree to the following:
The original copyright owners of ROM contents are respectfully acknowledged.
Use of the contents of any file within your own projects is permitted freely, but
any publishing of material containing whole or part of any file distributed here, 
or derived from the work that I have done here will contain an acknowledgement
back to myself, Grant Searle, and a link back to this page.
Any file published or distributed that contains all or part of any file from this 
page must be made available free of charge.
```


