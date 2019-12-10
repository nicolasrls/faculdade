library IEEE;
use ieee.std_logic_1164.all;
 
entity conta10s is
port (clock1, reset, sobedesce: in std_logic;
        HEX0: out std_logic_vector (0 to 6));
end conta10s;
 
architecture arquitetura of conta10s is
 
    component displaycvector is
    port (bcd: in std_logic_vector (3 downto 0);
              HEX0: out std_logic_vector (0 to 6));
    end component;
 
    component clock is
    port (clk_in: in std_logic;
              q: out std_logic);
    end component;
   
    component conta_updown is
    port (clk: in std_logic;
     reset: in std_logic;
     sobedesce: in std_logic;
     carry_out: out std_logic;
     q: out std_logic_vector(3 downto 0));
    end component;
   
    signal chupitilha: std_logic;
    signal querrenca: std_logic_vector (3 downto 0);
	 
   
begin
talita: clock port map (clock1, chupitilha);
feliperenato: conta_updown port map(chupitilha, reset, sobedesce, open ,querrenca);
caleb: displaycvector port map (querrenca, HEX0);
 
end arquitetura;