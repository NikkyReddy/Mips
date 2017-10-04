----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    14:19:52 06/12/2017 
-- design name: 
-- module name:    sign_extend - behavioral 
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

entity sign_extend is
    port ( x : in  std_logic_vector (15 downto 0);
           y : out  std_logic_vector (31 downto 0));
end sign_extend;

architecture behavioral of sign_extend is

begin
y <= std_logic_vector(resize(signed(x), y'length));
end behavioral;

