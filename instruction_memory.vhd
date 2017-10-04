----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:21 06/19/2017 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
	port (   clock : in std_logic;
				reset : in std_logic;
				memdata : in std_logic_vector(31 downto 0);
				--irwrite : in std_logic;
--				instruction_31_26 : out std_logic_vector(5 downto 0);
--				instruction_25_21 : out std_logic_vector(4 downto 0);
--				instruction_20_16 : out std_logic_vector(4 downto 0);
--				instruction_15_00: out std_logic_vector(15 downto 0);
--            
			 last_instr_address: out std_logic_vector(31 downto 0));				
	
end instruction_memory;

	architecture behavioral of instruction_memory is
	--variable last_instr_address: std_logic_vector(31 downto 0);
  
	
	begin
	proc_instreg : process(clock, reset)
	-- last_instr_address <= instruction_31_26 & instruction_25_21 & instruction_20_16  & instruction_15_00 ;
	begin
	if reset = '0' then
	last_instr_address(31 downto 26)<= (others => '0');
	last_instr_address(25 downto 21)<= (others => '0');
	last_instr_address(20 downto 16)<= (others => '0');
	last_instr_address(15 downto 0)<= (others => '0');
	elsif rising_edge(clock) then
	-- write the output of the memory into the instruction register
	--if(irwrite = '1') then
	last_instr_address(31 downto 26) <= memdata(31 downto 26);
	last_instr_address(25 downto 21) <= memdata(25 downto 21);
	last_instr_address(20 downto 16) <= memdata(20 downto 16);
	last_instr_address(15 downto 0)<= memdata(15 downto 0);
	end if;
	--end if;
	end process;
	end behavioral;





--entity instruction_memory is
--port (clk,reset,pc_wrt:in STD_LOGIC;
--		memdata:in STD_LOGIC_VECTOR(31 downto 0);
--		instruction:out STD_LOGIC_VECTOR(31 downto 0));
--end instruction_memory;
--
--architecture Behavioral of instruction_memory is
--signal sel_addr:integer;
--type im_array is array (0 to 3) of STD_LOGIC_VECTOR (31 downto 0);
--signal im: im_array;
--
--begin
--im(0)<="0000"&"0000"&"0100"&"1010"&"0001"&"0100"&"0001"&"1110";
--im(1)<="0001"&"0100"&"0001"&"1110"&"0001"&"0100"&"0001"&"1110";
--im(2)<="0010"&"0000"&"0100"&"1010" &"0001"&"0100"&"0001"&"1110";
--im(3)<=(others=>'0');
--sel_addr<=conv_integer(memdata);
--process(clk,reset)
--begin
--
--if reset='1' then 
--instruction<=(others=>'H');
--
--elsif (clk='1' and clk' event) then
--if pc_wrt='1' then
--
--case sel_addr is
--when 0=>instruction<=im(0);
--when 16=>instruction<=im(1);
--when 32=>instruction<=im(2);
--when others=>instruction<=(others=>'0');
--end case;
--
--end if;
--end if;
--
--end process;
--
--end Behavioral;
--
