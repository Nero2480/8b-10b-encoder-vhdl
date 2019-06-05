-- combinatorial logic 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY COMBY IS
PORT(
	  CLK    : IN STD_LOGIC;
	  RST    : IN STD_LOGIC;
     INPUT1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	  OUTPUT : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	  );
END COMBY;

ARCHITECTURE LOGIC OF COMBY IS

--signal firstpart : std_logic_vector(4 downto 0) := "00000";
--signal secondpart : std_logic_vector(7 downto 5) := "000";

begin
   process(CLK,RST) -- rundisp needed? NO
	variable rundisp : bit := '0'; -- Needs to be a variable. A signal would only update at end of process.
	variable firstpart : std_logic_vector(4 downto 0) := "00000";
   variable secondpart : std_logic_vector(7 downto 5) := "000";
   variable output1 : std_logic_vector(5 downto 0) := "000000";
	variable output2 : std_logic_vector(9 downto 6) := "0000";
	begin
	
	if rising_edge(CLK) AND rst = '0' then -- entire process is clocked 
	
	-- 5b/6b
	firstpart := INPUT1(4 downto 0);
	secondpart := INPUT1(7 downto 5);
	if (firstpart = "00000" AND rundisp = '0') then
		output1 := "100111";
		rundisp := '1';
	elsif (firstpart = "00000" AND rundisp = '1') then
		output1 := "011000";
		rundisp := '0';
	elsif (firstpart = "00001" AND rundisp = '0') then
		output1 := "011101";
		rundisp := '1';
	elsif (firstpart = "00001" AND rundisp = '1') then
		output1 := "100010";
		rundisp := '0';
	elsif (firstpart = "00010" AND rundisp = '0') then
		output1 := "101101";
		rundisp := '1';
	elsif (firstpart = "00010" AND rundisp = '1') then
		output1 := "010010";
		rundisp := '0';
	elsif (firstpart = "00011") then
		output1 := "110001";
	elsif (firstpart = "00100" AND rundisp = '0') then
		output1 := "110101";
		rundisp := '1';
   elsif (firstpart = "00100" AND rundisp = '1') then
		output1 := "001010";
		rundisp := '0';
   elsif (firstpart = "00101") then
		output1 := "101001";
   elsif (firstpart = "00110") then
		output1 := "011001";
	elsif (firstpart = "00111" AND rundisp = '0') then
		output1 := "111000";
		rundisp := '1';
   elsif (firstpart = "00111" AND rundisp = '1') then
		output1 := "000111";
		rundisp := '0';
	elsif (firstpart = "01000" AND rundisp = '0') then
		output1 := "111001";
		rundisp := '1';
	elsif (firstpart = "01000" AND rundisp = '1') then
		output1 := "000110";
		rundisp := '0';
	elsif (firstpart = "01001") then
		output1 := "100101";
	elsif (firstpart = "01010") then
		output1 := "010101";
	elsif (firstpart = "01011") then
		output1 := "110100";
	elsif (firstpart = "01100") then
		output1 := "001101";
	elsif (firstpart = "01101") then
		output1 := "101100";
	elsif (firstpart = "01110") then
		output1 := "011100";
	elsif (firstpart = "01111" AND rundisp = '0') then
		output1 := "010111";
		rundisp := '1';
	elsif (firstpart = "01111" AND rundisp = '1') then
		output1 := "101000";
		rundisp := '0';
	elsif (firstpart = "10000" AND rundisp = '0') then
		output1 := "011011";
		rundisp := '1';
	elsif (firstpart = "10000" AND rundisp = '1') then
		output1 := "100100";
		rundisp := '0';
	elsif (firstpart = "10001") then
		output1 := "100011";
	elsif (firstpart = "10010") then
		output1 := "010011";
	elsif (firstpart = "10011") then
		output1 := "110010";
	elsif (firstpart = "10100") then
		output1 := "001011";
	elsif (firstpart = "10101") then
		output1 := "101010";
	elsif (firstpart = "10110") then
		output1 := "011010";
	elsif (firstpart = "10111" AND rundisp = '0') then
		output1 := "111010";
		rundisp := '1';
	elsif (firstpart = "10111" AND rundisp = '1') then
		output1 := "000101";
		rundisp := '0';
	elsif (firstpart = "11000" AND rundisp = '0') then
		output1 := "110011";
		rundisp := '1';
	elsif (firstpart = "11000" AND rundisp = '1') then
		output1 := "001100";
		rundisp := '0';
	elsif (firstpart = "11001") then
		output1 := "100110";
	elsif (firstpart = "11010") then
		output1 := "010110";
	elsif (firstpart = "11011" AND rundisp = '0') then
		output1 := "110110";
		rundisp := '1';
	elsif (firstpart = "11011" AND rundisp = '1') then
		output1 := "001001";
		rundisp := '0';
	elsif (firstpart = "11100") then
		output1 := "001110";
	elsif (firstpart = "11101" AND rundisp = '0') then
		output1 := "101110";
		rundisp := '1';
	elsif (firstpart = "11101" AND rundisp = '1') then
		output1 := "010001";
		rundisp := '0';
	elsif (firstpart = "11110" AND rundisp = '0') then
		output1 := "011110";
		rundisp := '1';
	elsif (firstpart = "11110" AND rundisp = '1') then
		output1 := "100001";
		rundisp := '0';
	elsif (firstpart = "11111" AND rundisp = '0') then
		output1 := "101011";
		rundisp := '1';
	elsif (firstpart = "11111" AND rundisp = '1') then
		output1 := "010100";
		rundisp := '0';
	end if; 
   -- 3b/4b
	if (secondpart = "000" AND rundisp = '0') then
		output2 := "1011";
		rundisp := '1';
	elsif (secondpart = "000" AND rundisp = '1') then
		output2 := "0100";
		rundisp := '0';
	elsif (secondpart = "001") then
		output2 := "1001";
	elsif (secondpart = "010") then
		output2 := "0101";
	elsif (secondpart = "011" AND rundisp = '0') then
		output2 := "1100";
		rundisp := '1';
	elsif (secondpart = "011" AND rundisp = '1') then
		output2 := "0011";
		rundisp := '0';
	elsif (secondpart = "100" AND rundisp = '0') then
		output2 := "1101";
		rundisp := '1';
	elsif (secondpart = "100" AND rundisp = '1') then
		output2 := "0010";
		rundisp := '0';
	elsif (secondpart = "101") then
		output2 := "1010";
	elsif (secondpart = "110") then
		output2 := "0110";
		-- 7 is a unique case. Alternate codes are required to
	   --	avoid a run of 5 consecutive and identical bits.
	elsif (secondpart = "111") then
      if (((firstpart = "010001") OR (firstpart = "010010") OR (firstpart = "010100"))) then
		   if rundisp = '0' then
         output2 := "0111";
			end if;	
      elsif (((firstpart = "001011") OR (firstpart = "001101") OR (firstpart = "001110"))) then
		   if rundisp = '1' then
         output2 := "1000";
			end if;
      else
		   if rundisp = '0' then
			output2 := "1110";
			elsif rundisp = '1' then
         output2 := "0001";
			end if;
		end if;
	
	end if; -- end of 3b/4b
	
	if rst = '1' then
       output <= "0000000000";
		 firstpart := "00000";
		 secondpart := "000";
		 output1 := "000000";
		 output2 := "0000";
		 
	elsif rising_edge(CLK) then
	output <= output1 & output2; --Displayed 6b/4b
	end if;
	
	end if; -- end of clocked section
	
	end process;
	
end architecture logic;
