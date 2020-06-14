library IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY g21_Wrapper is
	Port( 
	A, B : in std_logic_vector (3 downto 0);
	decoded_A : out std_logic_vector (6 downto 0);
	decoded_B : out std_logic_vector (6 downto 0);
	decoded_AplusB : out std_logic_vector (13 downto 0) 
	);
end g21_Wrapper;


Architecture Structural of g21_Wrapper is


COMPONENT g21_BCD_Adder_behavioral IS
	PORT( 
		A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		C_out: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT seven_segment_decoder IS
	PORT( 
		code : in std_logic_vector (3 downto 0) ;
		segments_out : out std_logic_vector (6 downto 0)
	);
END COMPONENT;

signal wire6: std_logic_vector(3 downto 0);
signal wire7: std_logic_vector(3 downto 0);




BEGIN

BCD:  g21_BCD_Adder_behavioral PORT MAP(A => A, B => B, S => wire6, C_out => wire7);

seven_1 : seven_segment_decoder PORT MAP(code => A, segments_out => decoded_A);
seven_2 : seven_segment_decoder PORT MAP(code => B, segments_out => decoded_B);
seven_3 : seven_segment_decoder PORT MAP(code => wire6 , segments_out => decoded_AplusB(6 downto 0));
seven_4:  seven_segment_decoder PORT MAP(code => wire7, segments_out => decoded_AplusB(13 downto 7));

End Structural;