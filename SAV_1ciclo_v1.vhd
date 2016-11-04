


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY SAV_1ciclo_v1 IS
	PORT(
        ck	 								 : in std_logic;
        sadin_0, sadin_1, sadin_2, sadin_3   : in std_logic_vector(14 downto 0);
        sadin_4, sadin_5, sadin_6, sadin_7   : in std_logic_vector(14 downto 0);		
        SAD  							     : out std_logic_vector(17 downto 0)
        );
END SAV_1ciclo_v1;

ARCHITECTURE rtl of SAV_1ciclo_v1 IS

signal reg_sadin_0, reg_sadin_1, reg_sadin_2, reg_sadin_3,
       reg_sadin_4, reg_sadin_5, reg_sadin_6, reg_sadin_7  	: std_logic_vector(14 downto 0);

signal abs0, abs1, abs2, abs3, abs4, abs5, abs6, abs7 		: std_logic_vector(14 DOWNTO 0);

signal tree_out0, tree_out1, tree_out2, tree_out3		    : std_logic_vector(15 DOWNTO 0);
signal tree_out4, tree_out5								    : std_logic_vector(16 DOWNTO 0);
signal tree_out6 				 						    : std_logic_vector(17 DOWNTO 0);


begin
	-- Registradores de entrada (original e predicao, 4 amostras em paralelo) e saida 
	process(ck)
	begin
		if (ck = '1' and ck'event) then
			reg_sadin_0 <= sadin_0;
			reg_sadin_1 <= sadin_1;
			reg_sadin_2 <= sadin_2;
			reg_sadin_3 <= sadin_3;
			reg_sadin_4 <= sadin_4;
			reg_sadin_5 <= sadin_5;
			reg_sadin_6 <= sadin_6;
			reg_sadin_7 <= sadin_7;
		end if;	           
	end process;

	-- Calculo do absoluto	
	with reg_sadin_0(14) select
	abs0 <= reg_sadin_0               when '0',
			(not(reg_sadin_0) + "01") when others; 
			
	with reg_sadin_1(14) select
	abs1 <= reg_sadin_1               when '0',
			(not(reg_sadin_1) + "01") when others; 		
			
	with reg_sadin_2(14) select
	abs2 <= reg_sadin_2 		      when '0',
			(not(reg_sadin_2) + "01") when others; 		
			
	with reg_sadin_3(14) select
	abs3 <= reg_sadin_3			 	  when '0',
			(not(reg_sadin_3) + "01") when others; 		
			
	with reg_sadin_4(14) select
	abs4 <= reg_sadin_4               when '0',
			(not(reg_sadin_4) + "01") when others; 
			
	with reg_sadin_5(14) select
	abs5 <= reg_sadin_5               when '0',
			(not(reg_sadin_5) + "01") when others; 		
			
	with reg_sadin_6(14) select
	abs6 <= reg_sadin_6               when '0',
			(not(reg_sadin_6) + "01") when others; 		
			
	with reg_sadin_7(14) select
	abs7 <= reg_sadin_7               when '0',
			(not(reg_sadin_7) + "01") when others; 				

	-- Arvore de SAD - nivel 1
	tree_out0 <= ('0' & abs0) + ('0' & abs1);
	tree_out1 <= ('0' & abs2) + ('0' & abs3);
	tree_out2 <= ('0' & abs4) + ('0' & abs5);
	tree_out3 <= ('0' & abs6) + ('0' & abs7);

	-- Arvore de SAD - nivel 2
	tree_out4 <= ('0' & tree_out0) + ('0' & tree_out1);
	tree_out5 <= ('0' & tree_out2) + ('0' & tree_out3);
	
	-- Arvore de SAD - nivel 3
	tree_out6 <= ('0' & tree_out4) + ('0' & tree_out5);

	
	
	PROCESS(ck)
	BEGIN
		if (ck = '1' and ck'event) then
      
      
        SAD <= tree_out6;
     
   
    end if;  
            
	END PROCESS;
	

END rtl;
