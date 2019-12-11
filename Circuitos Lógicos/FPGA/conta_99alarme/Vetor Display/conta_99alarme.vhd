library IEEE;                                                        
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity conta_99alarme is
port (clk: in std_logic;
        reset: in std_logic;
        desliga: in std_logic;
        sobedesce: in std_logic;
        alarme: out std_logic;
        HEX0, HEX1: out std_logic_vector (0 to 6));
end conta_99alarme ;
 
architecture arquitetura of conta_99alarme is
 
component clock
port (clk_in: in std_logic;
        q: out std_logic);
end component;
 
component conta_updown                    
port(clk:in std_logic;                          
     reset: in std_logic;                            
      sobedesce: in std_logic;                  
      carry_out: out std_logic;                
     q: out std_logic_vector(3 downto 0));  
end component;            
 
component displaycvector
port(bcd: in std_logic_vector (3 downto 0);
      HEX: out std_logic_vector (0 to 6));
end component;              
 
signal clk_1Hz: std_logic;
signal bcd0, bcd1: std_logic_vector (3 downto 0);
signal carry_out: std_logic;
 
begin
divisor: clock port map (clk, clk_1Hz);
 
contador0: conta_updown port map(clk_1Hz, reset, sobedesce, carry_out, bcd0);
                               
contador1: conta_updown port map(carry_out, reset, sobedesce, open, bcd1);
 
decod0: displaycvector port map(bcd0, HEX0);
                                 
decod1: displaycvector port map(bcd1, HEX1);
 
    process (bcd0, bcd1)                                                                --Alarme=1 se a saída for 60
    begin                                                                                   --
        if bcd1 ="0001" and bcd0="0000" and desliga='0' then                --
            alarme <= '1';                                                              --
                                                                                            --
        elsif desliga='1' then                                                      --
            alarme <= '0';                                                              --
        end if;                                                                         --
    end process;                                                                        --
   
end arquitetura;