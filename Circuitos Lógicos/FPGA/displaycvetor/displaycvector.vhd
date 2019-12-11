-- Decodificador BCD para 7 segmentos (vetores)
-- Entrada: bcd (vetor de 4 posicoes);
-- Saida: HEX (vetor de 7 posicoes)
-- Autores: Nícolas Ribeiro e Leandro Alencar
-- 26/11/2019
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity displaycvector is
port(bcd: in std_logic_vector (3 downto 0);
      HEX0: out std_logic_vector (0 to 6));
end displaycvector;
 
architecture arquitetura of displaycvector is
begin
    process(bcd)
    begin  
        case bcd is
            when "0000" => HEX0 <= NOT "1111110";
            when "0001" => HEX0 <= NOT "0110000";
            when "0010" => HEX0 <= NOT "1101101";
            when "0011" => HEX0 <= NOT "1111001";
            when "0100" => HEX0 <= NOT "0110011";
            when "0101" => HEX0 <= NOT "1011011";
            when "0110" => HEX0 <= NOT "1011111";
            when "0111" => HEX0 <= NOT "1110000";
            when "1000" => HEX0 <= NOT "1111111";
            when "1001" => HEX0 <= NOT "1110011";
            when others => HEX0 <= NOT "0000000";
        end case;
    end process;
end arquitetura;