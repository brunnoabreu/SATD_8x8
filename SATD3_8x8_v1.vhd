---------------------------------------------
-- Bianca Silveira
-- Agosto de 2015

-- Arquitetura Hadamard 8x8 SATD_3ª versao
---------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

--------------------------------------------

ENTITY SATD3_8x8_v1 IS
PORT ( 
	   win0,  win1,  win2,  win3,  win4,  win5,  win6,  win7  :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win8,  win9,  win10, win11, win12, win13, win14, win15 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win16, win17, win18, win19, win20, win21, win22, win23 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win24, win25, win26, win27, win28, win29, win30, win31 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win32, win33, win34, win35, win36, win37, win38, win39 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win40, win41, win42, win43, win44, win45, win46, win47 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win48, win49, win50, win51, win52, win53, win54, win55 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   win56, win57, win58, win59, win60, win61, win62, win63 :  IN STD_LOGIC_VECTOR (8 DOWNTO 0); 
	   clock  : IN STD_LOGIC;                                                       
	   saida  : OUT STD_LOGIC_VECTOR (18 DOWNTO 0)                                  
	   );
END SATD3_8x8_v1; 


ARCHITECTURE comportamento OF SATD3_8x8_v1 IS
		
SIGNAL horizontal_in0, horizontal_in1, horizontal_in2, horizontal_in3,
       horizontal_in4, horizontal_in5, horizontal_in6, horizontal_in7  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in8, horizontal_in9, horizontal_in10, horizontal_in11,
       horizontal_in12, horizontal_in13, horizontal_in14, horizontal_in15  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in16, horizontal_in17, horizontal_in18, horizontal_in19,
       horizontal_in20, horizontal_in21, horizontal_in22, horizontal_in23  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in24, horizontal_in25, horizontal_in26, horizontal_in27,
       horizontal_in28, horizontal_in29, horizontal_in30, horizontal_in31  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in32, horizontal_in33, horizontal_in34, horizontal_in35,
       horizontal_in36, horizontal_in37, horizontal_in38, horizontal_in39  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in40, horizontal_in41, horizontal_in42, horizontal_in43,
       horizontal_in44, horizontal_in45, horizontal_in46, horizontal_in47  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in48, horizontal_in49, horizontal_in50, horizontal_in51,
       horizontal_in52, horizontal_in53, horizontal_in54, horizontal_in55  : STD_LOGIC_VECTOR (8 DOWNTO 0);
SIGNAL horizontal_in56, horizontal_in57, horizontal_in58, horizontal_in59,
       horizontal_in60, horizontal_in61, horizontal_in62, horizontal_in63  : STD_LOGIC_VECTOR (8 DOWNTO 0);
       
SIGNAL horizontal_out0, horizontal_out1, horizontal_out2, horizontal_out3,
       horizontal_out4, horizontal_out5, horizontal_out6, horizontal_out7  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out8, horizontal_out9, horizontal_out10, horizontal_out11,
       horizontal_out12, horizontal_out13, horizontal_out14, horizontal_out15  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out16, horizontal_out17, horizontal_out18, horizontal_out19,
       horizontal_out20, horizontal_out21, horizontal_out22, horizontal_out23  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out24, horizontal_out25, horizontal_out26, horizontal_out27,
       horizontal_out28, horizontal_out29, horizontal_out30, horizontal_out31  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out32, horizontal_out33, horizontal_out34, horizontal_out35,
       horizontal_out36, horizontal_out37, horizontal_out38, horizontal_out39  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out40, horizontal_out41, horizontal_out42, horizontal_out43,
       horizontal_out44, horizontal_out45, horizontal_out46, horizontal_out47  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out48, horizontal_out49, horizontal_out50, horizontal_out51,
       horizontal_out52, horizontal_out53, horizontal_out54, horizontal_out55  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL horizontal_out56, horizontal_out57, horizontal_out58, horizontal_out59,
       horizontal_out60, horizontal_out61, horizontal_out62, horizontal_out63  : STD_LOGIC_VECTOR (11 DOWNTO 0);
       
SIGNAL vertical_in0, vertical_in1, vertical_in2, vertical_in3,
       vertical_in4, vertical_in5, vertical_in6, vertical_in7  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL vertical_in8, vertical_in9, vertical_in10, vertical_in11,
       vertical_in12, vertical_in13, vertical_in14, vertical_in15  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL vertical_in16, vertical_in17, vertical_in18, vertical_in19,
       vertical_in20, vertical_in21, vertical_in22, vertical_in23  : STD_LOGIC_VECTOR (11 DOWNTO 0);
       
SIGNAL vertical_in24, vertical_in25, vertical_in26, vertical_in27,
       vertical_in28, vertical_in29, vertical_in30, vertical_in31  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL vertical_in32, vertical_in33, vertical_in34, vertical_in35,
       vertical_in36, vertical_in37, vertical_in38, vertical_in39  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL vertical_in40, vertical_in41, vertical_in42, vertical_in43,
       vertical_in44, vertical_in45, vertical_in46, vertical_in47  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL vertical_in48, vertical_in49, vertical_in50, vertical_in51,
       vertical_in52, vertical_in53, vertical_in54, vertical_in55  : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL vertical_in56, vertical_in57, vertical_in58, vertical_in59,
       vertical_in60, vertical_in61, vertical_in62, vertical_in63  : STD_LOGIC_VECTOR (11 DOWNTO 0);
       
SIGNAL vertical_out0, vertical_out1, vertical_out2, vertical_out3,
       vertical_out4, vertical_out5, vertical_out6, vertical_out7  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out8, vertical_out9, vertical_out10, vertical_out11,
       vertical_out12, vertical_out13, vertical_out14, vertical_out15  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out16, vertical_out17, vertical_out18, vertical_out19,
       vertical_out20, vertical_out21, vertical_out22, vertical_out23  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out24, vertical_out25, vertical_out26, vertical_out27,
       vertical_out28, vertical_out29, vertical_out30, vertical_out31  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out32, vertical_out33, vertical_out34, vertical_out35,
       vertical_out36, vertical_out37, vertical_out38, vertical_out39  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out40, vertical_out41, vertical_out42, vertical_out43,
       vertical_out44, vertical_out45, vertical_out46, vertical_out47  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out48, vertical_out49, vertical_out50, vertical_out51,
       vertical_out52, vertical_out53, vertical_out54, vertical_out55  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL vertical_out56, vertical_out57, vertical_out58, vertical_out59,
       vertical_out60, vertical_out61, vertical_out62, vertical_out63  : STD_LOGIC_VECTOR (14 DOWNTO 0);
       
SIGNAL sad_out0, sad_out1, sad_out2, sad_out3,
       sad_out4, sad_out5, sad_out6, sad_out7 : STD_LOGIC_VECTOR (17 DOWNTO 0);
       
SIGNAL A0, A1, A2, A3 : STD_LOGIC_VECTOR (18 DOWNTO 0);

SIGNAL B0, B1 : STD_LOGIC_VECTOR (19 DOWNTO 0);

SIGNAL saida_parcial : STD_LOGIC_VECTOR (20 DOWNTO 0);

----------------------------------------------------------------------------------------
-------   Registrador PIPE   ---------------------------------------------
----------------------------------------------------------------------------------------

	COMPONENT registrador_inicial_8in IS
		PORT (
			  clk: in std_logic;
			  D0, D1, D2, D3, D4, D5, D6, D7 :   in std_logic_vector (8 downto 0);
			  Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 :   out std_logic_vector (8 downto 0)
			);
	END COMPONENT;

----------------------------------------------------------------------------------------
-------   horizontal   ---------------------------------------------
----------------------------------------------------------------------------------------

	COMPONENT horizontal_v1 IS
		port  (
				H_in0, H_in1, H_in2, H_in3,
				H_in4, H_in5, H_in6, H_in7      : in std_logic_vector (8 downto 0);
				H_out0, H_out1, H_out2, H_out3,
				H_out4, H_out5, H_out6, H_out7  : out std_logic_vector (11 downto 0)
			  );
	END COMPONENT;

----------------------------------------------------------------------------------------
-------   Registrador PIPE   ---------------------------------------------
----------------------------------------------------------------------------------------

	COMPONENT registrador_pipeline_12bits IS
		PORT (
			  clk: in std_logic;
			  D0, D1, D2, D3, D4, D5, D6, D7 :   in std_logic_vector (11 downto 0);
			  Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 :   out std_logic_vector (11 downto 0)
				);
	END COMPONENT;


----------------------------------------------------------------------------------------
-------   Vertical     ---------------------------------------------
----------------------------------------------------------------------------------------
	
	COMPONENT vertical_v5 IS
		port  (
				V_in0, V_in1, V_in2, V_in3,
				V_in4, V_in5, V_in6, V_in7     : in std_logic_vector (11 downto 0);
				V_out0, V_out1, V_out2, V_out3,
				V_out4, V_out5, V_out6, V_out7 : out std_logic_vector (14 downto 0)
			  );
	END COMPONENT;
	
----------------------------------------------------------------------------------------
-------   Arquitetura SAV     ---------------------------------------------
----------------------------------------------------------------------------------------
	
	COMPONENT sav_1ciclo_v1 IS
		PORT(
			  ck	 							  : in std_logic;
			  sadin_0, sadin_1, sadin_2, sadin_3  : in std_logic_vector(14 downto 0);
			  sadin_4, sadin_5, sadin_6, sadin_7  : in std_logic_vector(14 downto 0);		
			  SAD                                 : out std_logic_vector(17 downto 0)
			  );
	END COMPONENT; 
	

	
--*****************************************************************************************
--*****************************************************************************************

BEGIN

RegInicio0: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win0, 
						D1 => win1, 
						D2 => win2, 
						D3 => win3, 
						D4 => win4, 
						D5 => win5, 
						D6 => win6, 
						D7 => win7,
				  
					    Q0 => horizontal_in0, 
					    Q1 => horizontal_in1, 
					    Q2 => horizontal_in2, 
					    Q3 => horizontal_in3, 
					    Q4 => horizontal_in4, 
					    Q5 => horizontal_in5, 
					    Q6 => horizontal_in6, 
					    Q7 => horizontal_in7 
						);
						
RegInicio1: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win8, 
						D1 => win9, 
						D2 => win10, 
						D3 => win11, 
						D4 => win12, 
						D5 => win13, 
						D6 => win14, 
						D7 => win15,
				  
					    Q0 => horizontal_in8, 
					    Q1 => horizontal_in9, 
					    Q2 => horizontal_in10, 
					    Q3 => horizontal_in11, 
					    Q4 => horizontal_in12, 
					    Q5 => horizontal_in13, 
					    Q6 => horizontal_in14, 
					    Q7 => horizontal_in15 
						);
						
RegInicio2: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win16, 
						D1 => win17, 
						D2 => win18, 
						D3 => win19, 
						D4 => win20, 
						D5 => win21, 
						D6 => win22, 
						D7 => win23,
				  
					    Q0 => horizontal_in16, 
					    Q1 => horizontal_in17, 
					    Q2 => horizontal_in18, 
					    Q3 => horizontal_in19, 
					    Q4 => horizontal_in20, 
					    Q5 => horizontal_in21, 
					    Q6 => horizontal_in22, 
					    Q7 => horizontal_in23 
						);
						
RegInicio3: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win24, 
						D1 => win25, 
						D2 => win26, 
						D3 => win27, 
						D4 => win28, 
						D5 => win29, 
						D6 => win30, 
						D7 => win31,
				  
					    Q0 => horizontal_in24, 
					    Q1 => horizontal_in25, 
					    Q2 => horizontal_in26, 
					    Q3 => horizontal_in27, 
					    Q4 => horizontal_in28, 
					    Q5 => horizontal_in29, 
					    Q6 => horizontal_in30, 
					    Q7 => horizontal_in31 
						);
						
RegInicio4: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win32, 
						D1 => win33, 
						D2 => win34, 
						D3 => win35, 
						D4 => win36, 
						D5 => win37, 
						D6 => win38, 
						D7 => win39,
				  
					    Q0 => horizontal_in32, 
					    Q1 => horizontal_in33, 
					    Q2 => horizontal_in34, 
					    Q3 => horizontal_in35, 
					    Q4 => horizontal_in36, 
					    Q5 => horizontal_in37, 
					    Q6 => horizontal_in38, 
					    Q7 => horizontal_in39 
						);
						
RegInicio5: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win40, 
						D1 => win41, 
						D2 => win42, 
						D3 => win43, 
						D4 => win44, 
						D5 => win45, 
						D6 => win46, 
						D7 => win47,
				  
					    Q0 => horizontal_in40, 
					    Q1 => horizontal_in41, 
					    Q2 => horizontal_in42, 
					    Q3 => horizontal_in43, 
					    Q4 => horizontal_in44, 
					    Q5 => horizontal_in45, 
					    Q6 => horizontal_in46, 
					    Q7 => horizontal_in47 
						);
						
RegInicio6: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win48, 
						D1 => win49, 
						D2 => win50, 
						D3 => win51, 
						D4 => win52, 
						D5 => win53, 
						D6 => win54, 
						D7 => win55,
				  
					    Q0 => horizontal_in48, 
					    Q1 => horizontal_in49, 
					    Q2 => horizontal_in50, 
					    Q3 => horizontal_in51, 
					    Q4 => horizontal_in52, 
					    Q5 => horizontal_in53, 
					    Q6 => horizontal_in54, 
					    Q7 => horizontal_in55 
						);
						
RegInicio7: registrador_inicial_8in
			PORT MAP (
						clk => clock,
						D0 => win56, 
						D1 => win57, 
						D2 => win58, 
						D3 => win59, 
						D4 => win60, 
						D5 => win61, 
						D6 => win62, 
						D7 => win63,
				  
					    Q0 => horizontal_in56, 
					    Q1 => horizontal_in57, 
					    Q2 => horizontal_in58, 
					    Q3 => horizontal_in59, 
					    Q4 => horizontal_in60, 
					    Q5 => horizontal_in61, 
					    Q6 => horizontal_in62, 
					    Q7 => horizontal_in63 
						);
						
-----------------------------------------------------------------------------------------------------------------------
--===========     Horizontais    ================
-----------------------------------------------------------------------------------------------------------------------
               
Horiz0Comp42: horizontal_v1
			  PORT MAP( 
						  H_in0 => horizontal_in0, 
						  H_in1 => horizontal_in1, 
						  H_in2 => horizontal_in2, 
						  H_in3 => horizontal_in3,
						  H_in4 => horizontal_in4, 
						  H_in5 => horizontal_in5, 
						  H_in6 => horizontal_in6, 
						  H_in7 => horizontal_in7,
						  
						  H_out0 => horizontal_out0, 
						  H_out1 => horizontal_out1, 
						  H_out2 => horizontal_out2, 
						  H_out3 => horizontal_out3,
						  H_out4 => horizontal_out4, 
						  H_out5 => horizontal_out5, 
						  H_out6 => horizontal_out6, 
						  H_out7 => horizontal_out7 
						  );
              
Horiz1Comp42: horizontal_v1
              PORT MAP( 
						  H_in0 => horizontal_in8, 
						  H_in1 => horizontal_in9, 
						  H_in2 => horizontal_in10, 
						  H_in3 => horizontal_in11,
						  H_in4 => horizontal_in12, 
						  H_in5 => horizontal_in13, 
						  H_in6 => horizontal_in14, 
						  H_in7 => horizontal_in15,
						  
						  H_out0 => horizontal_out8, 
						  H_out1 => horizontal_out9, 
						  H_out2 => horizontal_out10, 
						  H_out3 => horizontal_out11,
						  H_out4 => horizontal_out12, 
						  H_out5 => horizontal_out13, 
						  H_out6 => horizontal_out14, 
						  H_out7 => horizontal_out15 
						  );
              
Horiz2Comp42: horizontal_v1
			  PORT MAP( 
						  H_in0 => horizontal_in16, 
						  H_in1 => horizontal_in17, 
						  H_in2 => horizontal_in18, 
						  H_in3 => horizontal_in19,
						  H_in4 => horizontal_in20, 
						  H_in5 => horizontal_in21, 
						  H_in6 => horizontal_in22, 
						  H_in7 => horizontal_in23,
						  
						  H_out0 => horizontal_out16, 
						  H_out1 => horizontal_out17, 
						  H_out2 => horizontal_out18, 
						  H_out3 => horizontal_out19,
						  H_out4 => horizontal_out20, 
						  H_out5 => horizontal_out21, 
						  H_out6 => horizontal_out22, 
						  H_out7 => horizontal_out23 
						  );
              
Horiz3Comp42: horizontal_v1
			  PORT MAP( 
						  H_in0 => horizontal_in24, 
						  H_in1 => horizontal_in25, 
						  H_in2 => horizontal_in26, 
						  H_in3 => horizontal_in27,
						  H_in4 => horizontal_in28, 
						  H_in5 => horizontal_in29, 
						  H_in6 => horizontal_in30, 
						  H_in7 => horizontal_in31,
						  
						  H_out0 => horizontal_out24, 
						  H_out1 => horizontal_out25, 
						  H_out2 => horizontal_out26, 
						  H_out3 => horizontal_out27,
						  H_out4 => horizontal_out28, 
						  H_out5 => horizontal_out29, 
						  H_out6 => horizontal_out30, 
						  H_out7 => horizontal_out31 
						  );
              
Horiz4Comp42: horizontal_v1
		      PORT MAP( 
						  H_in0 => horizontal_in32, 
						  H_in1 => horizontal_in33, 
						  H_in2 => horizontal_in34, 
						  H_in3 => horizontal_in35,
						  H_in4 => horizontal_in36, 
						  H_in5 => horizontal_in37, 
						  H_in6 => horizontal_in38, 
						  H_in7 => horizontal_in39,
						  
						  H_out0 => horizontal_out32, 
						  H_out1 => horizontal_out33, 
						  H_out2 => horizontal_out34, 
						  H_out3 => horizontal_out35,
						  H_out4 => horizontal_out36, 
						  H_out5 => horizontal_out37, 
						  H_out6 => horizontal_out38, 
						  H_out7 => horizontal_out39 
						  );
              
Horiz5Comp42: horizontal_v1
		      PORT MAP( 
						  H_in0 => horizontal_in40, 
						  H_in1 => horizontal_in41, 
						  H_in2 => horizontal_in42, 
						  H_in3 => horizontal_in43,
						  H_in4 => horizontal_in44, 
						  H_in5 => horizontal_in45, 
						  H_in6 => horizontal_in46, 
						  H_in7 => horizontal_in47,
						  
						  H_out0 => horizontal_out40, 
						  H_out1 => horizontal_out41, 
						  H_out2 => horizontal_out42, 
						  H_out3 => horizontal_out43,
						  H_out4 => horizontal_out44, 
						  H_out5 => horizontal_out45, 
						  H_out6 => horizontal_out46, 
						  H_out7 => horizontal_out47 
						  );
              
Horiz6Comp42: horizontal_v1
		      PORT MAP( 
						  H_in0 => horizontal_in48, 
						  H_in1 => horizontal_in49, 
						  H_in2 => horizontal_in50, 
						  H_in3 => horizontal_in51,
						  H_in4 => horizontal_in52, 
						  H_in5 => horizontal_in53, 
						  H_in6 => horizontal_in54, 
						  H_in7 => horizontal_in55,
						  
						  H_out0 => horizontal_out48, 
						  H_out1 => horizontal_out49, 
						  H_out2 => horizontal_out50, 
						  H_out3 => horizontal_out51,
						  H_out4 => horizontal_out52, 
						  H_out5 => horizontal_out53, 
						  H_out6 => horizontal_out54, 
						  H_out7 => horizontal_out55 
						  );
              
Horiz7Comp42: horizontal_v1
		      PORT MAP( 
						  H_in0 => horizontal_in56, 
						  H_in1 => horizontal_in57, 
						  H_in2 => horizontal_in58, 
						  H_in3 => horizontal_in59,
						  H_in4 => horizontal_in60, 
						  H_in5 => horizontal_in61, 
						  H_in6 => horizontal_in62, 
						  H_in7 => horizontal_in63,
						  
						  H_out0 => horizontal_out56, 
						  H_out1 => horizontal_out57, 
						  H_out2 => horizontal_out58, 
						  H_out3 => horizontal_out59,
						  H_out4 => horizontal_out60, 
						  H_out5 => horizontal_out61, 
						  H_out6 => horizontal_out62, 
						  H_out7 => horizontal_out63 
						  );
					  
-----------------------------------------------------------------------------------------------------------------------
--===========     Registradores de Pipeline    ================
-----------------------------------------------------------------------------------------------------------------------
              
RegPipe0: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out0, 
					  D1 => horizontal_out1, 
					  D2 => horizontal_out2, 
					  D3 => horizontal_out3, 
					  D4 => horizontal_out4, 
					  D5 => horizontal_out5, 
					  D6 => horizontal_out6, 
					  D7 => horizontal_out7,
						  
					  Q0 => vertical_in0, 
					  Q1 => vertical_in1, 
					  Q2 => vertical_in2, 
					  Q3 => vertical_in3, 
					  Q4 => vertical_in4, 
					  Q5 => vertical_in5, 
					  Q6 => vertical_in6, 
					  Q7 => vertical_in7 
					  );
					  
RegPipe1: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out8, 
					  D1 => horizontal_out9, 
					  D2 => horizontal_out10, 
					  D3 => horizontal_out11,
					  D4 => horizontal_out12, 
					  D5 => horizontal_out13, 
					  D6 => horizontal_out14, 
					  D7 => horizontal_out15,
						  
					  Q0 => vertical_in8, 
					  Q1 => vertical_in9, 
					  Q2 => vertical_in10, 
					  Q3 => vertical_in11, 
					  Q4 => vertical_in12, 
					  Q5 => vertical_in13, 
					  Q6 => vertical_in14, 
					  Q7 => vertical_in15 
					  );
					  
RegPipe2: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out16, 
					  D1 => horizontal_out17, 
					  D2 => horizontal_out18, 
					  D3 => horizontal_out19,
					  D4 => horizontal_out20, 
					  D5 => horizontal_out21, 
					  D6 => horizontal_out22, 
					  D7 => horizontal_out23,
						  
					  Q0 => vertical_in16,
					  Q1 => vertical_in17,
					  Q2 => vertical_in18, 
					  Q3 => vertical_in19, 
					  Q4 => vertical_in20, 
					  Q5 => vertical_in21, 
					  Q6 => vertical_in22, 
					  Q7 => vertical_in23 
					  );
					  
RegPipe3: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out24, 
					  D1 => horizontal_out25, 
					  D2 => horizontal_out26, 
					  D3 => horizontal_out27,
					  D4 => horizontal_out28, 
					  D5 => horizontal_out29, 
					  D6 => horizontal_out30, 
					  D7 => horizontal_out31,
						  
					  Q0 => vertical_in24,
					  Q1 => vertical_in25,
					  Q2 => vertical_in26, 
					  Q3 => vertical_in27, 
					  Q4 => vertical_in28, 
					  Q5 => vertical_in29, 
					  Q6 => vertical_in30, 
					  Q7 => vertical_in31 
					  );
					  
RegPipe4: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out32, 
					  D1 => horizontal_out33, 
					  D2 => horizontal_out34, 
					  D3 => horizontal_out35,
					  D4 => horizontal_out36, 
					  D5 => horizontal_out37, 
					  D6 => horizontal_out38, 
					  D7 => horizontal_out39,
						  
					  Q0 => vertical_in32,
					  Q1 => vertical_in33,
					  Q2 => vertical_in34, 
					  Q3 => vertical_in35, 
					  Q4 => vertical_in36, 
					  Q5 => vertical_in37, 
					  Q6 => vertical_in38, 
					  Q7 => vertical_in39 
					  );
					  
RegPipe5: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out40, 
					  D1 => horizontal_out41, 
					  D2 => horizontal_out42, 
					  D3 => horizontal_out43,
					  D4 => horizontal_out44, 
					  D5 => horizontal_out45, 
					  D6 => horizontal_out46, 
					  D7 => horizontal_out47,
						  
					  Q0 => vertical_in40,
					  Q1 => vertical_in41,
					  Q2 => vertical_in42, 
					  Q3 => vertical_in43, 
					  Q4 => vertical_in44, 
					  Q5 => vertical_in45, 
					  Q6 => vertical_in46, 
					  Q7 => vertical_in47 
					  );
					  
RegPipe6: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out48, 
					  D1 => horizontal_out49, 
					  D2 => horizontal_out50, 
					  D3 => horizontal_out51,
					  D4 => horizontal_out52, 
					  D5 => horizontal_out53, 
					  D6 => horizontal_out54, 
					  D7 => horizontal_out55,
						  
					  Q0 => vertical_in48,
					  Q1 => vertical_in49,
					  Q2 => vertical_in50, 
					  Q3 => vertical_in51, 
					  Q4 => vertical_in52, 
					  Q5 => vertical_in53, 
					  Q6 => vertical_in54, 
					  Q7 => vertical_in55 
					  );
					  
RegPipe7: registrador_pipeline_12bits
		  PORT MAP (
					  clk => clock,
					  D0 => horizontal_out56, 
					  D1 => horizontal_out57, 
					  D2 => horizontal_out58, 
					  D3 => horizontal_out59,
					  D4 => horizontal_out60, 
					  D5 => horizontal_out61, 
					  D6 => horizontal_out62, 
					  D7 => horizontal_out63,
						  
					  Q0 => vertical_in56,
					  Q1 => vertical_in57,
					  Q2 => vertical_in58, 
					  Q3 => vertical_in59, 
					  Q4 => vertical_in60, 
					  Q5 => vertical_in61, 
					  Q6 => vertical_in62, 
					  Q7 => vertical_in63 
					  );
					  
-----------------------------------------------------------------------------------------------------------------------
--===========     Vertical    ================
-----------------------------------------------------------------------------------------------------------------------

Vert0Comp42: vertical_v5
		  PORT MAP( 
					  V_in0 => vertical_in0, 
					  V_in1 => vertical_in8, 
					  V_in2 => vertical_in16, 
					  V_in3 => vertical_in24,
					  V_in4 => vertical_in32, 
					  V_in5 => vertical_in40, 
					  V_in6 => vertical_in48, 
					  V_in7 => vertical_in56,
					  
					  V_out0 => vertical_out0, 
					  V_out1 => vertical_out1, 
					  V_out2 => vertical_out2, 
					  V_out3 => vertical_out3,
					  V_out4 => vertical_out4, 
					  V_out5 => vertical_out5, 
					  V_out6 => vertical_out6, 
					  V_out7 => vertical_out7 
					  );
					  
Vert1Comp42: vertical_v5
		  PORT MAP( 
					  V_in0 => vertical_in1, 
					  V_in1 => vertical_in9, 
					  V_in2 => vertical_in17, 
					  V_in3 => vertical_in25,
					  V_in4 => vertical_in33, 
					  V_in5 => vertical_in41, 
					  V_in6 => vertical_in49, 
					  V_in7 => vertical_in57,
					  
					  V_out0 => vertical_out8, 
					  V_out1 => vertical_out9, 
					  V_out2 => vertical_out10, 
					  V_out3 => vertical_out11,
					  V_out4 => vertical_out12, 
					  V_out5 => vertical_out13, 
					  V_out6 => vertical_out14, 
					  V_out7 => vertical_out15 
					  );
					  
Vert2Comp42: vertical_v5
		  PORT MAP( 
					  V_in0 => vertical_in2, 
					  V_in1 => vertical_in10, 
					  V_in2 => vertical_in18, 
					  V_in3 => vertical_in26,
					  V_in4 => vertical_in34, 
					  V_in5 => vertical_in42, 
					  V_in6 => vertical_in50, 
					  V_in7 => vertical_in58,
					  
					  V_out0 => vertical_out16, 
					  V_out1 => vertical_out17, 
					  V_out2 => vertical_out18, 
					  V_out3 => vertical_out19,
					  V_out4 => vertical_out20, 
					  V_out5 => vertical_out21, 
					  V_out6 => vertical_out22, 
					  V_out7 => vertical_out23 
					  );
					  
Vert3Comp42: vertical_v5
          PORT MAP( 
					  V_in0 => vertical_in3, 
					  V_in1 => vertical_in11, 
					  V_in2 => vertical_in19, 
					  V_in3 => vertical_in27,
					  V_in4 => vertical_in35, 
					  V_in5 => vertical_in43, 
					  V_in6 => vertical_in51, 
					  V_in7 => vertical_in59,
					  
					  V_out0 => vertical_out24, 
					  V_out1 => vertical_out25, 
					  V_out2 => vertical_out26, 
					  V_out3 => vertical_out27,
					  V_out4 => vertical_out28, 
					  V_out5 => vertical_out29, 
					  V_out6 => vertical_out30, 
					  V_out7 => vertical_out31 
					  );
					  
Vert4Comp42: vertical_v5
          PORT MAP( 
					  V_in0 => vertical_in4, 
					  V_in1 => vertical_in12, 
					  V_in2 => vertical_in20, 
					  V_in3 => vertical_in28,
					  V_in4 => vertical_in36, 
					  V_in5 => vertical_in44, 
					  V_in6 => vertical_in52, 
					  V_in7 => vertical_in60,
					  
					  V_out0 => vertical_out32, 
					  V_out1 => vertical_out33, 
					  V_out2 => vertical_out34, 
					  V_out3 => vertical_out35,
					  V_out4 => vertical_out36, 
					  V_out5 => vertical_out37, 
					  V_out6 => vertical_out38, 
					  V_out7 => vertical_out39 
					  );
              
Vert5Comp42: vertical_v5
          PORT MAP( 
					  V_in0 => vertical_in5, 
					  V_in1 => vertical_in13, 
					  V_in2 => vertical_in21, 
					  V_in3 => vertical_in29,
					  V_in4 => vertical_in37, 
					  V_in5 => vertical_in45, 
					  V_in6 => vertical_in53, 
					  V_in7 => vertical_in61,
					  
					  V_out0 => vertical_out40, 
					  V_out1 => vertical_out41, 
					  V_out2 => vertical_out42, 
					  V_out3 => vertical_out43,
					  V_out4 => vertical_out44, 
					  V_out5 => vertical_out45, 
					  V_out6 => vertical_out46, 
					  V_out7 => vertical_out47 
					  );
					  
Vert6Comp42: vertical_v5
          PORT MAP( 
					  V_in0 => vertical_in6, 
					  V_in1 => vertical_in14, 
					  V_in2 => vertical_in22, 
					  V_in3 => vertical_in30,
					  V_in4 => vertical_in38, 
					  V_in5 => vertical_in46, 
					  V_in6 => vertical_in54, 
					  V_in7 => vertical_in62,
					  
					  V_out0 => vertical_out48, 
					  V_out1 => vertical_out49, 
					  V_out2 => vertical_out50, 
					  V_out3 => vertical_out51,
					  V_out4 => vertical_out52, 
					  V_out5 => vertical_out53, 
					  V_out6 => vertical_out54, 
					  V_out7 => vertical_out55 
					  );
					  
Vert7Comp42: vertical_v5
          PORT MAP( 
					  V_in0 => vertical_in7, 
					  V_in1 => vertical_in15, 
					  V_in2 => vertical_in23, 
					  V_in3 => vertical_in31,
					  V_in4 => vertical_in39, 
					  V_in5 => vertical_in47, 
					  V_in6 => vertical_in55, 
					  V_in7 => vertical_in63,
					  
					  V_out0 => vertical_out56, 
					  V_out1 => vertical_out57, 
					  V_out2 => vertical_out58, 
					  V_out3 => vertical_out59,
					  V_out4 => vertical_out60, 
					  V_out5 => vertical_out61, 
					  V_out6 => vertical_out62, 
					  V_out7 => vertical_out63 
					  );
					  
-----------------------------------------------------------------------------------------------------------------------
--===========     SAV    ================
-----------------------------------------------------------------------------------------------------------------------

savCOMP0: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out0, 
					 sadin_1 => vertical_out1, 
					 sadin_2 => vertical_out2, 
					 sadin_3 => vertical_out3,
					 sadin_4 => vertical_out4, 
					 sadin_5 => vertical_out5, 
					 sadin_6 => vertical_out6, 
					 sadin_7 => vertical_out7,
					 SAD => sad_out0
					 );
					 
savCOMP1: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out8, 
					 sadin_1 => vertical_out9, 
					 sadin_2 => vertical_out10, 
					 sadin_3 => vertical_out11,
					 sadin_4 => vertical_out12, 
					 sadin_5 => vertical_out13, 
					 sadin_6 => vertical_out14, 
					 sadin_7 => vertical_out15,
					 SAD => sad_out1
					 );
					 
savCOMP2: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out16, 
					 sadin_1 => vertical_out17, 
					 sadin_2 => vertical_out18, 
					 sadin_3 => vertical_out19,
					 sadin_4 => vertical_out20, 
					 sadin_5 => vertical_out21, 
					 sadin_6 => vertical_out22, 
					 sadin_7 => vertical_out23,
					 SAD => sad_out2
					 );
					 
savCOMP3: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out24, 
					 sadin_1 => vertical_out25,
					 sadin_2 => vertical_out26,
					 sadin_3 => vertical_out27,
					 sadin_4 => vertical_out28, 
					 sadin_5 => vertical_out29, 
					 sadin_6 => vertical_out30, 
					 sadin_7 => vertical_out31,
					 SAD => sad_out3
					 );
					 
savCOMP4: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out32, 
					 sadin_1 => vertical_out33,
					 sadin_2 => vertical_out34,
					 sadin_3 => vertical_out35,
					 sadin_4 => vertical_out36, 
					 sadin_5 => vertical_out37, 
					 sadin_6 => vertical_out38, 
					 sadin_7 => vertical_out39,
					 SAD => sad_out4
					 );
					 
savCOMP5: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out40, 
					 sadin_1 => vertical_out41,
					 sadin_2 => vertical_out42,
					 sadin_3 => vertical_out43,
					 sadin_4 => vertical_out44, 
					 sadin_5 => vertical_out45, 
					 sadin_6 => vertical_out46, 
					 sadin_7 => vertical_out47,
					 SAD => sad_out5
					 );
					 
savCOMP6: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out48, 
					 sadin_1 => vertical_out49,
					 sadin_2 => vertical_out50,
					 sadin_3 => vertical_out51,
					 sadin_4 => vertical_out52, 
					 sadin_5 => vertical_out53, 
					 sadin_6 => vertical_out54, 
					 sadin_7 => vertical_out55,
					 SAD => sad_out6
					 );
					 
savCOMP7: sav_1ciclo_v1
		 PORT MAP(
					 ck => clock,
					 sadin_0 => vertical_out56, 
					 sadin_1 => vertical_out57,
					 sadin_2 => vertical_out58,
					 sadin_3 => vertical_out59,
					 sadin_4 => vertical_out60, 
					 sadin_5 => vertical_out61, 
					 sadin_6 => vertical_out62, 
					 sadin_7 => vertical_out63,
					 SAD => sad_out7
					 );
					 
-----------------------------------------------------------------------------------------------------------------------
--===========     Somador Compressor 8:2 (4:2)    ================
-----------------------------------------------------------------------------------------------------------------------

A0 <= ('0' & sad_out0) + ('0' & sad_out1);
A1 <= ('0' & sad_out2) + ('0' & sad_out3);
A2 <= ('0' & sad_out4) + ('0' & sad_out5);
A3 <= ('0' & sad_out6) + ('0' & sad_out7);
-------------------------------------------------

B0  <= ('0' & A0) + ('0' & A1);
B1  <= ('0' & A2) + ('0' & A3);

saida_parcial <= ('0' & B0) + ('0' & B1) + "010";
                        
 saida <= saida_parcial(20 downto 2);

             
END comportamento;