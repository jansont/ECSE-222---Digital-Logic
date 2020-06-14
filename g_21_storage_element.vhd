library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g_21_storage_element is
	port( A		: in std_logic;
			reset	: in std_logic;
			set	: in std_logic;
			B		: out std_logic);
end g_21_storage_element;

architecture behavioral of g_21_storage_element is

signal C:  std_logic;

begin

	B <= C;

PROCESS (A, reset, set)
BEGIN
	if reset = '0' then
		C <= '0';
	elsif	set = '0' then
		C <= '1';
	elsif rising_edge(A)  then
		C <= NOT(C);
	end if;	
end process;
	
end behavioral;