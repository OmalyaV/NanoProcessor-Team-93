----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 01:24:23 AM
-- Design Name: 
-- Module Name: TB_Adder_sub - Behavioral
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

entity TB_Adder_sub is
--  Port ( );
end TB_Adder_sub;

architecture Behavioral of TB_Adder_sub is
component RCA_Adder_Subtractor 
    port (  A,B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(3 downto 0);
            subtract: in std_logic;
            Zero:out std_logic;
            C_out, overflow: out std_logic);
end component;

signal A,B,S:std_logic_vector(3 downto 0);
signal subtract,Zero,C_out,overflow: std_logic;
begin
    UUT :RCA_Adder_Subtractor port map(
        A=>A,B=>B,S=>S,subtract=>subtract,Zero=>Zero,C_out=>C_out,overflow=>overflow);
process
begin
    wait for 20 ns;
    
    subtract<='0';
    A<="1010";
    B<="0011";
    wait for 100 ns;
    
    A<="0000";
    B<="0000";
    wait for 100 ns;
    
    subtract<='1';
    A<="1110";
    B<="0011";
    wait for 100 ns; 
    
     A<="0000";
     B<="0000";
     wait ;
end process;
end Behavioral;
