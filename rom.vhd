library IEEE;                                                                      
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity rom is
    port(
        adr          :in     unsigned(3 downto 0); --This will be an unsigned value from 0 to 15 controlled by the second tick generator.
        data0, data1 :out    std_logic_vector(3 downto 0)
    );
end entity rom;

architecture rom_beh of rom is
begin
    LOOKUP: process(adr, data0, data1)
        variable out0, out1 : std_logic_vector(3 downto 0);
    begin
        case adr is
            when to_unsigned(0, 4) =>
                out1 := x"1";
                out0 := x"2";
            when to_unsigned(1, 4) =>
                out1 := x"3";
                out0 := x"4";
            when to_unsigned(2, 4) =>
                out1 := x"4";
                out0 := x"0";
            when to_unsigned(3, 4) =>
                out1 := x"0";
                out0 := x"0";
            when to_unsigned(4, 4) =>
                out1 := x"5";
                out0 := x"6";
            when to_unsigned(5, 4) =>
                out1 := x"7";
                out0 := x"3";
            when to_unsigned(6, 4) =>
                out1 := x"0";
                out0 := x"0";
            when to_unsigned(7, 4) =>
                out1 := x"8";
                out0 := x"6";
            when to_unsigned(8, 4) =>
                out1 := x"9";
                out0 := x"0";
            when to_unsigned(9, 4) =>
                out1 := x"0";
                out0 := x"0";
            when to_unsigned(10, 4) =>
                out1 := x"A";
                out0 := x"B";
            when to_unsigned(11, 4) =>
                out1 := x"3";
                out0 := x"0";
            when to_unsigned(12, 4) =>
                out1 := x"0";
                out0 := x"0";
            when to_unsigned(13, 4) =>
                out1 := x"C";
                out0 := x"6";
            when to_unsigned(14, 4) =>
                out1 := x"6";
                out0 := x"5";
            when to_unsigned(15, 4) =>
                out1 := x"0";
                out0 := x"0";
            when others =>
                out1 := "XXXX";
                out0 := "XXXX";
        end case;
        data0 <= out0;
        data1 <= out1;
    end process LOOKUP;
end architecture rom_beh;
