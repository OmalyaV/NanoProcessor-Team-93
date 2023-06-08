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
 Port ( 
    clock :in STD_LOGIC;
    reset: in STD_LOGIC;
    overflow: OUT std_logic;
    Zero : out std_logic;
    reg_7_out:out std_logic_vector(3 downto 0);
    reg_7_seven_seg :out std_logic_vector(6 downto 0);
    anode: out STD_LOGIC_VECTOR(3 downto 0)
 );

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
component ROM
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);   
           ins : out STD_LOGIC_VECTOR (11 downto 0));
end component;
component Register_Bank
Port ( Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Register_enable : in STD_LOGIC_VECTOR(2 downto 0);
          Register_input : in STD_LOGIC_VECTOR (3 downto 0);
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

component MUX_2_way_3_bit
Port ( MUX_2_way_3_bit_DATA : in STD_LOGIC_VECTOR (5 downto 0);
           MUX_2_way_3_bit_controls:in STD_LOGIC;
           MUX_2_way_3_bit_EN : in STD_LOGIC;
           MUX_2_way_3_bit_OUT : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_8_way_4_bit
Port (  S : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIc;
            MUX_data_bit : in STD_LOGIC_VECTOR (31 downto 0);
            MUX_output : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component MUX_2_way_4_bit
 Port ( MUX_2_way_4_bit_DATA : in STD_LOGIC_VECTOR (7 downto 0);
          MUX_2_way_4_bit_controls : in STD_LOGIC;
          MUX_2_way_4_bit_EN : in STD_LOGIC;
          MUX_2_way_4_bit_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Program_Counter
Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
           
end component;
component Slow_Clk

Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component LUT_16_7 
Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Register_enable_signal : STD_LOGIC_VECTOR(2 downto 0);--instruction decoder , register bank
signal Data_bus_0, Data_bus_1, Data_bus_2,Data_bus_3,Data_bus_4,Data_bus_5,Data_bus_6,Data_bus_7:STD_LOGIC_VECTOR(3 downto 0); --register_bank, muxes
signal Register_select_A, Register_select_B :STD_LOGIC_VECTOR(2 downto 0); --instruction decoder, mux
signal Register_A_out, Register_B_out: STD_LOGIC_VECTOR(3 downto 0);--muxes, adder_subtractor
signal Adder_out: STD_LOGIC_VECTOR(3 downto 0);--adder_subtractor, 2 way4 bit mux
signal Load_select : STD_LOGIC; -- ins_decoder, 2 way 4 bit mux
signal Immidiate_value :STD_LOGIC_VECTOR(3 downto 0); --ins_decoder, 2way 4 bit mux
signal Add_sub_select:STD_LOGIC; --adder_subtracor, ins decoder
signal Jump_flag_signal: STD_LOGIC; -- ins_decoder, 2 way 3 bit mux
signal Address_to_jump: STD_LOGIC_VECTOR(2 downto 0); -- ins_decoder, 2 way_3bit mux
signal Memory_select: STD_LOGIC_VECTOR(2 downto 0);--ROM, PC , 3 bitadder
signal MUX_2_way_3_bit_OUT : STD_LOGIC_VECTOR(2 downto 0);-- 2 way 3 bit mux, pc
signal Adder_3_bit_out: STD_LOGIC_VECTOR(2 downto 0); -- 3 bit adder, 2 way 3 bit mux
signal Clock_out :STD_LOGIC;
signal Instructions: STD_LOGIC_VECTOR(11 downto 0); -- ROM, ins decoder
signal MUX_output_register_Bank :STD_LOGIC_VECTOR( 3 downto 0); -- Register bank, 2 way 4 bit mux

begin
Slow_clk_0: Slow_Clk Port map(
    Clk_in => clock,
    Clk_out => Clock_out
);
Instruction_decoder_0: Instruction_decoder Port map(
    Instruction_decoder_in => Instructions,
    register_check_for_jump =>Register_A_out,
    add_or_sub_select => Add_sub_select,
    register_enable => Register_enable_signal,
    register_select(5 downto 3) =>Register_select_A,
    register_select(2 downto 0) => Register_select_B,
    immidiate_value => Immidiate_value,
    load_select => Load_select,
    jump_flag => Jump_flag_signal,
    address_to_jump => Address_to_jump
    
);
Register_Bank_0 : Register_Bank Port map(
    Clk =>Clock_out,
    Reset => reset,
    Register_enable => Register_enable_signal,
    Register_input => MUX_output_register_Bank,
    register0 => Data_bus_0,
    register1 => Data_bus_1,
    register2 => Data_bus_2,
    register3 => Data_bus_3,
    register4 => Data_bus_4,
    register5 => Data_bus_5,
    register6 => Data_bus_6,
    register7 => Data_bus_7
    
    
);
ROM_0 :ROM Port map(
    address => Memory_select,
    ins =>Instructions
);

RCA_Adder_Subtractor_0 :RCA_Adder_Subtractor port map(
    A=> Register_A_out,
    B=> Register_B_out,
    subtract =>Add_sub_select,
    S => Adder_out,
    Zero => Zero,
    overflow => overflow
);

adder_3bit_0 : adder_3bit port map(
    A=> Memory_select,
    B => "001",
    S => Adder_3_bit_out,
    C_in => '0'
    
);

MUX_2_way_3_bit_0 :MUX_2_way_3_bit port map(
    MUX_2_way_3_bit_DATA(5 downto 3) => Address_to_jump,
    MUX_2_way_3_bit_DATA(2 downto 0) => Adder_3_bit_out,
    MUX_2_way_3_bit_controls => Jump_flag_signal,
    MUX_2_way_3_bit_EN => '1',
    MUX_2_way_3_bit_OUT => MUX_2_way_3_bit_OUT
    
);

MUX_8_way_4_bit_0 :MUX_8_way_4_bit port map(
    S => Register_select_A,
    EN =>'1',
    MUX_data_bit(3 downto 0) =>Data_bus_0,
    MUX_data_bit(7 downto 4) =>Data_bus_1,
    MUX_data_bit(11 downto 8) =>Data_bus_2,
    MUX_data_bit(15 downto 12) =>Data_bus_3,
    MUX_data_bit(19 downto 16) =>Data_bus_4,
    MUX_data_bit(23 downto 20) =>Data_bus_5,
    MUX_data_bit(27 downto 24) =>Data_bus_6,
    MUX_data_bit(31 downto 28) =>Data_bus_7,
    MUX_output => Register_A_out
    
    
);
MUX_8_way_4_bit_1 :MUX_8_way_4_bit port map(
    S => Register_select_B,
    EN =>'1',
    MUX_data_bit(3 downto 0) =>Data_bus_0,
    MUX_data_bit(7 downto 4) =>Data_bus_1,
    MUX_data_bit(11 downto 8) =>Data_bus_2,
    MUX_data_bit(15 downto 12) =>Data_bus_3,
    MUX_data_bit(19 downto 16) =>Data_bus_4,
    MUX_data_bit(23 downto 20) =>Data_bus_5,
    MUX_data_bit(27 downto 24) =>Data_bus_6,
    MUX_data_bit(31 downto 28) =>Data_bus_7,
    MUX_output => Register_B_out
    
    
);

MUX_2_way_4_bit_0 : MUX_2_way_4_bit port map
(
    MUX_2_way_4_bit_DATA(7 downto 4) => Adder_out,
    MUX_2_way_4_bit_DATA(3 downto 0) =>immidiate_value,
    MUX_2_way_4_bit_controls => Load_select,
    MUX_2_way_4_bit_EN => '1',
    MUX_2_way_4_bit_OUT =>MUX_output_register_Bank
);
Program_Counter_0 : Program_Counter port map
(
    Clk => Clock_out,
    Reset =>reset ,
    D  => MUX_2_way_3_bit_OUT ,
    Q  => Memory_select
);
LUT_16_7_0 :LUT_16_7 port map 
(
    address => Data_bus_7,
    data => reg_7_seven_seg
    
);


reg_7_out <= Data_bus_7;
anode <= "1110";
end Behavioral;
