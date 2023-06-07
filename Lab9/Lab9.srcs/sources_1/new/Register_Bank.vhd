----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 01:49:48 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
       Port ( Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
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
          
end Register_Bank;

architecture Behavioral of Register_Bank is

component Registers
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component DECODER_3_TO_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal Y : STD_LOGIC_VECTOR(7 downto 0);
signal MuxSignal:STD_LOGIC_VECTOR(7 downto 0);

begin

    register0<="0000";
    Reg1 : Registers
    port map(
        D => Register_input,
        EN => MuxSignal(1) ,
        Clk => Clk,
        Reset => Reset,
        Q =>register1
    );
    
    Reg2 : Registers
    port map(
        D => Register_input,
        EN => MuxSignal(2) ,
        Clk => Clk,
        Reset => Reset,
        Q => register2 
    );
    
    Reg3 : Registers
    port map(
        D => Register_input,
        EN => MuxSignal(3) ,
        Clk => Clk,
        Reset => Reset,
        Q =>register3 
    );
    
    Reg4 : Registers
    port map(
        D => Register_input,
        EN => MuxSignal(4),
        Clk => Clk,
        Reset => Reset,
        Q => register4
    );
    
    Reg5 :Registers
    port map(
        D => Register_input,
        EN => MuxSignal(5),
        Clk => Clk,
        Reset => Reset,
        Q => register5
    );
    
    Reg6 : Registers
    port map(
        D => Register_input,
        EN => MuxSignal(6),
        Clk => Clk,
        Reset => Reset,
        Q =>register6
    );
    
    Reg7 : Registers
    port map(
        D => Register_input,
        EN => MuxSignal(7),
        Clk => Clk,
        Reset => Reset,
        Q =>register7
    );
    
    Decoder : Decoder_3_to_8
    port map(
        I => MuxInput,
        EN => '1',
        Y => Y
    );
    
    MuxSignal<=Y;
    MuxOutput<=MuxSignal;

end Behavioral;
