# Acorn Electron

Port by David Wood - oldgit




## Introduction

This is a port of [ElctronFPGA](https://github.com/hoglet67/ElectronFpga) by David Banks, Mike Sterling. They have a good
description of the project here:   [Acorn Electron FPGA Project](https://www.mups.co.uk/post/2017/07/acorn-electron-fpga-project/)

## MMC Operation

Look for the ELK version of the beeb.mb and put it on the sdcard as boot.vhd

## Cassette Operation

Type Ctrl-F10 and boot into a prompt (not the MMC). Load a tape through the OSD, then type:

```
*TAPE
CHAIN""
```
That will start the tape loader.


## Notes from David Wood:


I used the front end for the BBC Micro by Sorgelig and adapted it for this port.

On start up you will need to ctrl-Break to clear the garbage on the screen. -- fix me

Put the Electron version of beeb.mb in games as boot.vhd (Acorn Electron Games & Magazines BEEB.MMB)


I cannot get used to the Func Number for Function Keys. -- Func = Caps Lock


I never had an Electron and the only time I saw one was when it was being used as a door stop
in the 'One Step Beyond' shop in Norwich.

