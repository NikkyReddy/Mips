----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:55 06/12/2017 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
			  reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
			  alu_op: out std_logic_vector(1 downto 0));
end control_unit;

architecture Behavioral of control_unit is

begin  

-- The consequences of vhdl syntax 
	--				           R-types				        addi				           lw                          sw                               
	reg_dest <= 	'1' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="100011"  else '0' when opcode="101011"  else '0';
	jump <=			'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="100011"  else '0' when opcode="101011"  else '0';
	branch <=		'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="100011"  else '0' when opcode="101011"  else '0';
	mem_read <=		'0' when opcode="000000"  else '0' when opcode="001000"  else '1' when opcode="100011"  else '0' when opcode="101011"  else '0';
	mem_to_reg <= 	'0' when opcode="000000"  else '0' when opcode="001000"  else '1' when opcode="100011"  else '0' when opcode="101011"  else '0';
	mem_write <= 	'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="100011"  else '1' when opcode="101011"  else '0';
	alu_src <= 		'0' when opcode="000000"  else '1' when opcode="001000"  else '1' when opcode="100011"  else '1' when opcode="101011"  else '0';
	reg_write <= 	'1' when opcode="000000"  else '1' when opcode="001000"  else '1' when opcode="100011"  else '0' when opcode="101011"  else '0';
	alu_op <= 		"10" when opcode="000000" else "00" when opcode="001000" else "01" when opcode="000100" else "00" when opcode="101011"  else "00";                    

