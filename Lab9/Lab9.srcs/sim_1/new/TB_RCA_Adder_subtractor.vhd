----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 09:32:30 AM
-- Design Name: 
-- Module Name: TB_RCA_Adder_subtractor - Behavioral
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

entity TB_RCA_Adder_subtractor is
--  Port ( );
end TB_RCA_Adder_subtractor;

architecture Behavioral of TB_RCA_Adder_subtractor is
component RCA_Adder_Subtractor
 port (  A,B: in std_logic_vector(3 downto 0);
           S: out std_logic_vector(3 downto 0);
           subtract: in std_logic;
           Zero:out std_logic;
           C_out, overflow: out std_logic);
           
end component;
signal A,B ,S: STD_LOGIC_VECTOR(3 downto 0);
signal subtract, Zero, C_out, overflow: STD_LOGIC;


begin
UUT :RCA_Adder_Subtractor
PORT MAP
( A => A,
B => B,
S => S,
subtract => subtract,
Zero => Zero,
C_out => C_out,
overflow => overflow
);



process begin
subtract<= '0';
A<= "0000";
B <= "0001";
wait for 10ns;
A<= "1111";
B<= "1010";
wait for 10ns;
A<= "1111";
B<= "1111";
wait for 10ns;
subtract<= '0';
A<= "1111";
B<= "1011";
wait for 10ns;
end process;



end Behavioral;
