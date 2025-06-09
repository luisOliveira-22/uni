library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DiasDoMes is
	port(clk	   : in  std_logic;
		  input  : in  std_logic_vector(4 downto 0);
		  valOut : out std_logic_vector(4 downto 0)
		  );
end DiasDoMes;

architecture RTL of DiasDoMes is

	signal s_value : Integer;
	
begin
	process(clk)
	begin	
		if (rising_edge(clk)) then
			s_value <= to_Integer(unsigned(input));
			if(s_value = 1 or s_value = 3 or s_value = 5 or s_value = 7 or s_value = 8 or s_value = 10 or s_value = 12) then
				valOut <= std_logic_vector(to_unsigned(31,5));
			elsif(s_value = 4 or s_value = 6 or s_value = 9 or s_value = 11) then
				valOut <= std_logic_vector(to_unsigned(30,5));
			else
				valOut <= std_logic_vector(to_unsigned(28,5));
			end if;
		end if;
	end process;

end RTL;