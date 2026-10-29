-- VHDL_1 homework; adapted from the course examples:
-- https://github.com/lizhuoh9/VHDL_code
-- Active-high display bus: display(7 downto 0) = a b c d e f g dp.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Hexadecimal decoder included in the problem 5 source file.
entity hex7seg is
    port (en : in std_logic; dat : in std_logic_vector(3 downto 0);
          display : out std_logic_vector(7 downto 0));
end entity;
architecture bhv of hex7seg is
begin
    process(en, dat)
    begin
        display <= (others => '0');
        if en = '1' then
            case dat is
                when "0000" => display <= "11111100";
                when "0001" => display <= "01100000";
                when "0010" => display <= "11011010";
                when "0011" => display <= "11110010";
                when "0100" => display <= "01100110";
                when "0101" => display <= "10110110";
                when "0110" => display <= "10111110";
                when "0111" => display <= "11100000";
                when "1000" => display <= "11111110";
                when "1001" => display <= "11110110";
                when "1010" => display <= "11101110";
                when "1011" => display <= "00111110";
                when "1100" => display <= "10011100";
                when "1101" => display <= "01111010";
                when "1110" => display <= "10011110";
                when "1111" => display <= "10001110";
                when others => display <= (others => '0');
            end case;
        end if;
    end process;
end architecture;

-- Problem 5 top-level module.
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
