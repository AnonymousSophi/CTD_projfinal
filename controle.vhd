library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port (
        BTN1, BTN0, clock_50 : in std_logic;
        sw_erro, end_game, end_time, end_round : in std_logic;
        R1, R2, E1, E2, E3, E4, E5 : out std_logic
    );
end entity;

architecture arc of controle is
    type State is (Start, Setup, Play, Count_Round, Check, Waits, Result);  -- Todos os estados
    signal EA, PE : State := Start;                                         -- Estado atual/próximo estado
    signal enter : std_logic;                                               -- Sincronizado com ButtonSync
begin

    -- Sincronização de BTN1 com ButtonSync
    enter <= BTN1;

    -- Atualiza o estado atual com clock ou reset
    
    process(clock_50, BTN0)
    begin
        if BTN0 = '1' then
            EA <= Start;    -- Reset
        elsif (clock_50'event and clock_50 = '1') then
            EA <= PE;       -- Avança para o próximo estado
        end if;
    end process;

    
    -- Define próx estado e saídas
    
    process(EA, enter, sw_erro, end_game, end_time, end_round)
    begin
        
       -- Valor padrão saída
        
        R1 <= '0';
        R2 <= '0';
        E1 <= '0';
        E2 <= '0';
        E3 <= '0';
        E4 <= '0';
        E5 <= '0';

        case EA is
            when Start =>
                if enter = '1' then
                    PE <= Setup;
                else
                    PE <= Start;
                end if;
                R1 <= '1';  -- Reset contadores

            when Setup =>
                if enter = '1' then
                    PE <= Play;
                else
                    PE <= Setup;
                end if;
                R2 <= '1';  -- Config inicial

            when Play =>
                if end_time = '1' then
                    PE <= Result;   -- Tempo acabou
                elsif enter = '1' then
                    PE <= Count_Round; 
                else
                    PE <= Play;
                end if;
                E1 <= '1';  -- Ativa counter_time

            when Count_Round =>
                PE <= Check;
                E2 <= '1';  -- Incrementa rodada

            when Check =>
                if sw_erro = '1' then
                    PE <= Result;           -- Erro do jogador
                elsif end_game = '1' then
                    PE <= Result;           -- Jogo completo
                elsif end_round = '1' then
                    PE <= Result;           -- Máx rodadas
                else
                    PE <= Waits;    -- Próx rodada
                end if;
                E3 <= '1';  -- Verifica condições

            when Waits =>
                if enter = '1' then
                    PE <= Play; -- Próx rodada
                else
                    PE <= Waits;
                end if;
                E4 <= '1'; -- Prepara próx rodada

            when Result =>
                if enter = '1' then
                    PE <= Start; -- Rst jogo
                else
                    PE <= Result;
                end if;
                E5 <= '1'; -- Resultado final

            when others =>
                PE <= Start;
        end case;
    
    end process;

end architecture;
