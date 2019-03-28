----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2019 07:37:41 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end clock_div;

architecture Behavioral of clock_div is
    signal counter : std_logic_vector(26 downto 0) := (others => '0');
begin
    process (CLK_IN)
    begin 
        if(rising_edge(CLK_IN)) then
            if (unsigned(counter) < 62499999) then
               counter <= std_logic_vector(unsigned(counter) + 1);
            else
               counter <= (others => '0');
            end if;
        end if;
        if (unsigned(counter) = 31250000) then
            CLK_OUT <= '1';            
        else
            CLK_OUT <= '0';              
        end if;
    end process;

end Behavioral;
