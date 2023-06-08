----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 04:55:13 PM
-- Design Name: 
-- Module Name: TB_adder_3_bit - Behavioral
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

entity TB_adder_3_bit is
--  Port ( );
end TB_adder_3_bit;

architecture Behavioral of TB_adder_3_bit is
component adder_3bit
Port ( A :in STD_LOGIC_VECTOR(2 downto 0);
       B: in STD_LOGIC_VECTOR(2 downto 0);
       S : out STD_LOGIC_VECTOR(2 downto 0);
       C_in : in STD_LOGIC:= '0' ;
       C_out : out STD_LOGIC);
 end component;
 
 

begin


end Behavioral;
