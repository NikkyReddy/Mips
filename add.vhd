----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    14:40:08 06/07/2017 
-- design name: 
-- module name:    add - behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use IEEE.numeric_std.all;


-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity add is
    port ( x,y : in  std_logic_vector (31 downto 0);
           z : out  std_logic_vector (31 downto 0));
end add;

architecture behavioral of add is

begin
z <= x + y ;
end behavioral;

