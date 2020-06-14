
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g21_clock_divider is
Port ( 
enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
en_out : out std_logic
);
 end g21_clock_divider;

architecture behavioral of g21_clock_divider is
signal T : integer := 50000000;
signal count: integer:= T-1;

BEGIN
process(clk, enable, reset)

BEGIN
if reset = '0' then
	en_out <= '0';
elsif enable = '1' then
	if rising_edge(clk) then
		if count = 0 then
			en_out <= '1';
			count <= 50000000-1;
	else
		en_out <= '0';
		count <= (count - 1);
	end if;
end if;
end if;
end process;
end behavioral;	