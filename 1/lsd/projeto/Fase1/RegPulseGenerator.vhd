library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RegPulseGenerator is 
	port( clk     : in std_logic;
			reset   : in std_logic;
			TimeClk : out std_logic;
			DispClk : out std_logic
	);
	
end RegPulseGenerator;

architecture Behavioral of RegPulseGenerator is 

	constant NUMBER_STEPS  : positive:=50000000;
	constant NUMBER_STEPS2 : positive:=50000;
	
	
	signal s_counter, s_counter2 : natural;
	
begin 
	count_proc: process(clk)
	begin
		if(rising_edge(clk)) then
			if((reset = '1') or (s_counter>=(NUMBER_STEPS-1))) then
				s_counter <= 0;
			else
				s_counter <= s_counter + 1;
			end if;
		end if;
	end process;
	
	count_proc2: process(clk)
	begin
		if(rising_edge(clk)) then
			if((reset = '1') or (s_counter2>=(NUMBER_STEPS2-1))) then
				s_counter2 <= 0;
			else
				s_counter2 <= s_counter2 + 1;
			end if;
		end if;
	end process;

	TimeClk <= '1' when (s_counter = 0 ) else '0';
	DispClk <= '1' when (s_counter2 = 0) else '0';
	
end Behavioral;