
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY theodore_janson_half_adder_vhd_tst IS
END theodore_janson_half_adder_vhd_tst;
ARCHITECTURE theodore_janson_half_adder_arch OF theodore_janson_half_adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL c : STD_LOGIC;
SIGNAL s : STD_LOGIC;
COMPONENT theodore_janson_half_adder
	PORT (
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	c : OUT STD_LOGIC;
	s : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : theodore_janson_half_adder
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	c => c,
	s => s
	);
	
always : PROCESS                                                                           
BEGIN                                                         
	A <= '0'; 
	B <= '0';
	wait for 10 ns;
	A <= '0';
	B <= '1';
	wait for 10 ns;
	A <= '1';
	B <= '0';
	wait for 10 ns;
	A <= '1';
	B <= '1';
	wait for 10 ns;
		
WAIT;                                                        
END PROCESS always;                                          
END theodore_janson_half_adder_arch;
