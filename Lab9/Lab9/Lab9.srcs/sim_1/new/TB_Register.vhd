----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:45:42 PM
-- Design Name: 
-- Module Name: TB_Register - Behavioral
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

entity TB_Register is
--  Port ( );
end TB_Register;

architecture Behavioral of TB_Register is
component Registers 
     Port ( Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          EN: in STD_LOGIC;
          D : in STD_LOGIC_VECTOR (3 downto 0);
          Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk,Reset,EN: std_logic;
signal D,Q:  STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: Registers port map(
        Clk=>Clk,Reset=>Reset,Q=>Q,D=>D,EN=>EN);
process
begin
     Clk <= '0';
   wait for 10 ns;
   Clk <= '1';
   wait for 10 ns;
end process;

process
begin
    EN <= '1';
    Reset <= '1';
    wait for 100ns;
    
    EN <= '1';
    Reset <= '0';
    D <= "0011";
    wait for 100ns;
    
    EN <= '0';
    Reset <= '0';
    D <= "0100";
    wait for 100ns;
    
    EN <= '1';
    Reset <= '1';
    wait;
end process;
end Behavioral;
