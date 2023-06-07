----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 04:53:39 PM
-- Design Name: 
-- Module Name: TB_Adder_3Bit - Behavioral
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

entity TB_Adder_3Bit is
--  Port ( );
end TB_Adder_3Bit;

architecture Behavioral of TB_Adder_3Bit is
component adder_3bit 
    Port ( A :in STD_LOGIC_VECTOR(2 downto 0);
           B: in STD_LOGIC_VECTOR(2 downto 0);
           S : out STD_LOGIC_VECTOR(2 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal C_in : STD_LOGIC;
signal C_out: STD_LOGIC;
signal A,B,S: STD_LOGIC_VECTOR(2 downto 0);
begin
 UUT: adder_3bit port map(
        A=>A,B=>B,C_in=>C_in,S=>S,C_out=>C_out);

process
begin
   A<="101";
   B<="001";
   wait for 100 ns;
   
   A<="000";
   B<="000";
   wait for 100 ns;
   
  
   A<="111";
   B<="011";
   wait for 100 ns; 
   
    A<="111";
    B<="111";
    wait ;
end process;
end Behavioral;
