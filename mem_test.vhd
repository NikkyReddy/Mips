--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:06 07/04/2017
-- Design Name:   
-- Module Name:   H:/ecilpro/mem_test.vhd
-- Project Name:  ecilpro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory
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
 
ENTITY mem_test IS
END mem_test;
 
ARCHITECTURE behavior OF mem_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         memwrite : IN  std_logic;
         memread : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         read_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal memwrite : std_logic := '0';
   signal memread : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
          address => address,
          write_data => write_data,
          memwrite => memwrite,
          memread => memread,
          clock => clock,
          reset => reset,
          read_data => read_data
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
      wait for 10 ns;	
		reset <= '0';
		memwrite <= '1';
	address <= "00001100100001000100001111000001";
	write_data <= "00001100100111000100001111000001";
	wait for 50 ns;	
		reset <= '1';
		memwrite <= '1';
	address <= "00001100100001000100001111000001";
	write_data <= "00001100100111000100001111000001";
	wait for 50 ns;
	memwrite <= '0';
	memread <='1';
	address <= "00001100100001000100001111000001";
	write_data <= "00001100100111000100001111000001";
	
	wait for clock_period*100;
	
		
     --wait for clock_period*10;
 
      -- insert stimulus here 

      wait;
   end process;
	

END;
