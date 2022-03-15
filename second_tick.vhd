library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity second_tick is
    port(
        mclk, reset : in std_logic; --100 MHz clock
        tick        : out std_logic --A signal/clock that has a period of 1 second.
    );
end entity second_tick;

architecture second_tick_beh of second_tick is
    signal current_tick : std_logic := '0';
    signal counter      : unsigned(31 downto 0) := (others => '0'); 
    constant MAX_COUNT  : unsigned(31 downto 0) := to_unsigned(100000000, 32); --This will count up to a second

begin
    COUNT : process(tick)
    begin
        if reset then
            counter <= (others => '0');
            current_tick <= '0';
        elsif rising_edge(mclk) then
            if (counter > MAX_COUNT + 1) then
                current_tick <= '1';
                counter <= (others => '0');
            else
                current_tick <= '0';
                counter <= counter + 1;
            end if;
        end if;
        tick <= current_tick;
    end process COUNT;
end architecture second_tick_beh;
