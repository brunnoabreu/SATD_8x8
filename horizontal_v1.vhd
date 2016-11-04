
--  Hadamard 8x8 horizontal --
-----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity horizontal_v1 is 
   port  (
          H_in0,  H_in1,  H_in2, H_in3,
          H_in4,  H_in5,  H_in6, H_in7    : in std_logic_vector (8 downto 0);
          H_out0, H_out1, H_out2, H_out3,
          H_out4, H_out5, H_out6, H_out7  : out std_logic_vector (11 downto 0)
          );
end horizontal_v1;

architecture behavior of horizontal_v1 is

signal tH_in0, tH_in1, tH_in2, tH_in3, tH_in4, tH_in5, tH_in6, tH_in7 : std_logic_vector (9 downto 0);

signal A0,  A1,  A2,  A3,  A4,  A5,  A6,  A7 : std_logic_vector (9 downto 0);
signal tA0, tA1, tA2, tA3, tA4, tA5, tA6, tA7: std_logic_vector (10 downto 0);

signal B0,  B1,  B2,  B3,  B4,  B5,  B6,  B7 : std_logic_vector (10 downto 0);
signal tB0, tB1, tB2, tB3, tB4, tB5, tB6, tB7: std_logic_vector (11 downto 0); 


begin

tH_in0 <= H_in0(8) & H_in0;
tH_in1 <= H_in1(8) & H_in1;
tH_in2 <= H_in2(8) & H_in2;
tH_in3 <= H_in3(8) & H_in3;
tH_in4 <= H_in4(8) & H_in4;
tH_in5 <= H_in5(8) & H_in5;
tH_in6 <= H_in6(8) & H_in6;
tH_in7 <= H_in7(8) & H_in7;

tA0 <= A0(9) & A0;
tA1 <= A1(9) & A1;
tA2 <= A2(9) & A2;
tA3 <= A3(9) & A3;
tA4 <= A4(9) & A4;
tA5 <= A5(9) & A5;
tA6 <= A6(9) & A6;
tA7 <= A7(9) & A7;

tB0 <= B0(10) & B0;
tB1 <= B1(10) & B1;
tB2 <= B2(10) & B2;
tB3 <= B3(10) & B3;
tB4 <= B4(10) & B4;
tB5 <= B5(10) & B5;
tB6 <= B6(10) & B6;
tB7 <= B7(10) & B7;

A0 <= tH_in0 + tH_in4;
A1 <= tH_in1 + tH_in5;
A2 <= tH_in2 + tH_in6;
A3 <= tH_in3 + tH_in7;
A4 <= tH_in0 - tH_in4;
A5 <= tH_in1 - tH_in5;
A6 <= tH_in2 - tH_in6;
A7 <= tH_in3 - tH_in7;

B0 <= tA0 + tA2;
B1 <= tA1 + tA3;
B2 <= tA0 - tA2;
B3 <= tA1 - tA3;
B4 <= tA4 + tA6;
B5 <= tA5 + tA7;
B6 <= tA4 - tA6;
B7 <= tA5 - tA7;

H_out0 <= tB0 + tB1;
H_out1 <= tB0 - tB1;
H_out2 <= tB2 + tB3;
H_out3 <= tB2 - tB3;
H_out4 <= tB4 + tB5;
H_out5 <= tB4 - tB5;
H_out6 <= tB6 + tB7;
H_out7 <= tB6 - tB7;


end behavior;