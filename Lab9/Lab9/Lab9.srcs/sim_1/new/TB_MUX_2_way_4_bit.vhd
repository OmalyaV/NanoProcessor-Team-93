----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 10:31:27 AM
-- Design Name: 
-- Module Name: TB_MUX_2_way_4_bit - Behavioral
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

entity TB_MUX_2_way_4_bit is
--  Port ( );
end TB_MUX_2_way_4_bit;

architecture Behavioral of TB_MUX_2_way_4_bit is
component MUX_2_way_4_bit
Port ( MUX_2_way_4_bit_DATA : in STD_LOGIC_VECTOR (7 downto 0);
           MUX_2_way_4_bit_controls : in STD_LOGIC;
           MUX_2_way_4_bit_EN : in STD_LOGIC;
           MUX_2_way_4_bit_OUT : out STD_LOGIC_VECTOR (3 downto 0));
 
end component;
signal  MUX_2_way_4_bit_DATA : STD_LOGIC_VECTOR(7 downto 0);
signal  MUX_2_way_4_bit_controls, MUX_2_way_4_bit_EN: STD_LOGIC;
signal MUX_2_way_4_bit_OUT: STD_LOGIC_VECTOR(3 downto 0); 
begin
UUT: MUX_2_way_4_bit 
PORT MAP(
    MUX_2_way_4_bit_DATA =>MUX_2_way_4_bit_DATA,
    MUX_2_way_4_bit_controls=> MUX_2_way_4_bit_controls,
    MUX_2_way_4_bit_EN => MUX_2_way_4_bit_EN,
    MUX_2_way_4_bit_OUT =>MUX_2_way_4_bit_OUT
    
);

process begin
MUX_2_way_4_bit_EN<= '1';
MUX_2_way_4_bit_DATA <= "01101001";
MUX_2_way_4_bit_controls<= '1';
wait for 100ns;
MUX_2_way_4_bit_DATA <= "01101010";
MUX_2_way_4_bit_controls<= '0';
wait for 100ns;
MUX_2_way_4_bit_EN <='0';
end process;
end Behavioral;
