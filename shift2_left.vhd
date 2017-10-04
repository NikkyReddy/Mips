----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:40:36 07/06/2017 
-- Design Name: 
-- Module Name:    shift2_left - Behavioral 
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
use ieee.numeric_std.all;





-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift2_left is
generic (n1: natural:= 26; n2: natural:= 28; k: natural:= 2);
	port (
		x: in std_logic_vector(n1-1 downto 0);
		y: out std_logic_vector(n2-1 downto 0)
	);
end entity;

architecture behavioral of shift2_left is
	signal temp: std_logic_vector(n2-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(x), n2)); -- this is required if you want to increase or decease the number of bits
	y <= std_logic_vector(shift_left(signed(temp), k));
end behavioral;



