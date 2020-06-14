library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity theodore_janson_half_adder is
	Port (a		: in std_logic;
			b		: in std_logic;
			s		: out std_logic;
			c		: out std_logic);
end theodore_janson_half_adder;


architecture structural of theodore_janson_half_adder is 
begin
	s <= a xor b;
	c <= a and b;
	
end structural;