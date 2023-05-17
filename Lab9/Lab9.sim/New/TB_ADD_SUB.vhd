----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2023 01:58:27 AM
-- Design Name: 
-- Module Name: TB_ADD_SUB - Behavioral
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

entity TB_ADD_SUB is
--  Port ( );
end TB_ADD_SUB;

architecture Behavioral of TB_ADD_SUB is
component RCA_Adder_Subtractor is
    port (  A,B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(3 downto 0);
            subtract: in std_logic;
            C_out, overflow: out std_logic);
end component;
signal A,B,S: std_logic_vector(3 downto 0);
signal subtract,C_out, overflow:std_logic;
begin
UUT: RCA_Adder_Subtractor PORT MAP(
        A=>A,B=>B,S=>S,subtract=>subtract,C_out=>C_out,overflow=>overflow);

PROCESS
BEGIN
    WAIT FOR 100 ns;
    subtract<='1';
    A<="1110";
    B<="0101";
    WAIT;
END PROCESS;


end Behavioral;
