LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SEVENSEGLOGIC IS
PORT(
	  CLK : IN STD_LOGIC;
	  INP : IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
	  Q   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	  );
END ENTITY SEVENSEGLOGIC;

architecture maping of SEVENSEGLOGIC is

begin

    process(CLK)
	 begin

  if rising_edge(clk) then
	 if (INP = x"0") then
		q <= not "00111111"; -- my fpga uses negative logic for the 7-segment displays
	 elsif (INP = x"1") then
	   q <= not "00000110";
	 elsif (INP = x"2") then
	   q <= not "01011011";
	 elsif (INP = x"3") then
	   q <= not "01001111";
	 elsif (INP = x"4") then
	   q <= not "01100110";
	 elsif (INP = x"5") then
	   q <= not "01101101";
	 elsif (INP = x"6") then
	   q <= not "01111101";
	 elsif (INP = x"7") then
	   q <= not "00000111";
	 elsif (INP = x"8") then
	   q <= not "01111111";
	 elsif (INP = x"9") then
	   q <= not "01100111";
	 elsif (INP = x"A") then
	   q <= not "01110111";
	 elsif (INP = x"B") then
	   q <= not "01111100";
	 elsif (INP = x"C") then
	   q <= not "00111001";
	 elsif (INP = x"D") then
	   q <= not "01011110";
         elsif (INP = x"E") then
	   q <= not "01111001";
	 elsif (INP = x"F") then
	   q <= not "01110001";
	end if;
  end if;
	 
end process; 

end architecture maping;
