----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    14:49:00 06/07/2017 
-- design name: 
-- module name:    mux1 - behavioral 
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

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity mux1 is 
	generic (n: natural:= 5); -- number of bits in the choices
	port (
		x,y: in std_logic_vector(n-1 downto 0);
		s: in std_logic;
		z: out std_logic_vector(n-1 downto 0)
	);
end mux1;

architecture behavioral of mux1 is
	begin
	z <= x when (s='0') else y;
end behavioral;
