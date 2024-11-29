library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity comp is
    port(seq_user : in std_logic_vector(9 downto 0);  -- Seq do usuário
        seq_reg  : in std_logic_vector(9 downto 0);   -- Seq correta da ROM
        seq_mask : out std_logic_vector(9 downto 0)   -- indica os bits corretos
        );
end comp;

architecture bhv of comp is
begin
    process(seq_user, seq_reg)
    begin
        
        -- Compara bit a bit seq_user e seq_reg
        seq_mask <= (seq_user and seq_reg); -- mask ativa onde ambos os bits são '1'
    end process;
end bhv;
