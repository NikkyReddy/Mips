----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:07:41 07/06/2017 
-- Design Name: 
-- Module Name:    multiplexer2 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer2 is
port (
		x,y: in std_logic_vector(31 downto 0);
		s: in std_logic;
		z: out std_logic_vector(31 downto 0)
	);
end multiplexer2;

architecture Behavioral of multiplexer2 is

begin
z <= x when (s='0') else y;

end Behavioral;

