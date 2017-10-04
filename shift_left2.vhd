----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    15:04:54 06/13/2017 
-- design name: 
-- module name:    shift_left2 - behavioral 
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
use ieee.numeric_std.all;



-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity shift_left2 is
	generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
	port (
		x: in std_logic_vector(n1-1 downto 0);
		y: out std_logic_vector(n2-1 downto 0)
	);
end entity;

architecture behavioral of shift_left2 is
	signal temp: std_logic_vector(n2-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(x), n2)); -- this is required if you want to increase or decease the number of bits
	y <= std_logic_vector(shift_left(signed(temp), k));
end behavioral;

