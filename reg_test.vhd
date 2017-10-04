--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:58:11 07/04/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/reg_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ins_register
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
 
ENTITY reg_test IS
END reg_test;
 
ARCHITECTURE behavior OF reg_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ins_register
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         read_reg1 : IN  std_logic_vector(4 downto 0);
         read_reg2 : IN  std_logic_vector(4 downto 0);
         write_reg : IN  std_logic_vector(4 downto 0);
         reg_write : IN  std_logic;
         write_data : IN  std_logic_vector(31 downto 0);
         read_data1 : OUT  std_logic_vector(31 downto 0);
         read_data2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal read_reg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_reg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal reg_write : std_logic := '0';
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal read_data1 : std_logic_vector(31 downto 0);
   signal read_data2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ins_register PORT MAP (
          clock => clock,
          reset => reset,
          read_reg1 => read_reg1,
          read_reg2 => read_reg2,
          write_reg => write_reg,
          reg_write => reg_write,
          write_data => write_data,
          read_data1 => read_data1,
          read_data2 => read_data2
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
		reset <= '0';

      wait for clock_period*10;
		reg_write <= '1';
		write_data <= "00001100100001000100001111000001";
		wait for clock_period*10;
		reset <= '1';
		write_reg <="00100";
		read_reg1 <= "00100";
		read_reg2 <= "00100";
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
