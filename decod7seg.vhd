library IEEE;
use IEEE.Std_Logic_1164.all;


entity decod7seg is
port(
    X: in std_logic_vector(3 downto 0);
    Y: out std_logic_vector(6 downto 0)
    );
end decod7seg;


architecture decodificador of decod7seg is
begin
 Y <= "1000000" when X = "0000" else
"1111001" when X = "0001" else
"0100100" when x = "0010" else
"0110000" when x = "0011" else
"0011001" when x = "0100" else
"0010010" when x = "0101" else
"0000010" when x = "0110" else
"1111000" when x = "0111" else
"0000000" when x = "1000" else
"0011000" when x = "1001" else --9
"0001000" when x = "1010" else --A
"0000011" when x = "1011" else--B
"1000110" when x = "1100" else--C
"0100001" when x = "1101" else--D
"0000110" when x = "1110" else--E
"0001110" when x = "1111" else--F
"0111111"; -- DEBUG

end decodificador;