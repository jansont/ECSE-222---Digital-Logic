library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g21_FSM is
port (
 clk: in std_logic; --- clk signal
 reset: in std_logic; -- reset input
 enable: in std_logic;
 seq: in std_logic; -- binary sequence input
 out_1: out std_logic; -- output of the VHDL sequence detector
 out_2: out std_logic -- output of the VHDL sequence detector
);
end g21_FSM;

architecture behavior of g21_FSM IS
-- 1101
	TYPE state_1 IS (A, B, C, D, E);
	SIGNAL current1: state_1:= A;
-- 0010
	TYPE state_2 IS (F, G, H, I, J);
	SIGNAL current2: state_2:= F;
	
BEGIN

	PROCESS(clk, reset, enable)
	BEGIN
	
	IF (reset = '0') THEN
	current1 <= A;
	current2 <= F;
	
	ELSIF (enable = '1') THEN
		IF (rising_edge(clk)) THEN
			CASE current1 IS
				WHEN A=>
					IF seq='0' THEN
						current1 <= A;
					ELSE
						current1 <= B;
					END IF;
				WHEN B=>
					IF seq='0' THEN
						current1<=C;
					ELSE
						current1<=B;
					END IF;
				WHEN C=>
					IF seq='0' THEN
						current1 <=A;
					ELSE
						current1 <=D;
					END IF;
				WHEN D=>
					IF seq='0' THEN
						current1 <=C;
					ELSE
						current1 <=E;
					END IF;
				WHEN E=>
					IF seq='0' THEN
						current1 <=C;
					ELSE
						current1 <=B;
					END IF;
			END CASE;
				
			CASE current2 IS
				WHEN F=>
					IF seq='0' THEN
						current2 <=G;
					ELSE
						current2 <=F;
					END IF;
				WHEN G=>
					IF seq='0' THEN
						current2 <=H;
					ELSE
						current2 <=F;
					END IF;
				WHEN H=>
					IF seq='0' THEN
						current2 <=H;
					ELSE
						current2 <=I;
					END IF;
				WHEN I=>
					IF seq='0' THEN
						current2 <=J;
					ELSE
						current2 <=F;
					END IF;
				WHEN J=>
					IF seq='0' THEN
						current2 <=H;
					ELSE
						current2 <=F;
					END IF;
			END CASE;
		END IF;
	END IF;
END PROCESS;

out_1 <='1' WHEN current1 = E ELSE '0';
out_2 <='1' WHEN current2 = J ELSE '0';

END behavior;