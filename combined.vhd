LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY COMBINED IS
PORT(
	  CLK : IN STD_LOGIC;
	  RST : IN STD_LOGIC;
	  OUTPUTTEN1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- encoder 7 seg outputs
	  OUTPUTTEN2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	  OUTPUTTEN3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	  OUTPUTCOUNT1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	  OUTPUTCOUNT2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
END ENTITY COMBINED;

architecture combinedcir of combined is

component slowclockcounter
PORT(
     CLK : IN STD_LOGIC;
	  RST : IN STD_LOGIC;
	  OUTCLK : OUT STD_LOGIC
	  );
end component;

component counter
PORT(
	  CLK : IN STD_LOGIC;
	  RST : IN STD_LOGIC; -- async reset
	  Q   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	  DISPOUT   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	  );
end component;

component comby -- encoder logic
PORT(
	  CLK    : IN STD_LOGIC;
	  RST    : IN STD_LOGIC;
     INPUT1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8 bit counter output
	  OUTPUT : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	  );
end component;

component sevenseglogic
PORT(
	  CLK : IN STD_LOGIC;
	  INP : IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
	  Q   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	  );
end component; 

signal conteroutput : std_logic_vector(7 downto 0); -- 8bit counter output
signal conteroutputdisp : std_logic_vector(7 downto 0); -- 8bit counter output delayed 3 cycles
signal encoderoutput : std_logic_vector(9 downto 0); -- enconder output
signal slowclock : std_logic;

begin

slowclockcounter1 : slowclockcounter
	port map(
	clk => clk,
	rst => rst,
	outclk => slowclock
   );
	
counter1 : counter
	port map(
	clk => slowclock,
	rst => rst,
	q   => conteroutput,
	dispout => conteroutputdisp
	);
	
encoder : comby
   port map(
	clk => slowclock,
	rst => rst,
	input1 => conteroutput,
	output => encoderoutput
	);
	
sevenseg1 : sevenseglogic -- Least signficant display for counter
   port map(
	clk => slowclock,
	inp => conteroutputdisp(3 downto 0),
	q   => OUTPUTCOUNT1
	);
	
sevenseg2 : sevenseglogic -- Most significant display for counter
   port map(
	clk => slowclock,
	inp => conteroutputdisp(7 downto 4),
	q   => OUTPUTCOUNT2
	);
	
sevenseg3 : sevenseglogic -- Least significant enconder output
   port map(
	clk => slowclock,
	inp => encoderoutput(3 downto 0),
	q   => OUTPUTTEN1
	);
	
sevenseg4 : sevenseglogic -- Middle significant enconder output
   port map(
	clk => slowclock,
	inp => encoderoutput(7 downto 4),
	q   => OUTPUTTEN2
	);
	
sevenseg5 : sevenseglogic -- Most significant enconder output
   port map(
	clk => slowclock,
	inp(1 downto 0) => encoderoutput(9 downto 8),
	inp(3 downto 2) => "00",
	q   => OUTPUTTEN3
	);
	
end architecture combinedcir;
	

	
	
	         
