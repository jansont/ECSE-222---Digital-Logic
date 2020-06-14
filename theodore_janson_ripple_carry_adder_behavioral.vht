-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/15/2019 15:15:38"
                                                            
-- Vhdl Test Bench template for design  :  theodore_janson_ripple_carry_adder_behavioral
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;     
use ieee.numeric_std.all;                              
                           

ENTITY theodore_janson_ripple_carry_adder_behavioral_vhd_tst IS
END theodore_janson_ripple_carry_adder_behavioral_vhd_tst;
ARCHITECTURE theodore_janson_ripple_carry_adder_behavioral_arch OF theodore_janson_ripple_carry_adder_behavioral_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT theodore_janson_ripple_carry_adder_behavioral
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : theodore_janson_ripple_carry_adder_behavioral
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
END theodore_janson_ripple_carry_adder_behavioral_arch;
