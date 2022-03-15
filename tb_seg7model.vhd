library IEEE;                                                                      
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity tb_seg7model is

end entity tb_seg7model;

architecture behavioural of tb_seg7model is

    signal abcdefg_in, abcdefg_out  :   std_logic_vector(6 downto 0);
    signal disp0, disp1             :   std_logic_vector(3 downto 0);
    signal DI                       :   std_logic_vector(3 downto 0) := (others => '0');
    signal c, CLK, reset            :   std_logic;

    component bin2ssd is
        port(
            DI      :   in  std_logic_vector(3 downto 0);
            abcdefg :   out std_logic_vector(6 downto 0)
        );
    end component bin2ssd;

    component seg7model is
        port(
            c         : in  std_logic;
            abcdefg   : in  std_logic_vector(6 downto 0);
            disp1     : out std_logic_vector(3 downto 0);
            disp0     : out std_logic_vector(3 downto 0)
        );
    end component seg7model;
begin
    BIN_1 : bin2ssd
    port map(
            DI      => DI,
            abcdefg => abcdefg_out
        ); 
    SEG_1 : seg7model 
    port map(
            c       => c,
            abcdefg => abcdefg_in,
            disp0   => disp0,
            disp1   => disp1
        );
   abcdefg_in <= abcdefg_out; 
    
    CLK_0:
    process
    begin
        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process CLK_0;

    CYCLE_DISP:
    process(CLK)
    begin
        if rising_edge(CLK) then
            c <= '1';
        else
            c <= '0';
        end if;
    end process CYCLE_DISP;

    FEED_INPUT:
    process
    begin
        wait for 100 ns;
        DI <= "0000" when (DI = "1111") else std_logic_vector(unsigned(DI) + 1);
    end process FEED_INPUT;

end architecture behavioural;
