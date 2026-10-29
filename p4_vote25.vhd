-- VHDL_1 homework; adapted from the course examples:
-- https://github.com/lizhuoh9/VHDL_code
-- Active-high display bus: display(7 downto 0) = a b c d e f g dp.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity p4_vote25 is
    port (vt : in std_logic_vector(24 downto 0);
          count : out std_logic_vector(4 downto 0);
          result : out std_logic);
end entity;
architecture bhv of p4_vote25 is
begin
    process(vt)
        variable sum : integer range 0 to 25;
    begin
        sum := 0;
        for i in vt'range loop
            if vt(i) = '1' then sum := sum + 1; end if;
        end loop;
        count <= std_logic_vector(to_unsigned(sum, 5));
        -- Assign on every path, including vt = all zeros (no latch).
        if sum >= 13 then result <= '1'; else result <= '0'; end if;
    end process;
end architecture;
