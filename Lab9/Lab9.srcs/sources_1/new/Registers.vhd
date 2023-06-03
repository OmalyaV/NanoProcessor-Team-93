----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:28:39 PM
-- Design Name: 
-- Module Name: Registers - Behavioral
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

entity Registers is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Registers;

architecture Behavioral of Registers is
    signal D_Reg:std_logic_vector( 3 downto 0);

begin
process(Clk)
begin
    if rising_edge(Clk) then
        if Reset='1' then
            D_Reg<= "0000";
        elsif (EN = '1') then
             D_Reg <= D;
        end if;
    end if;
end process;

Q<=D_Reg;

end Behavioral;
