----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:54 06/08/2017 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
USE IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
----use UNISIM.VComponents.all;
--
--
--
entity pc is
	port(
		clock: in std_logic;
		address_to_load: in std_logic_vector(31 downto 0);
		current_address: out std_logic_vector(31 downto 0)
	);
end pc;

architecture beh of pc is

	signal address: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

	begin

	process(clock)
		begin
		current_address <= address;
		if clock='0' and clock'event then
			address <= address_to_load;
		end if;
	end process;

end beh;



--entity pc is
--port (address_to_load:in STD_LOGIC_VECTOR (31 downto 0);
--		clock,pc_wrt,reset:in STD_LOGIC;
--		current_address:out STD_LOGIC_VECTOR (31 downto 0));
--end pc;
--
--architecture Behavioral of pc is
--
--begin
--process(clock,reset)
--begin
--
--if reset='0' then 
--current_address<=(others=>'H');
--
--elsif (clock='1' and clock' event) then
--		if pc_wrt='1' then
--		current_address<=address_to_load;
--
--		else current_address<=(others=>'0');
--end if;
--end if;
--
--
--end Behavioral;
--

