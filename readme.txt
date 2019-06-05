Readme

These files contain the code to implement the  8b/10b encoder as well as a slow clock, an 8 bit counter, and seven segment logic to display the output.

Operation - When programmed the device will display the output of the 8 bit counter in hex to two seven segment displays. At the same time the 10b encoding will be displayed
on three seven segment displays. The 8 bit counter will count up from 0 to 255 and then cycle showing all encoding for the given running disparity. The encoding scheme used
is the 1983 IBM encoding scheme. The 8 bit number is displayed 3b/5b while the 10b number is displayed 6b/4b. The device has an asynchronous active-high reset. When the reset is high the
displays will freeze. When set back low again the display will show the number that would have come next in normal sequemce before quickly returning to 0 ansd starting again. The running
disparity is preserved between resets.

Files:

combined.vhdl - This file consists of port mappings that connect the different components together.

comby.vhdl - This file constructs the 8b/10b encoder.

counter.vhdl - This file constructs the 8 bit counter. Outputs to the display are delayed by 1 clock cycle. This is to make the encodings sync.
This is also partly why the reset doesn't immediately set the displays to 0.

sevenseglogic.vhdl - This file is a simple mapping for the seven segment displays. It takes input as a std_logic_vector and maps it to a std_logic vector that the seven segment
display canuse to display a hex value.

slowclockcounter.vhdl - This file takes a high frequency clock (in my FPGA's case 10 Mghz) and uses it to push a 32 bit counter. The 21st higest bit is read to make a clock (1/2^21) times as fast.
In the case of the 10 Mghz clock this comes out to about 4.77 Hz. 

The slow clock is for user convenience. The remaing components can run on the 50 Mghz clock. This will casuse the displays to display 8 at all times but pushing reset high will show a valid output.
Much higher frequencies into the Ghz should be possible but I don't have the means to test them.


A table of the ending scheme can be found at https://en.wikipedia.org/wiki/8b/10b_encoding. Otherwise the coding is implied by comby.vhdl



