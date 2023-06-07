----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 07:15:05 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
--  Port ( );
end NanoProcessor;

architecture Behavioral of NanoProcessor is
component Instruction_decoder
 Port ( Instruction_decoder_in : in STD_LOGIC_VECTOR (11 downto 0);
          register_check_for_jump: in STD_LOGIC_VECTOR(3 downto 0);
          add_or_sub_select: out STD_LOGIC := '0';
          register_enable: out STD_LOGIC_VECTOR(2 downto 0):= (others => 'Z');
          register_select : out STD_LOGIC_VECTOR(5 downto 0):= "000000";
          immidiate_value: out STD_LOGIC_VECTOR(3 downto 0):= "0000";
          load_select: out STD_LOGIC :='0';
          jump_flag: out STD_LOGIC := '0';
          address_to_jump:out STD_LOGIC_VECTOR(2 downto 0):= "000"
          
          
          );
end component;

component Register_Bank
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
end component;

component RCA_Adder_Subtractor
 port (  A,B: in std_logic_vector(3 downto 0);
           S: out std_logic_vector(3 downto 0);
           subtract: in std_logic;
           Zero:out std_logic;
           C_out, overflow: out std_logic);
end component;
component adder_3bit
 Port ( A :in STD_LOGIC_VECTOR(2 downto 0);
          B: in STD_LOGIC_VECTOR(2 downto 0);
          S : out STD_LOGIC_VECTOR(2 downto 0);
          C_in : in STD_LOGIC;
          C_out : out STD_LOGIC);
end component;



begin


end Behavioral;
