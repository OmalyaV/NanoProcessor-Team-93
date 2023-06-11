----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 10:39:38 AM
-- Design Name: 
-- Module Name: TB_insruction_decoder - Behavioral
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

entity TB_insruction_decoder is
--  Port ( );
end TB_insruction_decoder;

architecture Behavioral of TB_insruction_decoder is
component Instruction_decoder
Port ( Instruction_decoder_in : in STD_LOGIC_VECTOR (11 downto 0);
           register_check_for_jump: in STD_LOGIC_VECTOR(3 downto 0);
           add_or_sub_select: out STD_LOGIC := '0';
           register_enable: out STD_LOGIC_VECTOR(2 downto 0):= (others => 'Z');
           register_select : out STD_LOGIC_VECTOR(5 downto 0);
           immidiate_value: out STD_LOGIC_VECTOR(3 downto 0);
           load_select: out STD_LOGIC :='0';
           jump_flag: out STD_LOGIC := '0';
           address_to_jump:out STD_LOGIC_VECTOR(2 downto 0)
           
           
           );
end component;
signal ins_in: STD_LOGIC_VECTOR(11 downto 0);
signal reg_check_for_jump, immidiate_value :STD_LOGIC_VECTOR(3 downto 0);
signal reg_sel_A, reg_sel_B: STD_LOGIC_VECTOR(2 downto 0);
signal reg_enable,address_to_jump :STD_LOGIC_VECTOR(2 downto 0);
signal add_sub_select, load_select, jump_flag:STD_LOGIC;

begin
UUT : Instruction_decoder
PORT MAP(
Instruction_decoder_in => ins_in,
register_check_for_jump =>reg_check_for_jump,
add_or_sub_select =>add_sub_select,
register_enable => reg_enable,
register_select(5 downto 3) => reg_sel_A,
register_select(2 downto 0) => reg_sel_B,
immidiate_value => immidiate_value,
load_select => load_select,
jump_flag => jump_flag,
address_to_jump => address_to_jump
);


process 
begin
ins_in <= "001000010000";
reg_check_for_jump <="0110";
wait for 100ns;
reg_check_for_jump <="0000";
wait for 100ns;
ins_in <= "001010100011";
wait for 100ns;
ins_in <= "010100000000";
wait for 100ns;
ins_in <= "101110000011";
wait for 100ns;
ins_in <= "111000000010";
wait for 100ns;
end process;

end Behavioral;
