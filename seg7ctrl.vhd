library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity seg7ctrl is
    port
    (
        mclk    : in std_logic; --100MHz, positive flank
        reset   : in std_logic; --Asynchronous reset, active high
        d0      : in std_logic_vector(3 downto 0);
        d1      : in std_logic_vector(3 downto 0);
        abcdefg : out std_logic_vector(6 downto 0);
        c       : out std_logic
    );
end entity seg7ctrl;

architecture seg7ctrl_beh of seg7ctrl is
    signal counter          :   unsigned(19 downto 0) := (others => '0');  --Will count up to 10 * 10^5 to get 100 Hz signal for c
    signal current_c        :   std_logic := '0';
    signal current_di       :   std_logic_vector(3 downto 0);
    signal current_abcdefg  :   std_logic_vector(6 downto 0);
    constant COUNT_LIMIT    :   unsigned(19 downto 0) := to_unsigned(1000000, 20);

    component bin2ssd is
    port(
        DI      :   in  std_logic_vector(3 downto 0);
        abcdefg :   out std_logic_vector(6 downto 0)
    );
    end component bin2ssd;

begin
    BIN : bin2ssd
    port map(
            DI      => current_di,
            abcdefg => current_abcdefg
    );

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

    abcdefg <= current_abcdefg;
    c <= current_c;
    current_di <= d1 when current_c else d0;


end architecture seg7ctrl_beh;
