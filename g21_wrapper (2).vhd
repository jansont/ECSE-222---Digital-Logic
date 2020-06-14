library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g21_wrapper is
Port(
reset : in std_logic;
enable : in std_logic;
clk : in std_logic;
HEX0 : out std_logic_vector(6 DOWNTO 0); -- generates 1 when the pattern "1011" is detected ; otherwise 0.
HEX5 : out std_logic_vector(6 DOWNTO 0) -- generates 1 when the pattern "0010" is detected ; otherwise 0.
);
end g21_wrapper;

architecture behavioral of g21_wrapper is

-- Components
component g21_clock_divider is
Port ( 
enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
en_out : out std_logic
);
end component;

component seven_segment_decoder is
port(	
code : in std_logic_vector (3 downto 0) ;
segments_out : out std_logic_vector (6 downto 0)
);
end component;

component ROM is
port(
    clk : in std_logic;
    enable : in std_logic;
    reset : in std_logic;
    data : out std_logic
);
end component;

component g21_sequence_detector is
Port(
seq : in std_logic;
enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
cnt_1 : out std_logic_vector (2 DOWNTO 0); 
cnt_2 : out std_logic_vector (2 DOWNTO 0)
);
end component;


signal enableSignal: std_logic;
signal seq_ROM, romreset: std_logic;
signal wire1, wire2: std_logic_vector (2 downto 0);
signal tempDC1, tempDC2: std_logic_vector (3 downto 0);

BEGIN

	clock_divider : g21_clock_divider port map(enable, reset, clk, enableSignal);
	romreset <= not reset;
	ROM1 : ROM port map(enableSignal, enable, romreset, seq_ROM);
	sequence_detector : g21_sequence_detector port map(seq_ROM, enable, reset, enableSignal, wire1, wire2);
	tempDC1 <= ('0' & wire1);
	tempDC2 <= ('0' & wire2);
	DC1: seven_segment_decoder port map(tempDC1, HEX0);
	DC2: seven_segment_decoder port map(tempDC2, HEX5);

end behavioral;