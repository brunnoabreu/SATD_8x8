----------------------------------------------------------------------
---          Registrador Inicial de 8 entrados de 8 bits         ---
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registrador_inicial_8in IS
PORT (
	   clk: in std_logic;
	   D0, D1, D2, D3, D4, D5, D6, D7 :   in std_logic_vector (8 downto 0);
	   Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 :   out std_logic_vector (8 downto 0)
	  );
END registrador_inicial_8in;

 ARCHITECTURE comportamento OF registrador_inicial_8in IS

BEGIN
PROCESS (clk)
 BEGIN
  IF clk' EVENT AND clk = '1' THEN
   Q0 <= D0;
   Q1 <= D1;
   Q2 <= D2;
   Q3 <= D3;
   Q4 <= D4;
   Q5 <= D5;
   Q6 <= D6;
   Q7 <= D7;
  END IF;
 END PROCESS;
END comportamento;