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
           register_enable: out STD_LOGIC_VECTOR(2 downto 0):= (others => 'Z');
           register_select : out STD_LOGIC_VECTOR(5 downto 0):= "00000";
           immidiate_value: out STD_LOGIC_VECTOR(3 downto 0):= "0000";
           load_select: out STD_LOGIC :='0';
           jump_flag: out STD_LOGIC := '0';
           address_to_jump:out STD_LOGIC_VECTOR(2 downto 0):= "000"
           
           
           );
    
end Instruction_decoder;

    architecture Behavioral of Instruction_decoder is
component Decoder_2_to_4
Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;    

signal ins_code :STD_LOGIC_VECTOR(1 downto 0);
signal ins_no: STD_LOGIC_VECTOR(3 downto 0);
signal reg_sel_A,reg_sel_B, reg_sel_A_ins, reg_sel_B_ins: STD_LOGIC_VECTOR(2 downto 0);
signal reg_enable_ins, address_to_jump_ins: STD_LOGIC_VECTOR(2 downto 0);
signal immidiate_value_ins: STD_LOGIC_VECTOR(3 downto 0);



begin


ins_code<= Instruction_decoder_in(11 downto 10);
Decoder_2_4_0: Decoder_2_to_4
port map(
    I => ins_code,
    EN=> '1',
    Y => ins_no
);


reg_sel_A_ins <= Instruction_decoder_in(9 downto 7); --to select the registrer A 
reg_sel_B_ins <= Instruction_decoder_in(6 downto 4); --to select the register B
reg_enable_ins<= Instruction_decoder_in(9 downto 7); --to enable a register in the register bank
immidiate_value_ins <= Instruction_decoder_in(3 downto 0); -- immidiate vallue decoded from the instruction 
address_to_jump_ins <= Instruction_decoder_in(2 downto 0);-- adress to jump when jump instruction is enable

reg_sel_A <=( (others=> ins_no(0))OR (others => ins_no(1))OR (others => ins_no(3))) AND (reg_sel_A_ins);
reg_sel_B <=(others=> ins_no(0)) AND (reg_sel_B_ins);
register_select(5 downto 3) <= reg_sel_A;
register_select(2 downto 0) <= reg_sel_A;
register_enable <= ( (others=> ins_no(0))OR (others => ins_no(1))OR (others => ins_no(2))) AND (reg_enable_ins);
add_or_sub_select <= (ins_no(0) OR ins_no(1));
immidiate_value <= (others => ins_no(2)) AND immidiate_value_ins;
load_select<= ins_no(0) OR ins_no(1);
jump_flag <= ins_no(3) and (NOT register_check_for_jump);


process(ins_code)
begin

if (ins_code= "00") then --ADD
    
    register_select(5 downto 3)<= reg_sel_A_ins;
    register_select(2 downto 0)<= reg_sel_B_ins;
    add_or_sub_select <= '1';
    register_enable <= reg_enable_ins;
    load_select<= '1';
    
elsif(ins_code= "01") then --NEG
    
    register_select(5 downto 3)<= reg_sel_A_ins;
    register_select(2 downto 0)<= (others => '0');
    add_or_sub_select <= '1';
    register_enable <= reg_enable_ins;
    load_select<= '1';
    
elsif (ins_code= "10") then --MOVIN
    immidiate_value<= immidiate_value_ins;
    register_enable <= reg_enable_ins;
    
elsif (ins_code ="11") then --JZR
    register_select(5 downto 3) <= reg_sel_A_ins;
    if(register_check_for_jump ="0000") then
            address_to_jump <= address_to_jump_ins;
            jump_flag <= '1';
    end if;
    
end if;
end process;
    

end Behavioral;
