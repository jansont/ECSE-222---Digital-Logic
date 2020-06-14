

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
use ieee.numeric_std.all;                         
use ieee.std_logic_unsigned.all;
     

ENTITY theodore_janson_BCD_Adder_vhd_tst IS
END theodore_janson_BCD_Adder_vhd_tst;
ARCHITECTURE theodore_janson_BCD_Adder_arch OF theodore_janson_BCD_Adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL c_out : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT theodore_janson_BCD_Adder
	PORT (
	a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	c_out : OUT STD_LOGIC;
	s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	i1 : theodore_janson_BCD_Adder
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	c_out => c_out,
	s => s
	);

	
always : PROCESS                                                                                
BEGIN                                                         
	for i in 0 to 9 loop
	A<= std_logic_vector(to_unsigned(i,4));
	
	for j in 0 to 9 loop
	B<= std_logic_vector(to_unsigned(j,4));
	wait for 10 ns;

	end loop;
	end loop;
	
WAIT;                                                        
END PROCESS always;                                          
END theodore_janson_BCD_Adder_arch;
