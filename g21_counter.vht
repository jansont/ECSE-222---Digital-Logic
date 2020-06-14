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
-- Generated on "11/16/2019 20:05:02"
                                                            
-- Vhdl Test Bench template for design  :  g21_wrapper
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g21_counter_vhd_tst IS
END g21_counter_vhd_tst;
ARCHITECTURE g21_counter_arch OF g21_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT g21_counter
	PORT (
	clk : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	count : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g21_counter
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	enable => enable,
	count => count,
	reset => reset
	);
	
	clock_generation : process
begin
clk <= '1';
wait for 500000000 ns;
clk <= '0';
wait for 500000000 ns;
end process clock_generation;

stimulus: process
begin
enable <= '1';
reset <= '0';
wait for 5 sec;
reset <= '1';
wait for 10 sec;
enable <= '0';
wait for 5 sec;
reset <= '1';
wait;
end process stimulus;
	                                          
END g21_counter_arch;