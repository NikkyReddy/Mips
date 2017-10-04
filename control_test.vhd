--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:44:06 07/05/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/control_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY control_test IS
END control_test;
 
ARCHITECTURE behavior OF control_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         clock : IN  std_logic;
         opcode : IN  std_logic_vector(5 downto 0);
         reg_dest : OUT  std_logic;
         jump : OUT  std_logic;
         branch : OUT  std_logic;
         mem_read : OUT  std_logic;
         mem_to_reg : OUT  std_logic;
         mem_write : OUT  std_logic;
         alu_src : OUT  std_logic;
         reg_write : OUT  std_logic;
         alu_op : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal reg_dest : std_logic;
   signal jump : std_logic;
   signal branch : std_logic;
   signal mem_read : std_logic;
   signal mem_to_reg : std_logic;
   signal mem_write : std_logic;
   signal alu_src : std_logic;
   signal reg_write : std_logic;
   signal alu_op : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          clock => clock,
          opcode => opcode,
          reg_dest => reg_dest,
          jump => jump,
          branch => branch,
          mem_read => mem_read,
          mem_to_reg => mem_to_reg,
          mem_write => mem_write,
          alu_src => alu_src,
          reg_write => reg_write,
          alu_op => alu_op
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;
		
      opcode <= "000000";
		wait for clock_period*10;
		
      opcode <= "001000";
		
		wait for clock_period*10;
		
      opcode <= "100011";
		
		wait for clock_period*10;
		
      opcode <= "101011";
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
