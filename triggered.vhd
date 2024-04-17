----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 15:24:02
-- Design Name: 
-- Module Name: counter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity triggered is
  generic (trigger_counter : integer := 100);
  Port (
    clk : in std_logic;
    rst : in std_logic;
    tx : out std_logic 
  );
end triggered;

architecture Behavioral of triggered is
    signal counter : integer;
begin
    process (clk) begin
        if rising_edge (clk) then
            if rst = '1' then
                counter <= 0;
                tx <= '0';
            else
                counter <= counter + 1;
                tx <= '0';
                if (counter = trigger_counter) then
                    counter <= 0;
                    tx <= '1';
                end if;
            end if;
        end if;
    end process;
       
end Behavioral;
