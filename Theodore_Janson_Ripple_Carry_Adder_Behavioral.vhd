library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

LIBRARY work;


entity theodore_janson_ripple_carry_adder_behavioral is
	
	port( A : in std_logic_vector (3 downto 0);
			B: in std_logic_vector (3 downto 0);
			S: out  std_logic_vector(4 downto 0));
			
end theodore_janson_ripple_carry_adder_behavioral;


ARCHITECTURE Behavior OF Theodore_Janson_Ripple_Carry_Adder_Behavioral IS 

Begin


S <= (A & '0') + (B & '0');
	
		
END Behavior;

