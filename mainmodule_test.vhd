--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:41:00 07/07/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/mainmodule_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY mainmodule_test IS
END mainmodule_test;
 
ARCHITECTURE behavior OF mainmodule_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         instruction : IN  std_logic_vector(31 downto 0);
			--instruction_address: in std_logic_vector(31 downto 0);
         out1 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
  -- signal instruction_address:  std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal out1 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clock => clock,
          reset => reset,
          instruction => instruction,
			 --instruction_address => instruction_address,
          out1 => out1
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
      instruction<="00000011111111111111111111111111";
		--instruction_address<=x"11111111";
		
		wait for 100 ns;
		reset <= '1';
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
