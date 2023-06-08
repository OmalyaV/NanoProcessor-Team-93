----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:24:20 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is
component NanoProcessor

Port ( 
    clock :in STD_LOGIC;
    reset: in STD_LOGIC;
    overflow: OUT std_logic;
    Zero : out std_logic;
    reg_7_out:out std_logic_vector(3 downto 0);
    reg_7_seven_seg :out std_logic_vector(6 downto 0);
    anode: out STD_LOGIC_VECTOR(3 downto 0)
 );
end component;

signal clock :STD_LOGIC:= '0';
signal reset, overflow, Zero: STD_LOGIC;
signal reg_7_out, anode:std_logic_vector(3 downto 0);
signal reg_7_seven_seg :std_logic_vector(6 downto 0);
begin
UUT: NanoProcessor port map
(
    clock => clock,
    reset => reset,
    overflow => overflow,
    Zero => Zero,
    reg_7_out => reg_7_out,
    reg_7_seven_seg => reg_7_seven_seg,
    anode => anode
            )
;

process begin 
clock<=not(clock);
WAIT FOR 2ns;
end process;
process begin 

reset <= '1';
wait;

end process;

end Behavioral;
