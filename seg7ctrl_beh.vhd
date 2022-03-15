library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture seg7ctrl_beh2 of seg7ctrl is
    signal counter          :   unsigned(19 downto 0) := (others => '0');  --Will count up to 10 * 10^5 to get 100 Hz signal for c
    signal current_c        :   std_logic := '0';
    signal current_di       :   std_logic_vector(3 downto 0);
    constant COUNT_LIMIT    :   unsigned(19 downto 0) := to_unsigned(1000000, 20);

    --Creating a decoder function.
    function decode(indx : std_logic_vector(3 downto 0))
        return std_logic_vector is
            variable result : std_logic_vector(6 downto 0);
    begin
        case indx is                                                                 
            when "0000" =>                                                         
                result := "0000000";                                               
            when "0001" =>                                                         
                result := "0011110";                                               
            when "0010" =>                                                         
                result := "0111100";                                               
            when "0011" =>                                                         
                result := "1001111";                                               
            when "0100" =>                                                         
                result := "0001110";                                               
            when "0101" =>                                                         
                result := "0111101";                                               
            when "0110" =>                                                         
                result := "0011101";                                               
            when "0111" =>                                                         
                result := "0010101";                                               
            when "1000" =>                                                         
                result := "0111011";                                               
            when "1001" =>                                                         
                result := "0111110";                                               
            when "1010" =>                                                         
                result := "1110111";                                               
            when "1011" =>                                                         
                result := "0000101";                                               
            when "1100" =>                                                         
                result := "1111011";                                               
            when "1101" =>                                                         
                result := "0011100";                                               
            when "1110" =>                                                         
                result := "0001101";                                               
            when "1111" =>                                                         
                result := "1111111";                                               
            when others =>                                                         
                result := "XXXXXXX";                                               
        end case;  
        return result;
    end;

begin
    COUNT : process(mclk, reset)
    begin
        if reset then
            counter <= (others => '0');
        elsif (counter > COUNT_LIMIT + 1) then
            counter <= (others => '0');
            current_c <= not current_c;
        elsif rising_edge(mclk) then
            counter <= counter + 1;
        end if;
    end process COUNT;

    abcdefg <= decode(current_di);
    c <= current_c;
    current_di <= d1 when current_c else d0;


end architecture seg7ctrl_beh2;
