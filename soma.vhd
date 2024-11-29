library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Unsigned.all;
use IEEE.Numeric_Std.all; 

entity soma is
    port (
        seq: in std_logic_vector(9 downto 0);       
        soma_out: out std_logic_vector(3 downto 0)
    );
end soma;

architecture Behavioral of soma is
begin
    process(seq)
        variable count: integer := 0; -- Variável para contar bits ativos
        
    begin
        -- Inicializa contador
        count := 0;

        -- Percorre os 10 bits da sequência
        for i in 0 to 9 loop
            if seq(i) = '1' then
                count := count + 1; -- Incrementa para cada bit '1'
            end if;
        end loop;

        -- Converte o resultado para std_logic_vector e atribui à saída
        soma_out <= std_logic_vector(to_unsigned(count, 4)); -- Converte para 4 bits
    end process;
end Behavioral;
