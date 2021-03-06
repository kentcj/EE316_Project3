----------------------------------------------------------------------------------
-- Filename: clk_gen.vhd
-- Author: Chandler Kent
-- Date Created: 2/28/21
-- Last Modified: 3/4/21
-- Description: Clock generation code
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_gen is
  port (
    I_CLK_50MHz : in  std_logic;
    I_RESET_N   : in std_logic;
    Data_in     : in std_logic_vector(7 downto 0);
    Clock_out   : out std_logic
  );
end clk_gen;

architecture archclk_gen of clk_gen is

  signal eightBitCounter: unsigned(7 downto 0) := (others => '0');
   
begin
  gen : process (I_CLK_50MHz, I_RESET_N)
    begin
        if(I_RESET_N = '1') then 
            eightBitCounter <= (others => '0');
    
    
        elsif(rising_edge(I_CLK_50MHz)) then
            if (std_logic_vector(eightBitCounter) <= Data_in) then
                Clock_out <= '1';
                --add counter to register value

            else
                eightBitCounter <= eightBitCounter + 1;
        end if;
     end if;
  end process gen;
end architecture;
