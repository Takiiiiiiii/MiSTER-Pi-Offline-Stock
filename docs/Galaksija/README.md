# Galaksija FPGA core for MiSTer

This is a FPGA implementation of Galaksija - an old Ex-Yu computer from the 1980s. It is ported from MiST and originally created by [Gehstock](https://github.com/Gehstock/Mist_FPGA/tree/master/Computer_MiST/Galaksija_MiST).

It is a work in progress and has several issues that need to be addressed. I've added the tape drive support and fixed the CPU clock which was much higher than the original.

![img](img/galaksija.jpg)

## How to install

Download the latest .rbf from releases folder and place it on your SD card. Create a folder called "Galaksija" and download the .gtp files you can find in this repository under "software".

## Running the core

After turning on, first thing you see is a "diamond" logo and prompt. You are in basic and can either start programming or load a pre-existing program from tape.

To load a program, type:
```
OLD
```
and press enter. Then press F12, select load and find the .tap tape file to upload. After the progress bar disappears and the prompt returns, type RUN and off you go!

![img](img/loading.gif)

## Basic

If you decide to start programming, you might find it useful to know the basic dialect Galaksija uses. Here is an example program:

```
10 INPUT N
20 Y=1
30 FOR I=1 TO N
40 Y=Y*I
50 NEXT I
60 PRINT Y
```

Commands:

```
ARR$, BYTE, CALL, CHR$, DOT, EDIT, ELSE, EQ, FOR, GOTO, HOME, IF, INPUT, KEY, LIST,
MEM, NEW, NEXT, OLD, PTR, PRINT, RETURN, RND, RUN, SAVE, STEP, STOP, TAKE, UNDOT,
USR, VAL, WORD
```

Some aditional ones are available from ROM B.

More details about the available commands can be found [here](https://en.wikipedia.org/wiki/Galaksija_BASIC). 

### About the computer

* Released:  1983
* CPU:	     Zilog Z80A clocked at 3.072MHz
* RAM:	     2-6KB
* ROM:       4-8KB (ROM A, ROM B and character ROM)
* Display:	 64x48 monochrome
* Input:	 Keyboard
* Storage:   Casette drive
  

#### Memory map:

* 0000-0FFF  ROM A
* 1000-1FFF  Reserved for ROM B
* 2000-2037  Keyboard map
* 2038-203F  Latch
* 2040-27FF  Latch and keyboard repeated 31 times
* 2800-2BFF  Video RAM
* 2C00-3FFF  On-board RAM
* 4000-FFFF  RAM expansion


## Known issues

Some accuracy is lost for having own routines to generate video as opposed to implementing the composite video generation logic.  

## Miscellaneous tipes

* F1 and F2 serve as Repeat and List buttons.

## License

This project is licensed under the MIT License.

## Acknowledgments

* Gehstock
* Damir
* Voja Antonic
* Dejan Ristanovic
