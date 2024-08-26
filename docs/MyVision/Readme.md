<p align="center">
    <img style="width: 400px;" src="img/MyVision.gif">
</p>

# [My Vision](https://wikipedia.org/wiki/My_Vision) for [MiSTer](https://mister-devel.github.io/MkDocs_MiSTer/)
This is an FPGA implementation of the My Vision Console by Nichibutsu for the MiSTer FPGA platform.

## About the System
- Released only in Japan with only 6 Games/Cartridges.
- It did not use controllers, instead it had buttons on the console itself.
- The Direction Buttons (A,B,C & D) are mapped to the Cursor Keys, or you can use a Joystick
- The E button is mapped to the <kbd>Space Bar</kbd> or you can use the Fire Button on a Joystick.

Console Button to Keyboard Mapping

Console : |<kbd>1</kbd> | <kbd>2</kbd> | <kbd>3</kbd> | <kbd>4</kbd> | <kbd>5</kbd> | <kbd>6</kbd> | <kbd>7</kbd> | <kbd>8</kbd> | <kbd>9</kbd> | <kbd>10</kbd> | <kbd>11</kbd> | <kbd>12</kbd> | <kbd>13</kbd> | <kbd>14</kbd> | <kbd>A</kbd> | <kbd>B</kbd> | <kbd>C</kbd> | <kbd>D</kbd> | <kbd>E</kbd> 
----------|-|-|-|-|-|-|-|-|-|--|--|--|--|--|-|-|-|-|-|
Option A : |<kbd>1</kbd> | <kbd>2</kbd> | <kbd>3</kbd> | <kbd>4</kbd> | <kbd>5</kbd> | <kbd>6</kbd> | <kbd>7</kbd> | <kbd>8</kbd> | <kbd>9</kbd> | <kbd>0</kbd> | <kbd>-</kbd> | <kbd>=</kbd> | <kbd>⌫</kbd> | <kbd>\\</kbd> | <kbd>←</kbd> | <kbd>↑</kbd> | <kbd>↓</kbd> | <kbd>→</kbd> | <kbd>Space</kbd>
Option B: |<kbd>A</kbd> | <kbd>B</kbd> | <kbd>C</kbd> | <kbd>D</kbd> | <kbd>E</kbd> | <kbd>F</kbd> | <kbd>G</kbd> | <kbd>H</kbd> | <kbd>I</kbd> | <kbd>J</kbd> | <kbd>K</kbd> | <kbd>L</kbd> | <kbd>M</kbd> | <kbd>N</kbd> |  <kbd>←</kbd> | <kbd>↑</kbd> | <kbd>↓</kbd> | <kbd>→</kbd> | <kbd>Fire</kbd>

## Prepping Files
If your game is a zip and contains multiple files such as "f1" "f2" and so on, then you'll need to convert them to .bin for the core to be able to load it. First extract those files and then perform the following commands.

**Using MS-DOS/CMD:**
```
copy /B f1 + /B f2 + /B f3 Hanafuda.bin
```
   
**Using Linux/MiSTer:**
```
cat f1 f2 f3 > Hanafuda.bin
```
