--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:54 07/04/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/ins_mem_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instruction_memory
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
 
ENTITY ins_mem_test IS
END ins_mem_test;
 
ARCHITECTURE behavior OF ins_mem_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_memory
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         memdata : IN  std_logic_vector(31 downto 0);
         irwrite : IN  std_logic;
         last_instr_address : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal memdata : std_logic_vector(31 downto 0) := (others => '0');
   signal irwrite : std_logic := '0';

 	--Outputs
   signal last_instr_address : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruction_memory PORT MAP (
          clock => clock,
          reset => reset,
          memdata => memdata,
          irwrite => irwrite,
          last_instr_address => last_instr_address
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
		memdata <= "00001100100001000100001111000001";
		
      wait for 100 ns;
      reset <= '1';
      irwrite <= '1';

      wait for 100 ns;
      reset <= '0';
		wait for clock_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
