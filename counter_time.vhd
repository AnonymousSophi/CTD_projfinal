library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- Permite operações aritméticas diretamente com std_logic_vector

entity counter_time is
    port(
        Enable   : in std_logic;
        Reset    : in std_logic;
        CLOCK    : in std_logic;
        load     : in std_logic_vector(3 downto 0); -- Valor inicial da contagem
        end_time : out std_logic;                  -- Sinal ativo quando o tempo acaba
        tempo    : out std_logic_vector(3 downto 0) -- Valor atual do contador
    );
end counter_time;

architecture arqtime of counter_time is
    signal count : std_logic_vector(3 downto 0) := (others => '0'); -- Contador interno
begin

    -- Controla o contador
    process(CLOCK, Reset)
    begin
        if Reset = '1' then
            count <= load; -- Reseta o contador com o valor inicial
        elsif rising_edge(CLOCK) then
            if Enable = '1' then
                if count = "0000" then
                    count <= "0000"; -- Mantém 0
                else
                    count <= count - 1; -- Decresce o contador
                end if;
            end if;
        end if;
    end process;

    -- Define o sinal de fim de contagem
    end_time <= '1' when count = "0000" else '0';

    -- Saída do valor atual do contador
    tempo <= count;

end arqtime;