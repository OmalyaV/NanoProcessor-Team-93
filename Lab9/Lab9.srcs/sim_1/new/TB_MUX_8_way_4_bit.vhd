----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 11:27:28 AM
-- Design Name: 
-- Module Name: TB_MUX_8_way_4_bit - Behavioral
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

entity TB_MUX_8_way_4_bit is
--  Port ( );
end TB_MUX_8_way_4_bit;

architecture Behavioral of TB_MUX_8_way_4_bit is
component MUX_8_way_4_bit 
      Port (  S : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIc;
            MUX_data_bit : in STD_LOGIC_VECTOR (31 downto 0);
            MUX_output : out STD_LOGIC_VECTOR(3 downto 0));
end component;
signal S :STD_LOGIC_VECTOR (2 downto 0);
signal EN:STD_LOGIC;
signal MUX_data_bit_0,MUX_data_bit_1,MUX_data_bit_2,MUX_data_bit_3,MUX_data_bit_4,MUX_data_bit_5,MUX_data_bit_6,MUX_data_bit_7:STD_LOGIC_VECTOR (3 downto 0);
signal MUX_output: STD_LOGIC_VECTOR(3 downto 0);

begin
UUT: MUX_8_way_4_bit port Map
(
    S => S,
    EN => EN,
    MUX_data_bit(3 downto 0) =>MUX_data_bit_0,
    MUX_data_bit(7 downto 4) =>MUX_data_bit_1,
    MUX_data_bit(11 downto 8) =>MUX_data_bit_2,
    MUX_data_bit(15 downto 12) =>MUX_data_bit_3,
    MUX_data_bit(19 downto 16) =>MUX_data_bit_4,
    MUX_data_bit(23 downto 20) =>MUX_data_bit_5,
    MUX_data_bit(27 downto 24) =>MUX_data_bit_6,
    MUX_data_bit(31 downto 28)=> MUX_data_bit_7,
    MUX_output => MUX_output
    
);

process begin
MUX_data_bit_0 <= "0101" ;--5
MUX_data_bit_1 <= "0100" ;--4
MUX_data_bit_2 <= "0111" ; --7
MUX_data_bit_3 <= "1000" ;--8
MUX_data_bit_4 <= "1001" ;--9
MUX_data_bit_5 <= "1011" ;--11-b
MUX_data_bit_6 <= "0001" ; --1
MUX_data_bit_7<= "0010" ; --2

EN <= '1';
S <= "100";--4
wait for 100ns;
S<= "001";--1
wait for 100ns;
S<= "101" ;--5
wait for 100ns;
end process;
end Behavioral;
