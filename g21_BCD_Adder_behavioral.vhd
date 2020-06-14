
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY work;

-- BCD Adder
ENTITY g21_BCD_Adder_behavioral is
	PORT( 
		A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		C_out: OUT STD_LOGIC_Vector(3 downto 0)
	);
END g21_BCD_Adder_behavioral;

ARCHITECTURE Behavioral OF g21_BCD_Adder_behavioral IS 

BEGIN

PROCESS(A,B) 
BEGIN

	IF A + B <= 9 THEN
	S <= A + B;
	C_out <= "0000";
	
	ELSE
	S <= A + B + 6;
	C_out <= "0001";
	
	END IF;

END PROCESS;

END Behavioral;