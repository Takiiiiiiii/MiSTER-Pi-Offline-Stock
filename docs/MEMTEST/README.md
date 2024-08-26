# MemTest - Utility to test SDRAM daughter board.

## Memtest screen:

![MemTest screen](img/memtest.png)

 1. Auto mode indicator (animated),
 2. Test time passed in minutes,
 3. Current memory module frequency in MHz,
 4. Memory module size:
    * 0 - no memory board detected
    * 1 - 32 MB
    * 2 - 64 MB
    * 3 - 128 MB
 5. Number of of passed test cycles (each cycle is 32 MB),
 6. Number of failed tests.

## Controls (keyboard)
* Up - increase frequency
* Down - decrease frequency
* Enter - reset the test
* C - on 128MB module switches between chips.
* A - auto mode, detecting the maximum frequency for module being tested. Test starts from maximum frequency.
With every error frequency will be decreased.

## Controls (gamepad)
* Up - increase frequency
* Down - decrease frequency
* Start - reset the test
* B - on 128MB module switches between chips.
* A - auto mode, detecting the maximum frequency for module being tested. Test starts from maximum frequency.
With every error frequency will be decreased.

Test is passed if amount of errors is 0. For quick test let it run for 10 minutes in auto mode. If you want to be sure, let it run for 1-2 hours.
Board should pass at least 130 MHz clock test. Any higher clock will assure the higher quality of the board.
