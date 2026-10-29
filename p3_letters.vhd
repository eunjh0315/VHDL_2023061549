-- VHDL_1 homework; adapted from the course examples:
-- https://github.com/lizhuoh9/VHDL_code
-- Active-high display bus: display(7 downto 0) = a b c d e f g dp.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- code 0..5 selects a,b,c,d,f,g; 6 and 7 blank the display.
-- Seven-segment glyph approximations: A, b, C, d, F, g.
entity p3_letters is
    port (code : in std_logic_vector(2 downto 0);
          display : out std_logic_vector(7 downto 0));
end entity;
architecture bhv of p3_letters is
begin
    process(code)
    begin
        display <= (others => '0');
        case code is
                when "000" => display <= "11101110"; -- a (A)
                when "001" => display <= "00111110"; -- b
                when "010" => display <= "10011100"; -- c (C)
                when "011" => display <= "01111010"; -- d
                when "100" => display <= "10001110"; -- f (F)
                when "101" => display <= "11110110"; -- g
            when others => display <= (others => '0');
        end case;
    end process;
end architecture;
