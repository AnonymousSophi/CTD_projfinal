library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--usado para R2/E1
entity reg8bits is
port (
	CLK, RST, enable: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
);
end reg8bits;
        
architecture arqdtp of reg8bits is
    begin
    process(CLK,RST)
    begin
        if(enable = '1') then
            if(RST = '1') then
                Q <= "00000000";
            elsif(CLK'event AND CLK = '1') then
    				Q <= D;		
            end if;
        end if;
    end process;
	 
end arqdtp;