library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all; -- teoricamente define melhor a diferença entre signed/unsigned, mas acho q aqui é desnecessário

entity comp_igual4 is
    Port (
        soma   : in  STD_LOGIC_VECTOR(3 downto 0); -- Entrada de 4 bits
        status : out STD_LOGIC                   -- Saída, 1 quando soma = 4
    );
end comp_igual4;

architecture bhav of comp_igual4 is
begin
    process(soma)
    begin
        if soma = "0100" then
            status <= '1'; -- Ativa status quando soma = 4
        else
            status <= '0'; -- Status desativado quando diferente de 4
        end if;
    end process;
end bhav;
