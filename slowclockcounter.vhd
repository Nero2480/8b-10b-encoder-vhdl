LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SLOWCLOCKCOUNTER is
PORT(
     CLK : IN STD_LOGIC;
	  RST : IN STD_LOGIC;
	  OUTCLK : OUT STD_LOGIC
	  );
END ENTITY;

architecture slowedclock of slowclockcounter is

signal count32 : unsigned(31 downto 0);
signal vectorcount : std_logic_vector (31 downto 0);

begin

process(clk,rst)

begin

if (rst = '1') then 
	count32 <= x"00000000";
	outclk <= '0';
elsif rising_edge(clk) AND rst = '0' then
	if count32 = x"ffffffff" then
	count32 <= x"00000000";
	outclk <= '0';
	elsif count32 < x"ffffffff" then
	count32 <= count32 + 1;
	vectorcount <= std_logic_vector(count32);
	outclk <= vectorcount(21);
	end if;
end if;

end process;

end architecture slowedclock;



	  

