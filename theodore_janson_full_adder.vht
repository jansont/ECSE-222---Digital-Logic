

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY theodore_janson_full_adder_vhd_tst IS
END theodore_janson_full_adder_vhd_tst;
ARCHITECTURE theodore_janson_full_adder_arch OF theodore_janson_full_adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL c_in : STD_LOGIC;
SIGNAL c_out : STD_LOGIC;
SIGNAL s : STD_LOGIC;
COMPONENT theodore_janson_full_adder
	PORT (
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	c_in : IN STD_LOGIC;
	c_out : OUT STD_LOGIC;
	s : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : theodore_janson_full_adder
	PORT MAP (
	a => a,
	b => b,
	c_in => c_in,
	c_out => c_out,
	s => s
	);

	
always : PROCESS                                              
                                    
BEGIN                                                         
   A <= '0'; 
		B <= '0';
	C_in <= '0';
	wait for 10 ns;
	A <= '0';
	B <= '0';
	C_in <= '1';
	wait for 10 ns;
	A <= '0';
	B <= '1';
	C_in <= '0';
	wait for 10 ns;
	A <= '0'; 
	B <= '1';
	C_in <= '1';
	wait for 10 ns;
	A <= '1';
	B <= '0';
	C_in <= '0';
	wait for 10 ns;
	A <= '1'; 
	B <= '0';
	C_in <= '1';
	wait for 10 ns;
	A <= '1';
	B <= '1';
	C_in <= '0';
	wait for 10 ns;
	A <= '1';
	B <= '1';
	C_in <= '1';
	wait for 10 ns;  
WAIT;                                                        
END PROCESS always;                                          
END theodore_janson_full_adder_arch;
