library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity self_test is
    port(
        mclk, reset : in std_logic;
        c           : out std_logic;
        abcdefg_n   : out std_logic_vector(6 downto 0)
        );
end entity self_test;

architecture self_test_beh of self_test is
    component second_tick is
        port(
            mclk, reset : in std_logic;
            tick        : out std_logic
        );
    end component second_tick;

    component rom is
        port(
            adr          : in unsigned(3 downto 0);
            data0, data1 : out std_logic_vector(3 downto 0)
        );
    end component rom;

    component seg7ctrl is
        port(
            mclk, reset : in std_logic;
            d0, d1      : in std_logic_vector(3 downto 0);
            abcdefg     : out std_logic_vector(6 downto 0);
            c           : out std_logic
        );
    end component seg7ctrl;

    signal tick, current_c : std_logic;
    signal d0, d1          : std_logic_vector(3 downto 0);
    signal abcdefg         : std_logic_vector(6 downto 0);
    signal seconds_counter : unsigned(3 downto 0) := to_unsigned(0, 4);
    constant MAX_INDEX     : unsigned(3 downto 0) := to_unsigned(15, 4); --Maximum value to count and index rom before returning to 0.

    
begin
    TICK_0 : second_tick
    port map(
            mclk  => mclk,
            reset => reset,
            tick  => tick
    );

    ROM_0 : rom
    port map(
            adr => seconds_counter,
            data0 => d0,
            data1 => d1
    );

    CTRL_0 : seg7ctrl
    port map(
            mclk    => mclk,
            reset   => reset,
            d0      => d0,
            d1      => d1,
            abcdefg => abcdefg,
            c       => current_c
    );
    c <= current_c;
    abcdefg_n <= abcdefg;

    COUNT_SECONDS: process(tick)
    begin
        if (seconds_counter = MAX_INDEX) then
            seconds_counter <= (others => '0');
        elsif rising_edge(tick) then
            seconds_counter <= seconds_counter + 1;
        end if;
    end process COUNT_SECONDS;
end architecture self_test_beh;
