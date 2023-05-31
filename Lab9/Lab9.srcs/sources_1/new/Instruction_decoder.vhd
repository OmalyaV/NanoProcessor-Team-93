----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:00:43 AM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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

entity Instruction_decoder is
    Port ( Instruction_decoder_in : in STD_LOGIC_VECTOR (11 downto 0);
           register_check_for_jump: in STD_LOGIC_VECTOR(3 downto 0);
           add_or_sub_select: out STD_LOGIC := '0';
           register_enable: out STD_LOGIC_VECTOR(2 downto 0):= "000";
           register_select : out STD_LOGIC_VECTOR(5 downto 0):= "00000";
           immidiate_value: out STD_LOGIC_VECTOR(3 downto 0):= "0000";
           load_select: out STD_LOGIC :='0';
           jump_flag: out STD_LOGIC := '0';
           address_to_jump:out STD_LOGIC_VECTOR(2 downto 0):= "000"
           
           
           );
    
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is

begin

process(Instruction_decoder_in(11 downto 10))
begin
if (Instruction_decoder_in(11 downto 10)= "00") then
    add_or_sub_select <= '1';
    register_select(5 downto 3)<= Instruction_decoder_in(9 downto 7);
    register_select(2 downto 0)<= Instruction_decoder_in(6 downto 4);
elsif (Instruction_decoder_in(11 downto 10)= "10") then
    immidiate_value<= Instruction_decoder_in(3 downto 0);
    register_enable <= Instruction_decoder_in(9 downto 7);
elsif(Instruction_decoder_in(11 downto 10)= "11") then
    register_enable <= Instruction_decoder_in(9 downto 7);
    
    
end if;
end process;
    

end Behavioral;
