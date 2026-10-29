-- VHDL_1 homework; adapted from the course examples:
-- https://github.com/lizhuoh9/VHDL_code
-- Active-high display bus: display(7 downto 0) = a b c d e f g dp.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity p1_logic4 is
    port (a, b, c, d : in std_logic; out1, out2 : out std_logic);
end entity;
architecture bhv of p1_logic4 is
begin
    out1 <= a and b and c and d;
    out2 <= a or b or c or d;
end architecture;
