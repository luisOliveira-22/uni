library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter5Bits is
    port(MAX     : in std_logic_vector(4 downto 0);
         reset   : in  std_logic;
         clk     : in  std_logic;
         enable1 : in  std_logic;
         valOut  : out std_logic_vector(4 downto 0);
         termCnt : out std_logic);
end Counter5Bits;

architecture RTL of Counter5Bits is

    signal s_value : Natural range 0 to 32 := 1;

begin
    process(reset, clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
               s_value <= 1;
                termCnt <= '0';
            elsif (enable1 = '1') then
                if (s_value = to_integer(unsigned(MAX))) then
                    s_value <= 1;
                    termCnt <= '0';
                else
                    s_value <= s_value + 1;
                    if (s_value = to_integer(unsigned(MAX)) -1 ) then
                        termCnt <= '1';
                    else
                        termCnt <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    valOut <= std_logic_vector(to_unsigned(s_value,5));
end RTL;
