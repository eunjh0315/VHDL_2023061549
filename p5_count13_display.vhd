-- VHDL_1 homework; adapted from the course examples:
-- https://github.com/lizhuoh9/VHDL_code
-- Active-high display bus: display(7 downto 0) = a b c d e f g dp.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity p5_count13_display is
    port (vt : in std_logic_vector(12 downto 0); en : in std_logic;
          count : out std_logic_vector(3 downto 0);
          display : out std_logic_vector(7 downto 0));
end entity;
architecture bhv of p5_count13_display is
    signal counted : std_logic_vector(3 downto 0);
begin
    process(vt)
        variable sum : integer range 0 to 13;
    begin
        sum := 0;
        for i in vt'range loop
            if vt(i) = '1' then sum := sum + 1; end if;
        end loop;
        counted <= std_logic_vector(to_unsigned(sum, 4));
    end process;
    count <= counted;
    decoder : entity work.hex7seg(bhv)
        port map (en => en, dat => counted, display => display);
    -- A 13-bit input can contain at most 13 ones: E/F cannot occur here.
end architecture;
