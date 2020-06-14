library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity theodore_janson_BCD_Adder is
	Port (a		: in std_logic_vector(3 downto 0);
			b		: in std_logic_vector(3 downto 0);
			s		: out std_logic_vector(3 downto 0);
			c_out : out std_logic);
end theodore_janson_BCD_Adder;

architecture Behavioral of theodore_janson_BCD_Adder is


begin 

process(a,b)
begin

	if a + b >= 9 then
	S <= a + b + 6;
	c_out <= '1';
	
	else 
	s <= a + b;
	c_out <= '0';
	
	end if;
	
end process;

		
END Behavioral;
