----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    11:50:31 06/03/2017 
-- design name: 
-- module name:    cpu - behavioral 
-- project name: 
-- target devices: 
-- tool versions: 
-- description: 
--
-- dependencies: 
--
-- revision: 
-- revision 0.01 - file created
-- additional comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity alu_control is
	port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(1 downto 0);
		alu_control_funct: out std_logic_vector(5 downto 0)
	);
end alu_control;

architecture behavioral of alu_control is
	signal and_op: std_logic_vector(5 downto 0):= "000000";
	signal or_op: std_logic_vector(5 downto 0):= "000001";
	signal add: std_logic_vector(5 downto 0):= "000010";
	signal subtract_not_equal: std_logic_vector(5 downto 0):= "000011";
	signal subtract: std_logic_vector(5 downto 0):= "000110";
	signal set_on_less_than: std_logic_vector(5 downto 0):= "000111";

	begin

	alu_control_funct <= add when(alu_op="00" or (alu_op="10" and funct="100000")) else
						subtract when(alu_op="01" or (alu_op="10" and funct="100010")) else
						subtract_not_equal when(alu_op="11") else
						and_op when(alu_op="10" and funct="100100") else
						or_op when(alu_op="10" and funct="100101") else
						set_on_less_than when(alu_op="10" and funct="101010") else
						"000000";
end behavioral;






