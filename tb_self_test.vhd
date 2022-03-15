library IEEE;                                                                      
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

--I run this for 17 seconds and check that it does the right think in the waveform
entity tb_self_test is

end entity tb_self_test;

architecture behavioural of tb_self_test is
    component self_test is
        port(
            mclk      : in std_logic; --100MHz, positive flank                              
            reset     : in std_logic; --Asynchronous reset, active high                    
            abcdefg_n : out std_logic_vector(6 downto 0);                                
            c         : out std_logic
        );
    end component self_test;

    signal mclk, reset      :   std_logic := '0';
    signal c                :   std_logic;
    signal abcdefg          :   std_logic_vector(6 downto 0);
    constant HALF_PERIOD    :   time := 5 ns;

begin
   mclk <= not mclk after HALF_PERIOD;

   TEST_0 : self_test
   port map(
            mclk      => mclk,
            reset     => reset,
            abcdefg_n => abcdefg,
            c         => c
            );
end architecture behavioural;
