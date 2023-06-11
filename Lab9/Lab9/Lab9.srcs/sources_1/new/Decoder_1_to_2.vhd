----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 01:42:01 AM
-- Design Name: 
-- Module Name: Decoder_1_to_2 - Behavioral
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

entity Decoder_1_to_2 is
    Port ( Decoder_1_to_2_IN : in STD_LOGIC;
           EN_decoder_1_to_2 : in STD_LOGIC;
           Decoder_1_to_2_OUT : out STD_LOGIC_VECTOR (1 downto 0));
end Decoder_1_to_2;

architecture Behavioral of Decoder_1_to_2 is

begin
Decoder_1_to_2_OUT(0)<= NOT(Decoder_1_to_2_IN) AND EN_decoder_1_to_2;
Decoder_1_to_2_OUT(1)<= Decoder_1_to_2_IN AND EN_decoder_1_to_2;


end Behavioral;
