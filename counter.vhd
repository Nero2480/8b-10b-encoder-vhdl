LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY COUNTER IS
PORT(
	  CLK : IN STD_LOGIC;
	  RST : IN STD_LOGIC; -- async reset
	  Q   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	  DISPOUT : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	  );
END ENTITY COUNTER;

architecture county of COUNTER is

signal currentval : unsigned(7 downto 0);
signal delayer1 : unsigned(7 downto 0); -- I've decided to delay the counter display by a clock cycle

begin


process(CLK,RST)

begin

	if (rst = '1') then
	  currentval <= X"00";
	  delayer1 <= x"00";
	  q <= x"00";
	elsif rising_edge(CLK) AND (rst = '0') then
		-- counter
		if (currentval = x"ff") then -- reset counter at 2^8 -1.
		        delayer1 <= currentval;
			q <= std_logic_vector(currentval);
			dispout <= std_logic_vector(delayer1);
			currentval <= x"00";
		elsif (currentval < x"ff") then
			currentval <= currentval + 1;
			delayer1 <= currentval;
			q <= std_logic_vector(currentval);
			dispout <= std_logic_vector(delayer1);
		end if;
	end if;

end process;

end architecture county;
