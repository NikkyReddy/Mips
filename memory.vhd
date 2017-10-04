----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    15:08:13 06/13/2017 
-- design name: 
-- module name:    memory - behavioral 
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity data_memory is
	port ( address, write_data: in std_logic_vector (31 downto 0);
		    memwrite, memread,clock: in std_logic;
			 reset: in std_logic;
			 read_data: out std_logic_vector (31 downto 0));
end data_memory;

architecture behavioral of data_memory is

type mem_array is array(31 downto 0) of std_logic_vector (31 downto 0);
signal data_mem: mem_array := (others => (others => '0'));

begin
wt:process(clock)
begin

if (clock='1' and clock' event) then
if memwrite='1' then data_mem(to_integer(unsigned(address)))<=write_data;
end if;
end if;
end process;

rd:process(clock)
begin

if (clock='1' and clock' event) then
if memread='1' then read_data<=data_mem(to_integer(unsigned(address)));
end if;
end if;
end process;
end behavioral;






--process(clock,reset)
--begin
--
--if reset = '0' then
--	for i in 0 to 31 loop
--	data_mem(i) <= (others => '0');
--	end loop;
--   elsif rising_edge(clock) then
--	if memwrite = '1' then 
--	data_mem(to_integer(unsigned(address))) <= write_data;
--	end if;
--end if;
--end process;
---- perform reading ports
--read_data <= data_mem(to_integer(unsigned(address))) when memread = '1';
--end behavioral;




