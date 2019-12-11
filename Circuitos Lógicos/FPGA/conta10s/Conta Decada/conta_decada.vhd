-- Entradas: clk (clock), reset;
-- Saída: q (Vetor 4 posições tipo BCD)
-- Autores: Nícolas e Leandro
-- 02/08/2017
 
library IEEE;                                                        
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity conta_decada is
  port (clk:in std_logic;
    reset: in std_logic;
    q: out std_logic_vector(3 downto 0));
end conta_decada;
 
architecture arquitetura of conta_decada is
begin
    process(clk,reset)                                  
    variable qtemp: std_logic_vector(3 downto 0);  
    begin
        if reset='1' then
        qtemp:="0000";                                            
       
        else      
            if clk'event and clk='1' then                            
                if qtemp<9 then
                qtemp:=qtemp+1;                                        
                else
                qtemp:="0000";                                            
                end if;
            end if;
        q<=qtemp;                                                
        end if;
       
    end process;                                                      
end arquitetura;