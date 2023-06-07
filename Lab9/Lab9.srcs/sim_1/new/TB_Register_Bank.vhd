----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 10:20:55 AM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
component Register_Bank
    Port ( Clk : in STD_LOGIC;
         Reset : in STD_LOGIC;
         EN : in STD_LOGIC;
         MuxInput:  in STD_LOGIC_VECTOR (2 downto 0);
         Register_input : in STD_LOGIC_VECTOR (3 downto 0);
         MuxOutput : out STD_LOGIC_VECTOR(7 downto 0);
         register0 : out STD_LOGIC_VECTOR(3 downto 0);
         register1 : out STD_LOGIC_VECTOR(3 downto 0);
         register2 : out STD_LOGIC_VECTOR(3 downto 0);
         register3 : out STD_LOGIC_VECTOR(3 downto 0);
         register4 : out STD_LOGIC_VECTOR(3 downto 0);
         register5 : out STD_LOGIC_VECTOR(3 downto 0);
         register6 : out STD_LOGIC_VECTOR(3 downto 0);
         register7 : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal Clk,Reset,EN: STD_LOGIC;
signal MuxInput:STD_LOGIC_VECTOR (2 downto 0);
signal MuxOutput:STD_LOGIC_VECTOR (7 downto 0);
signal Register_input,register0,register1,register2,register3,register4,register5,register6,register7:STD_LOGIC_VECTOR(3 downto 0);

begin
    UUT: Register_Bank port map
        ( Clk=>Clk,Reset=>Reset,EN=>EN,MuxInput=>MuxInput,Register_input=>Register_input,
        MuxOutput=>MuxOutput,register0=>register0,register1=>register1,
        register2=>register2,register3=>register3,register4=>register4,
        register5=>register5,register6=>register6,register7=>register7
        );
process
begin
   Clk <= '0';
   wait for 50 ns;
   Clk <= '1';
   wait for 50 ns;
end process;

process 
begin
    
    wait for 150ns;
    EN <= '1';
    MuxInput <= "000";
    Reset <= '1';
    wait for 150ns;
    
    Reset <= '0';
    MuxInput <= "011";
    Register_input <= "0001";
    wait for 150ns;
    
    MuxInput <= "100";
    Register_input <= "0010";
    wait for 150ns;
    
    MuxInput <= "101";
    Register_input <= "0111";
    wait for 150ns;
     
    MuxInput <= "011";
    Register_input <= "0010";
    wait;
    
    
end process;
end Behavioral;
