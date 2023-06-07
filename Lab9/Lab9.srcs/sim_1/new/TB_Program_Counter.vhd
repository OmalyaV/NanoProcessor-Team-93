----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 01:58:59 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
component Program_Counter
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Clk,Reset: std_logic;
signal D,Q:  STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT: Program_Counter port map(
        Clk=>Clk,Reset=>Reset,Q=>Q,D=>D);
process
begin
   Clk <= '0';
   wait for 10 ns;
   Clk <= '1';
   wait for 10 ns;
end process;

process
begin
    Reset <= '1';
    wait for 100ns;
 
    Reset <= '0';
    D <= "001";
    wait for 100ns;
   
    Reset <= '0';
    D <= "010";
    wait for 100ns;
    
    Reset <= '1';
    wait;
end process;

end Behavioral;
