library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g21_wrapper is
Port ( 	enable 	: in std_logic;
		reset 	: in std_logic;
		clk 	: in std_logic;
		HEX0 	: out std_logic_vector(6 downto 0)
);
end g21_wrapper ;

architecture behavioral of g21_wrapper is

component g21_clock_divider is
Port (	enable 	: in std_logic;
		reset 	: in std_logic;
		clk 	: in std_logic;
		en_out 	: out std_logic
);
end component;

component g21_counter is
Port ( 	enable 	: in std_logic;
		reset 	: in std_logic;
		clk 	: in std_logic;
		count 	: out std_logic_vector(2 downto 0)
);
end component;

component seven_segment_decoder is
port (	code 			: in std_logic_vector (3 downto 0) ;
		segments_out 	: out std_logic_vector (6 downto 0)
);
end component;

signal enableSignal: std_logic;
signal EC: std_logic_vector(2 downto 0);
signal DC: std_logic_vector(6 downto 0);
signal tempEC :std_logic_vector(3 downto 0);


BEGIN
	counter: g21_counter port map(enable, reset, enableSignal, EC);
	clock_divider: g21_clock_divider port map(enable, reset, clk, enableSignal);
	seven_decoder: seven_segment_decoder port map(tempEC, HEX0);
	tempEC <= ("0" & EC);
	
end behavioral;
	