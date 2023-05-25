----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 01:49:56 AM
-- Design Name: 
-- Module Name: MUX_2_way_3_bit - Behavioral
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

entity MUX_2_way_3_bit is
    Port ( MUX_2_way_3_bit_DATA : in STD_LOGIC_VECTOR (5 downto 0);
           MUX_2_way_3_bit_controls:in STD_LOGIC;
           MUX_2_way_3_bit_EN : in STD_LOGIC;
           MUX_2_way_3_bit_OUT : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_way_3_bit;

architecture Behavioral of MUX_2_way_3_bit is
    component Decoder_1_to_2
    Port ( Decoder_1_to_2_IN : in STD_LOGIC;
           EN_decoder_1_to_2 : in STD_LOGIC;
           Decoder_1_to_2_OUT : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    signal Decoder_output_signal_1to2 : STD_LOGIC_VECTOR(1 downto 0);
    signal MUX_data_bit_signal_2way3bit : STD_LOGIC_VECTOR(5 downto 0);
    signal  MUX_enable_signal_2way3bit : STD_LOGIC_VECTOR(2 downto 0);

begin
Decoder_1_to_2_0 : Decoder_1_to_2
port map(
Decoder_1_to_2_IN => MUX_2_way_3_bit_controls,
EN_decoder_1_to_2  => MUX_2_way_3_bit_EN,
Decoder_1_to_2_OUT  => Decoder_output_signal_1to2
);
MUX_enable_signal_2way3bit(2 downto 0) <= (others => MUX_2_way_3_bit_EN);
MUX_data_bit_signal_2way3bit(2 downto 0)<= (others=> Decoder_output_signal_1to2(0));
MUX_data_bit_signal_2way3bit(5 downto 3)<= (others=> Decoder_output_signal_1to2(1));

MUX_2_way_3_bit_OUT <= (
   ( MUX_data_bit_signal_2way3bit(2 downto 0) AND MUX_2_way_3_bit_DATA(2 downto 0)) OR
   (MUX_data_bit_signal_2way3bit(5 downto 3) AND MUX_2_way_3_bit_DATA(5 downto 3))
    ) AND MUX_enable_signal_2way3bit(2 downto 0);



end Behavioral;
