library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_arith.all;


entity counter0to10 is
port(Enable, Reset, CLOCK: in std_logic;
	 Round: out std_logic_vector(3 downto 0);
	 end_round: out std_logic
	 );
end counter0to10;

architecture bhv of counter0to10 is
    signal count: unsigned(3 downto 0) := (others => '0'); -- Contador interno como unsigned
begin

    -- Process contagem
    
    process(CLOCK, Reset)
    begin
        -- Verifica o Reset (assíncrono)
        
        if Reset = '1' then
            count <= (others => '0');    -- Rst contador p/ 0
        elsif rising_edge(CLOCK) then
        
            -- Incrementa contador se Enable ativo
            
            if Enable = '1' then
                if count = 10 then
                    count <= (others => '0'); -- Rst contador após 10
                else
                    count <= count + 1;       -- Incrementa contador
                end if;
            end if;
        end if;
    end process;


    Round <= std_logic_vector(count);

    -- Ativa sinal end_round p/ contador = 10
    
    end_round <= '1' when count = 10 else '0';

end bhv;