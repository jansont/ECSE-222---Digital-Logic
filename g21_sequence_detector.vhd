library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g21_sequence_detector is
Port(
seq : in std_logic;
enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
cnt_1 : out std_logic_vector (2 DOWNTO 0); -- generates 1 when the pattern "1011" is detected ; otherwise 0.
cnt_2 : out std_logic_vector (2 DOWNTO 0) -- generates 1 when the pattern "0010" is detected ; otherwise 0.
);
end g21_sequence_detector;

architecture behavioral of g21_sequence_detector is

component g21_FSM is
Port ( 
 clk: in std_logic;
 reset: in std_logic;
 enable: in std_logic;
 seq: in std_logic;
 out_1: out std_logic; 
 out_2: out std_logic
);
end component;

component g21_counter is
Port ( 
enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
count : out std_logic_vector(2 downto 0)
);
end component;

-- Signals
signal count1: std_logic;
signal count2: std_logic;

BEGIN

FSM: g21_FSM port map(clk, reset, enable, seq, count1, count2);
counter1: g21_counter port map(enable, reset, count1, cnt_1);
counter2: g21_counter port map(enable, reset, count2, cnt_2);

end behavioral;