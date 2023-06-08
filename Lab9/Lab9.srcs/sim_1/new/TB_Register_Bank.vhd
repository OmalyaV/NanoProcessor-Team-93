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
    Port ( Clk : in STD_LOGIC:='0';
          Reset : in STD_LOGIC:= '0';
          Register_enable : in STD_LOGIC_VECTOR(2 downto 0);
          Register_input : in STD_LOGIC_VECTOR (3 downto 0);
          register0 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register1 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register2 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register3 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register4 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register5 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register6 : out STD_LOGIC_VECTOR(3 downto 0):="0000";
          register7 : out STD_LOGIC_VECTOR(3 downto 0):="0000");
end component;

signal Clk: STD_LOGIC:='0';
signal Reset: STD_LOGIC;
signal Register_enable:STD_LOGIC_VECTOR (2 downto 0);
signal Register_input,register0,register1,register2,register3,register4,register5,register6,register7:STD_LOGIC_VECTOR(3 downto 0);

begin
    UUT: Register_Bank port map
        ( Clk=>Clk,
        Reset=>Reset,
        Register_input=>Register_input,
        Register_enable =>Register_enable,
        register0=>register0,
        register1=>register1,
        register2=>register2,
        register3=>register3,
        register4=>register4,
        register5=>register5,
        register6=>register6,
        register7=>register7
        );

process begin 
Clk<=not(Clk);
WAIT FOR 2ns;
end process;

process 
begin
    
    Reset <= '1';
    wait for 100ns;
    Reset <= '0';
    Register_enable <= "001";
    Register_input <= "0101";
    
    
    wait for 100ns;
    
    Register_enable <= "001";
    Register_input <= "0100";
    wait for 100ns;
    
    Register_enable <= "010";
    Register_input <= "0100";
    wait for 100ns;
     
    
    
    
    
end process;
end Behavioral;
