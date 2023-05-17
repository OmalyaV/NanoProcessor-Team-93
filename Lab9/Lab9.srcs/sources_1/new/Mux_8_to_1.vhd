----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 06:06:57 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

component  Decoder_3_to_8
port(
        I : in STD_LOGIC_VECTOR;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR );
end component;
signal Y0 : STD_LOGIC_VECTOR(7 downto 0);
signal D0 : STD_LOGIC_VECTOR(7 downto 0);
signal Y1 : STD_LOGIC;
begin
Decoder_3_to_8_0 : Decoder_3_to_8
port map(
I => S,
EN => EN,
Y => Y0
);

D0<= (D(7 downto 0) AND Y0(7 downto 0));
Y1 <= D0(0) OR D0(1) OR D0(2) OR D0(3) OR D0(4) OR D0(5) OR D0(6) OR D0(7);
Y <= Y1 AND EN;









end Behavioral;
