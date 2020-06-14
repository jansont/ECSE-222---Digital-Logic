library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity g21_counter is
Port ( enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
count : out std_logic_vector(2 downto 0)
);

end g21_counter;

architecture behavioral of g21_counter is
signal temp : std_logic_vector(2 downto 0) := "000";

BEGIN
process(clk, enable, reset)

BEGIN

if reset = '0' then
	count <= "000";
	temp <= "000";
elsif enable = '1' then
	if rising_edge(clk) then
		if temp = "111" then
		temp <= "000";
		count <= temp;
		else
		temp <= temp + "1";
		count <= temp;
		end if;
	end if;
end if;
end process;
end behavioral;