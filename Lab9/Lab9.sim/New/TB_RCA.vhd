----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 03:20:32 PM
-- Design Name: 
-- Module Name: TB_RCA - Behavioral
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

entity TB_RCA is
--  Port ( );
end TB_RCA;

architecture Behavioral of TB_RCA is
COMPONENT RCA
        Port ( A :in STD_LOGIC_VECTOR(2 downto 0);
          B: in STD_LOGIC_VECTOR(2 downto 0);
          S : out STD_LOGIC_VECTOR(2 downto 0);
          C_in : in STD_LOGIC;
          C_out : out STD_LOGIC);
END COMPONENT;

SIGNAL C_in,C_out :STD_LOGIC;
SIGNAL A,B,S: STD_LOGIC_VECTOR(2 downto 0);

begin
UUT :RCA
    PORT MAP(
    A=>A,B=>B,S=>S,C_in=>C_in,C_out=>C_out);
 PROCESS
 BEGIN
    A<="000";
    B<="000";
    C_in<='0';
    WAIT FOR 100 ns;
    
     A<="000";
     B<="111";
     WAIT FOR 100 ns;
    
    A<="011";
     B<="100";
    WAIT FOR 100 ns;
     
         
    A<="111";
    B<="111";
     WAIT;
end process;
end Behavioral;
