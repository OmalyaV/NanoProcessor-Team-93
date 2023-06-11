----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:24:20 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is
component NanoProcessor

Port ( 
    clock :in STD_LOGIC;
    reset: in STD_LOGIC;
    overflow: OUT std_logic;
    Zero : out std_logic;
    reg_7_out:out std_logic_vector(3 downto 0);
    reg_7_seven_seg :out std_logic_vector(6 downto 0);
    anode: out STD_LOGIC_VECTOR(3 downto 0)
    
    
    --register_0: out STD_LOGIC_VECTOR(3 downto 0);
    --register_1: out STD_LOGIC_VECTOR(3 downto 0);
    --register_2: out STD_LOGIC_VECTOR(3 downto 0);
    --register_3: out STD_LOGIC_VECTOR(3 downto 0);
    --register_4: out STD_LOGIC_VECTOR(3 downto 0);
    --register_5: out STD_LOGIC_VECTOR(3 downto 0);
    --register_6: out STD_LOGIC_VECTOR(3 downto 0);
    --register_7: out STD_LOGIC_VECTOR(3 downto 0);
    --current_ins : out STD_LOGIC_VECTOR(11 downto 0);
    --adder_3_bit_out_sim : out STD_LOGIC_VECTOR(2 downto 0);
    --memory_select_out_sim: out STD_LOGIC_VECTOR(2 downto 0);
    --test_out :out STD_LOGIC_VECTOR(2 downto 0)
 );
end component;

signal clock :STD_LOGIC:= '0';
signal reset, overflow, Zero: STD_LOGIC:='0';
signal reg_7_out, anode:std_logic_vector(3 downto 0);
signal reg_7_seven_seg :std_logic_vector(6 downto 0);

--signal register_0,register_1,register_2,register_3,register_4,register_5,register_6,register_7:std_logic_vector(3 downto 0);
--signal current_ins: STD_LOGIC_VECTOR(11 downto 0);
--signal adder_3_bit_out_sim,memory_select_out_sim, test_out: STD_LOGIC_VECTOR(2 downto 0);
begin
UUT: NanoProcessor port map
(
    clock => clock,
    reset => reset,
    overflow => overflow,
    Zero => Zero,
    reg_7_out => reg_7_out,
    reg_7_seven_seg => reg_7_seven_seg,
    anode => anode
    
    --register_0 =>register_0,
    --register_1 =>register_1,
    --register_2 =>register_2,
    --register_3 =>register_3,
    --register_4 =>register_4,
    --register_5 =>register_5,
    --register_6 =>register_6,
    --register_7 =>register_7,
    --current_ins=> current_ins,
    --adder_3_bit_out_sim =>adder_3_bit_out_sim,
    --memory_select_out_sim =>memory_select_out_sim,
    --test_out => test_out
      )
;

process begin 
clock<=not(clock);
WAIT FOR 2ns;
end process;


--reset <= '1';
--wait for 8ns;
--reset<='0';




end Behavioral;
