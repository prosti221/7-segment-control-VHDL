library IEEE;                                                                      
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity tb_seg7ctrl is

end entity tb_seg7ctrl;

architecture behavioural of tb_seg7ctrl is
    component seg7model is
        port(
            c         : in  std_logic;
            abcdefg   : in  std_logic_vector(6 downto 0);
            disp1     : out std_logic_vector(3 downto 0);
            disp0     : out std_logic_vector(3 downto 0)
        );
    end component seg7model;

    component seg7ctrl is
        port(
            mclk    : in std_logic; --100MHz, positive flank                              
            reset   : in std_logic; --Asynchronous reset, active high                    
            d0      : in std_logic_vector(3 downto 0);                                      
            d1      : in std_logic_vector(3 downto 0);                                      
            abcdefg : out std_logic_vector(6 downto 0);                                
            c       : out std_logic  
        );
    end component seg7ctrl;

    signal mclk, reset      :   std_logic := '0';
    signal c                :   std_logic;
    signal d0, d1           :   std_logic_vector(3 downto 0);
    signal disp0, disp1     :   std_logic_vector(3 downto 0);
    signal abcdefg          :   std_logic_vector(6 downto 0);
    constant HALF_PERIOD    :   time := 5 ns;

begin
    mclk <= not mclk after HALF_PERIOD;

    MODEL : seg7model
    port map(
             c       => c,
             abcdefg => abcdefg,
             disp1   => disp1,
             disp0   => disp0
     );

    CTRL : seg7ctrl
    port map(
             mclk    => mclk,
             reset   => reset,
             d0      => d0,
             d1      => d1,
             abcdefg => abcdefg,
             c       => c);
    --Testing with fixed values for DI
    d0 <= "0100";
    d1 <= "0101";
end architecture behavioural;
