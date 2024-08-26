# ADCTest - Utility to test ADC input and signal

## General description
This core reads digital sample values from the ADC input and displays them graphically on-screen in real time, and can also pipe the sound digitally to the sound output.  Depending on the range selected (3.3V or Audio Line In), the display is slightly different.

The core is simple enough that any developer interested in working with ADC - or creating their own core - may wish to consult the code, comparing it against the "Template-MiSTer" core, from which it is derived.

This core is now written to support stereoo input, with RED signifying the RIGHT channel, and WHITE signifying the LEFT channel (as per convention).  For the LEFT channel input, the signal is conveyed through the tip of the 3.5mm plug, the RIGHT channel is the mid-section 'sleeve' on the plug (and ground is the large section of the shank of the plug).

## Technical Details

### The ADC
* The ADC is supported by a module provided by the framework, "ltc2308".  This chip can sample mulitple inputs simultaneously, to a precision of up to 12 bits, limited primarily by the speed of the SPI communication bus bas to the FPGA.  There is some protocol overhead necessary for communication, but the framework takes care of that for us.  In our case, we invoke it to sample 1 input, at 48KHz, and communicate with a 50MHz SPI frequency.
#### Range
* The value returned is 12 bits in size, with each increment being roughly equivalent to 1 millivolt in value.  This means that the range covers roughly 4.1 Volts... but since this chip is almost certainly driven by 3.3V supply rails, I don't expect that values above 3.3V are trustworthy - and may even be unhealthy for the chip.
* The ADC chip is fundamentally a DC voltage sensor, and could basically be used as a voltmeter within its limited range.  (Be careful about polarity though !)
* However if you connect a loose cable to it, you will notice that the value drifts toward the center of that range.  This is effectively what would take place with an "AC Coupling", used in audio equipment, where a capacitor is used in series to the signal, in order to decouple it and allow only the AC signal to pass.

### Structure/How it Works
* The ADC digital value can be (via OSD) piped to the audio output, and this is done at the frequency which it arrives (48KHz), so there should be no signal degradation.
* For display purposes, the current value of the ADC is grabbed at the beginning of each scanline (roughly 15.75 KHz), for display on that scanline.  Instead of platting a single dot representing its current position, a horizontal line from the previous position to the current position is drawn.
#### 3.3V scale
* For the 3.3V scale, we assume DC coupling, and plot the value as an absolute position along the horizontal axis; vertical lines are drawn representing each volt, and vertical dotted lines are drawn representing each half volt
#### Line Input
* The Line Input scale is based on consumer audio equipment, where "0dB" is measured as 896mV peak-to-peak.  A "red line" area is drawn representing the area from "0dB" to "+3dB"
* For the Line Input, we assume AC coupling, which means that we need to track the average signal value (which may drift over time), and relate instantaneous values as +/- positions from the moving average.  In order to track the average, an array of 256 samples (from the beginning of each scanline) is maintained, and a running total of the "most recent 256 values" is maintained (from which the average is easily derived).  The average value is snapshotted at VSYNC time, for use on the next screen.

### Screenshot
* Below is a screenshot of a TRS-80 Model I cassette tape input (500 baud)

![TRS-80 Model I cassette tape](img/20201231_183601-screen.png)

