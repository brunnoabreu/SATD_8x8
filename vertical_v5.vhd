
--  Hadamard 8x8 VERTICAL --
-----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vertical_v5 is 
   port  (
		  V_in0, V_in1, V_in2, V_in3,
		  V_in4, V_in5, V_in6, V_in7 : in std_logic_vector (11 downto 0);
          V_out0, V_out1, V_out2, V_out3,
          V_out4, V_out5, V_out6, V_out7: out std_logic_vector (14 downto 0)
          );
end vertical_v5;

architecture behavior of vertical_v5 is

signal tV_in0, tV_in1, tV_in2, tV_in3, tV_in4, tV_in5, tV_in6, tV_in7 : std_logic_vector (12 downto 0);

signal C0, C1, C2, C3, C4, C5, C6, C7: std_logic_vector (12 downto 0);
signal tC0, tC1, tC2, tC3, tC4, tC5, tC6, tC7: std_logic_vector (13 downto 0);

signal D0, D1, D2, D3, D4, D5, D6, D7: std_logic_vector (13 downto 0);
signal tD0, tD1, tD2, tD3, tD4, tD5, tD6, tD7: std_logic_vector (14 downto 0);
 
signal V_out0_temp, V_out1_temp, V_out2_temp, V_out3_temp,
	   V_out4_temp, V_out5_temp, V_out6_temp, V_out7_temp : std_logic_vector (14 downto 0);

begin

tV_in0 <= V_in0(11) & V_in0;
tV_in1 <= V_in1(11) & V_in1;
tV_in2 <= V_in2(11) & V_in2;
tV_in3 <= V_in3(11) & V_in3;
tV_in4 <= V_in4(11) & V_in4;
tV_in5 <= V_in5(11) & V_in5;
tV_in6 <= V_in6(11) & V_in6;
tV_in7 <= V_in7(11) & V_in7;

tC0 <= C0(12) & C0;
tC1 <= C1(12) & C1;
tC2 <= C2(12) & C2;
tC3 <= C3(12) & C3;
tC4 <= C4(12) & C4;
tC5 <= C5(12) & C5;
tC6 <= C6(12) & C6;
tC7 <= C7(12) & C7;

tD0 <= D0(13) & D0;
tD1 <= D1(13) & D1;
tD2 <= D2(13) & D2;
tD3 <= D3(13) & D3;
tD4 <= D4(13) & D4;
tD5 <= D5(13) & D5;
tD6 <= D6(13) & D6;
tD7 <= D7(13) & D7;

C0 <= tV_in0 + tV_in4;
C1 <= tV_in1 + tV_in5;
C2 <= tV_in2 + tV_in6;
C3 <= tV_in3 + tV_in7;
C4 <= tV_in0 - tV_in4;
C5 <= tV_in1 - tV_in5;
C6 <= tV_in2 - tV_in6;
C7 <= tV_in3 - tV_in7;

D0 <= tC0 + tC2;
D1 <= tC1 + tC3;
D2 <= tC0 - tC2;
D3 <= tC1 - tC3;
D4 <= tC4 + tC6;
D5 <= tC5 + tC7;
D6 <= tC4 - tC6;
D7 <= tC5 - tC7;

V_out0 <= tD0 + tD1;
V_out1 <= tD0 - tD1;
V_out2 <= tD2 + tD3;
V_out3 <= tD2 - tD3;
V_out4 <= tD4 + tD5;
V_out5 <= tD4 - tD5;
V_out6 <= tD6 + tD7;
V_out7 <= tD6 - tD7;




end behavior;