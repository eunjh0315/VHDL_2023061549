-- VHDL_1 homework; adapted from the course examples:
-- https://github.com/lizhuoh9/VHDL_code
-- Active-high display bus: display(7 downto 0) = a b c d e f g dp.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity p2_mux8_1 is
    port (din : in std_logic_vector(7 downto 0);
          sel : in std_logic_vector(2 downto 0);
          data : out std_logic);
end p2_mux8_1;
architecture bhv of p2_mux8_1 is
begin
    process(din, sel)
    begin
        case sel is
            when "000" => data <= din(0);
            when "001" => data <= din(1);
            when "010" => data <= din(2);
            when "011" => data <= din(3);
            when "100" => data <= din(4);
            when "101" => data <= din(5);
            when "110" => data <= din(6);
            when "111" => data <= din(7);
            when others => data <= '0';
        end case;
    end process;
end architecture;
