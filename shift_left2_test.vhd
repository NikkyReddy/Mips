--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:16:32 07/06/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/shift_left2_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_left2
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
 
ENTITY shift_left2_test IS
END shift_left2_test;
 
ARCHITECTURE behavior OF shift_left2_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_left2
    PORT(
         x : IN  std_logic_vector(31 downto 0);
         y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal y : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   --constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_left2 PORT MAP (
          x => x,
          y => y
        );

   -- Clock process definitions
--   clock_process :process
--   begin
--		clock <= '0';
--		wait for clock_period/2;
--		clock <= '1';
--		wait for clock_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for clock_period*10;
		x <= x"ffff8734";
      -- insert stimulus here 

      wait;
   end process;

END;
