-- VHDL_1 assignment, newly implemented from the lecture examples.
-- Reference: https://github.com/lizhuoh9/VHDL_code
library ieee;
use ieee.std_logic_1164.all;

entity count13_display is
    port (
        vt : in std_logic_vector(12 downto 0);
        en : in std_logic;
        display : out std_logic_vector(7 downto 0)
    );
end entity count13_display;

architecture behavioral of count13_display is
begin
    -- Active high; bus order is a,b,c,d,e,f,g,dp. Decimal point stays off.
    process(vt, en)
        variable total : integer range 0 to 15;
    begin
        total := 0;
        for i in vt'range loop
            if vt(i) = '1' then
                total := total + 1;
            end if;
        end loop;
        display <= "00000000";
        if en = '1' then
            case total is
                when  0 => display <= "11111100"; -- 0
                when  1 => display <= "01100000"; -- 1
                when  2 => display <= "11011010"; -- 2
                when  3 => display <= "11110010"; -- 3
                when  4 => display <= "01100110"; -- 4
                when  5 => display <= "10110110"; -- 5
                when  6 => display <= "10111110"; -- 6
                when  7 => display <= "11100000"; -- 7
                when  8 => display <= "11111110"; -- 8
                when  9 => display <= "11110110"; -- 9
                when 10 => display <= "11101110"; -- A
                when 11 => display <= "00111110"; -- b
                when 12 => display <= "10011100"; -- C
                when 13 => display <= "01111010"; -- d
                when 14 => display <= "10011110"; -- E
                when 15 => display <= "10001110"; -- F
                when others => display <= "00000000";
            end case;
        end if;
        -- Only 0..13 can occur from vt. E/F are included for decoder completeness.
    end process;
end architecture behavioral;
