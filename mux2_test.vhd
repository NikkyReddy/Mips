--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:14:25 07/06/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/mux2_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexer2
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
 
ENTITY mux2_test IS
END mux2_test;
 
ARCHITECTURE behavior OF mux2_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexer2
    PORT(
         x : IN  std_logic_vector(31 downto 0);
         y : IN  std_logic_vector(31 downto 0);
         s : IN  std_logic;
         z : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(31 downto 0) := (others => '0');
   signal y : std_logic_vector(31 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer2 PORT MAP (
          x => x,
          y => y,
          s => s,
          z => z
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
--	x <= x"0c8443c1";
--	y <= x"ffff8734";
		s <= '0';
		      wait for 100 ns;
      s <= '1';		
   end process;

END;
