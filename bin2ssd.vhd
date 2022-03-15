library IEEE;
use IEEE.std_logic_1164.all;

entity bin2ssd is
    port(
        DI      : in    std_logic_vector(3 downto 0);
        abcdefg : out   std_logic_vector(6 downto 0)
    );
end entity bin2ssd;

architecture main of bin2ssd is
    signal result   : std_logic_vector(6 downto 0);
begin
    process(DI)
    begin
        case DI is
            when "0000" =>
                result <= "1111110";
            when "0001" =>
                result <= "0110000";
            when "0010" =>
                result <= "1101101";
            when "0011" =>
                result <= "1111001";
            when "0100" =>
                result <= "0110011";
            when "0101" =>
                result <= "1011011";
            when "0110" =>
                result <= "1011111";
            when "0111" =>
                result <= "1110000";
            when "1000" =>
                result <= "1111111";
            when "1001" =>
                result <= "1110011";
            when "1010" =>
                result <= "1110111";
            when "1011" =>
                result <= "0011111";
            when "1100" =>
                result <= "1001110";
            when "1101" =>
                result <= "0111101";
            when "1110" =>
                result <= "1001111";
            when "1111" =>
                result <= "1000111";
            when others =>
                result <= "0000000";
        end case;
    end process;
    abcdefg <= result;
end architecture main;
