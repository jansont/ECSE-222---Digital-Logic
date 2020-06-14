LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
use ieee.numeric_std.all;                              
                              

ENTITY theodore_janson_ripple_carry_adder_structural_vhd_tst IS
END theodore_janson_ripple_carry_adder_structural_vhd_tst;
ARCHITECTURE theodore_janson_ripple_carry_adder_structural_arch OF theodore_janson_ripple_carry_adder_structural_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT theodore_janson_ripple_carry_adder_structural
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : theodore_janson_ripple_carry_adder_structural
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	S => S
	);


	
always : PROCESS                                                                                   
BEGIN     
	FOR i in 0 to 16 loop
	A <= std_logic_vector(to_unsigned(i,4));
	FOR j IN 0 to 16 loop
	B <= std_logic_vector(to_unsigned(j,4));
	wait for 10 ns;
	END LOOP;
	END LOOP;


                                                    
WAIT;                                                        
END PROCESS always;                                          
END theodore_janson_ripple_carry_adder_structural_arch;
