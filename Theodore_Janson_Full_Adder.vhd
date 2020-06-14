library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity theodore_janson_full_adder is
	Port (a		: in std_logic;
			b		: in std_logic;
			c_in	: in std_logic;
			s		: out std_logic;
			c_out : out std_logic);
end theodore_janson_full_adder;

architecture structural of theodore_janson_full_adder is

component theodore_janson_half_adder is
	Port (a		: in std_logic;
			b		: in std_logic;
			s		: out std_logic;
			c		: out std_logic);
end component;

signal wire0, wire1, wire2 : std_logic;

begin

M1 :  Theodore_Janson_HALF_ADDER PORT MAP(a => a, b => b, s => wire0, c => wire1);
M2 :  Theodore_Janson_HALF_ADDER PORT MAP(a => wire0, b => c_in, s => s, c => wire2);

c_out <= wire1 or wire2;
		
END Structural;
