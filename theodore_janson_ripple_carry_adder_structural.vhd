library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

LIBRARY work;


entity theodore_janson_ripple_carry_adder_structural is
	
	port( A : in std_logic_vector (3 downto 0);
			B: in std_logic_vector (3 downto 0);
			S: out  std_logic_vector(4 downto 0));
			
end theodore_janson_ripple_carry_adder_structural;


ARCHITECTURE Structural OF theodore_janson_ripple_carry_adder_structural IS 


COMPONENT theodore_janson_half_adder
	PORT
	(
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		s :  OUT  STD_LOGIC;
		c :  OUT  STD_LOGIC
	);
END COMPONENT;


COMPONENT theodore_janson_full_adder
	PORT
	(
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		c_in :  IN  STD_LOGIC;
		s :  OUT  STD_LOGIC;
		c_out : out STD_Logic
	);
END COMPONENT;


SIGNAL WIRE0: std_logic;
SIGNAL WIRE1: std_logic;
SIGNAL WIRE2: std_logic;


Begin


HA :  theodore_janson_half_adder PORT MAP(a => B(0), b => A(0), s => S(0), c => wire0);
FA1 :  theodore_janson_full_adder PORT MAP(a => B(1), b => A(1), c_in => wire0, s => S(1), c_out => wire1);
FA2 :  theodore_janson_full_adder PORT MAP(a => B(2), b => A(2), c_in => wire1, s => S(2), c_out => wire2);
FA3 :  theodore_janson_full_adder PORT MAP(a => B(3), b => A(3), c_in => wire2, s => S(3), c_out => S(4));


	
		
END Structural;

