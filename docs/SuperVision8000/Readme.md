<p align="center">
    <img style="width: 400px;" src="img/BandaiSuperVision8000.jpg" title="Image courtesy of Wikipedia">
</p>

# [Bandai Super Vision 8000](https://wikipedia.org/wiki/Bandai_Super_Vision_8000) for [MiSTer](https://mister-devel.github.io/MkDocs_MiSTer/)
This is an FPGA implementation of the Super Vision 8000 by Bandai for the MiSTer FPGA platform.

## Controllers
- Support for two keypad controllers using a combination of Joystick and the Keyboard.
- The controllers don't have Fire buttons, but for convenience, Fire button 1 is mapped to the <kbd>*</kbd> and Fire button 2 is mapped to <kbd>#</kbd>, which seem the most commonly used "Action/Fire buttons"
- Player 1 is typically the Right Controller and Player 2 is the Left Controller.
- Player 1 Keypad is mapped to the Numpad while Player 2 uses the main keys.
- Keypad keys are also mappable to multi-button controllers (ex Coleco/Intv/Jaguar with usb adapter)

Player 2 | Player 1
-------- | --------
Keyboard | Numpad
<kbd>1</kbd><kbd>2</kbd><kbd>3</kbd> | <kbd>1</kbd><kbd>2</kbd><kbd>3</kbd>
<kbd>Q</kbd><kbd>W</kbd><kbd>E</kbd> | <kbd>4</kbd><kbd>5</kbd><kbd>6</kbd>
<kbd>A</kbd><kbd>S</kbd><kbd>D</kbd> | <kbd>7</kbd><kbd>8</kbd><kbd>9</kbd>
<kbd>Z</kbd><kbd>X</kbd><kbd>C</kbd> | <kbd>*</kbd><kbd>0</kbd><kbd>-</kbd>
