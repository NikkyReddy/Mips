----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:41 06/06/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
--use UNISIM.VComponents.all;

entity alu is
    Port ( a,b : in  STD_LOGIC_VECTOR (31 downto 0);
	        function1 : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_result : out  STD_LOGIC_VECTOR (31 downto 0);
			  zero : out STD_LOGIC);
          
end alu;

architecture Behavioral of alu is
BEGIN

PROCESS(a, b, function1)

-- declaration of variables
VARIABLE a_uns : UNSIGNED(31 DOWNTO 0);
VARIABLE b_uns : UNSIGNED(31 DOWNTO 0);
VARIABLE r_uns : UNSIGNED(31 DOWNTO 0);
VARIABLE z_uns : UNSIGNED(0 DOWNTO 0);

BEGIN

-- initialize values
a_uns := UNSIGNED(a);
b_uns := UNSIGNED(b);
r_uns := (OTHERS => '0');
z_uns(0) := '0';


-- select desired operation
CASE function1 IS
-- add
		WHEN "000000" =>
		r_uns := a_uns + b_uns;
-- sub
		WHEN "000001" =>
		r_uns := a_uns - b_uns;
-- and
		WHEN "000010" =>
		r_uns := a_uns AND b_uns;
-- or
		WHEN "000011" =>
		r_uns := a_uns OR b_uns;
-- others
		WHEN OTHERS => r_uns := (OTHERS => 'X');
END CASE;

-- set zero bit if result equals zero
IF TO_INTEGER(r_uns) = 0 THEN
	z_uns(0) := '1';
	ELSE
	z_uns(0) := '0';
END IF;

-- assign variables to output signals
alu_result <= STD_LOGIC_VECTOR(r_uns);
zero <= z_uns(0);
END PROCESS;

end Behavioral;

