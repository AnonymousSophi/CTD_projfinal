library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--usado para R2/E2
entity reg10bits is 
port(
	CLK, RST, enable: in std_logic;
	D: in std_logic_vector(9 downto 0);
	Q: out std_logic_vector(9 downto 0)
    );
end reg10bits;
        
architecture arqdtp of reg10bits is
    begin
    process(CLK,RST)
    begin
        if(enable = '1') then
            if(RST = '1') then
                Q <= "0000000000";
            elsif(CLK'event AND CLK = '1') then
    				Q <= D;		
            end if;
        end if;
    end process;
	 
end arqdtp;