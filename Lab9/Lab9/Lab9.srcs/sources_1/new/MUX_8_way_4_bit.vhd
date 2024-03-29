----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 06:06:57 PM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit - Behavioral
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

entity Mux_8_way_4_bit is
    Port (  S : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIc;
            MUX_data_bit : in STD_LOGIC_VECTOR (31 downto 0);
            MUX_output : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is

component  Decoder_3_to_8
port(
        I : in STD_LOGIC_VECTOR;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR );
end component;

signal decoder_output_signal_3to8 : STD_LOGIC_VECTOR(7 downto 0);
signal MUX_data_bi_signal : STD_LOGIC_VECTOR(31 downto 0);
signal  MUX_enable_signal : STD_LOGIC_VECTOR(3 downto 0);
begin
Decoder_3_to_8_0 : Decoder_3_to_8
port map(
I => S,
EN => EN,
Y => decoder_output_signal_3to8
);
MUX_data_bi_signal(3 downto 0)<=   ( decoder_output_signal_3to8(0) & decoder_output_signal_3to8(0) & decoder_output_signal_3to8(0) & decoder_output_signal_3to8(0));
MUX_data_bi_signal(7 downto 4)<=   ( decoder_output_signal_3to8(1) & decoder_output_signal_3to8(1) & decoder_output_signal_3to8(1) & decoder_output_signal_3to8(1));
MUX_data_bi_signal(11 downto 8)<=  ( decoder_output_signal_3to8(2) & decoder_output_signal_3to8(2) & decoder_output_signal_3to8(2) & decoder_output_signal_3to8(2));
MUX_data_bi_signal(15 downto 12)<= ( decoder_output_signal_3to8(3) & decoder_output_signal_3to8(3) & decoder_output_signal_3to8(3) & decoder_output_signal_3to8(3));
MUX_data_bi_signal(19 downto 16)<= ( decoder_output_signal_3to8(4) & decoder_output_signal_3to8(4) & decoder_output_signal_3to8(4) & decoder_output_signal_3to8(4));
MUX_data_bi_signal(23 downto 20)<= ( decoder_output_signal_3to8(5) & decoder_output_signal_3to8(5) & decoder_output_signal_3to8(5) & decoder_output_signal_3to8(5));
MUX_data_bi_signal(27 downto 24)<= ( decoder_output_signal_3to8(6) & decoder_output_signal_3to8(6) & decoder_output_signal_3to8(6) & decoder_output_signal_3to8(6));
MUX_data_bi_signal(31 downto 28)<= ( decoder_output_signal_3to8(7) & decoder_output_signal_3to8(7) & decoder_output_signal_3to8(7) & decoder_output_signal_3to8(7));

MUX_enable_signal <= ( EN & EN & EN & EN );

MUX_output<=(
        ((MUX_data_bi_signal(3 downto 0) AND  MUX_data_bit(3 downto 0)) OR
        (MUX_data_bi_signal(7 downto 4)  AND  MUX_data_bit(7 downto 4)) OR
        (MUX_data_bi_signal(11 downto 8) AND  MUX_data_bit(11 downto 8)) OR
        (MUX_data_bi_signal(15 downto 12) AND  MUX_data_bit(15 downto 12)) OR
        (MUX_data_bi_signal(19 downto 16)AND  MUX_data_bit(19 downto 16)) OR
        (MUX_data_bi_signal(23 downto 20)AND  MUX_data_bit(23 downto 20)) OR
        (MUX_data_bi_signal(27 downto 24) AND  MUX_data_bit(27 downto 24)) OR
        (MUX_data_bi_signal(31 downto 28) AND  MUX_data_bit(31 downto 28)) ) AND MUX_enable_signal

) ;









end Behavioral;
