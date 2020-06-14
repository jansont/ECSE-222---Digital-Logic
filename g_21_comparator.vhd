library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity g_21_comparator is 
	Port ( A, B			 : in std_logic_vector(3 downto 0);
			 AgtBplusOne : out std_logic;
			 AgteBplusOne: out std_logic;
			 AltBplusOne : out std_logic;
			 AlteBplusOne: out std_logic;
			 AeqBplusOne : out std_logic;
			 overflow    :	out std_logic
			 );
end g_21_comparator;


Architecture behavioral of g_21_comparator is

SIGNAL BplusOne: STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN

BplusOne <= STD_LOGIC_VECTOR( UNSIGNED('0' & B) + 1);

PROCESS(A,BplusOne) 
BEGIN


If (BplusOne > 15) then
	AeqBplusOne  <= '0';
	AgteBplusOne <= '0';
	AlteBplusOne <= '0';
	AgtBplusOne  <= '0';
	AltBplusOne  <= '0';
	overflow     <= '1';
	
elsif A=(BplusOne) then 
	AeqBplusOne  <= '1';
	AgteBplusOne <= '1';
	AlteBplusOne <= '1';
	AgtBplusOne  <= '0';
	AltBplusOne  <= '0';
	overflow     <= '0';

elsif A<(BplusOne) then 
	AeqBplusOne  <= '0';
	AgteBplusOne <= '0';
	AlteBplusOne <= '1';
	AgtBplusOne  <= '0';
	AltBplusOne  <= '1';
	overflow     <= '0';
	
elsif A>(BplusOne) then 
	AeqBplusOne  <= '0';
	AgteBplusOne <= '1';
	AlteBplusOne <= '0';
	AgtBplusOne  <= '1';
	AltBplusOne  <= '0';
	overflow     <= '0';
	
else

end if;

END PROCESS;

end behavioral;