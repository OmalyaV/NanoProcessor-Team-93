----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2023 11:27:23 PM
-- Design Name: 
-- Module Name: RCA - Behavioral
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

entity RCA_Adder_Subtractor is
    port (  A,B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(3 downto 0);
            subtract: in std_logic;
            C_out, overflow: out std_logic);
    end RCA_Adder_Subtractor;
    
architecture Behavioral of  RCA_Adder_Subtractor is

component FA
    port ( C_in, A, B: in std_logic;
        S, C_out: out std_logic);
end component;

signal C: std_logic_vector(4 downto 0);
signal B_temp: std_logic_vector(3 downto 0);

begin
        
C(0) <= subtract;
C_out <= C(4);
overflow <= C(4) xor C(3);

B_temp(0) <= B(0) xor subtract;
B_temp(1) <= B(1) xor subtract;
B_temp(2) <= B(2) xor subtract;
B_temp(3) <= B(3) xor subtract;

FA_0: FA port map(
        C_in=>C(0),
        A=>A(0),
        B=>B_temp(0),
        S=>S(0),
        C_out=>C(1));
        
FA_1: FA port map(
        C_in=>C(1),
        A=>A(1),
        B=>B_temp(1),
        S=>S(1),
        C_out=>C(2));
        
FA_2: FA port map(
        C_in=>C(2),
        A=>A(2),
        B=>B_temp(2),
        S=>S(2),
        C_out=>C(3));
        
FA_3: FA port map(
        C_in=>C(3),
        A=>A(3),
        B=>B_temp(3),
        S=>S(3),
        C_out=>C(4));
 
        
end Behavioral;
