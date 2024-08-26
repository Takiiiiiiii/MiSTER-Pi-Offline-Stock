# Adventure Vision

## General Information
This is a port of the adventure vision core originally written by Arnim Laeuger in 2006. The system has 4 retail games, and two homebrew games. The core uses the folder AVision for its games, and no other setup is required.

## Technical Details
The screen of the Adventure Vision was a strip of 40 LEDs that reflected off a rapidly rotating mirror, similar to a grocery store scanner. This resulted in a 15 frames per second image of 150x40 pixels. The original system's display was extremely flickery as a result, and the shape of it "wobbled". The core has an option to try to emulate this, but it defaults to having the flicker off for comfort and safety. If you choose to try this feature, it seems to look best on very small CRTs.

## Button Layout
```
   1          1
 2   4  JS  4   2
   3          3
```
There are two sets of buttons, intended for multiplayer, which have slightly different layouts. On the core, both the first and second player controllers will have full access to the controls.