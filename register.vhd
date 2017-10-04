----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    14:57:01 06/07/2017 
-- design name: 
-- module name:    register - behavioral 
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
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--
---- uncomment the following library declaration if using
---- arithmetic functions with signed or unsigned values
----use ieee.numeric_std.all;
--
---- uncomment the following library declaration if instantiating
---- any xilinx primitives in this code.
----library unisim;
----use unisim.vcomponents.all;
--
entity instruction_register is
    port   ( clock: in std_logic;	
	          reset: in std_logic;
	          reg_write: in std_logic;
				 read_reg1,read_reg2,write_reg :  in std_logic_vector (4 downto 0);
             write_data : in  std_logic_vector (31 downto 0);
             read_data1,read_data2 : out  std_logic_vector (31 downto 0));
end instruction_register;

architecture behavioral of instruction_register is
-- signal read_reg1,read_reg2,write_reg :   std_logic_vector (4 downto 0);
            
type mem_array is array(31 downto 0) of  std_logic_vector (31 downto 0); -- reg array type
signal reg_mem : mem_array := (others => (others =>'0')); -- reg file contents
begin

-- perform write operation
process(clock,reset)
begin
if reset = '0' then
	for i in 0 to 31 loop
	reg_mem(i) <= (others => '0');
	end loop;


elsif (clock='1' and clock' event) then
if reg_write='1' then reg_mem(to_integer(unsigned(write_reg)))<=write_data;
end if;
end if;

read_data1<=reg_mem(to_integer(unsigned(read_reg1)));
read_data2<=reg_mem(to_integer(unsigned(read_reg2)));
--end if;
end process;
end behavioral;




















--entity ins_register is
--
--port (clock,reset,reg_write:in STD_LOGIC;
--		instruction:in STD_LOGIC_VECTOR(31 downto 0);
--		opcode,funct:out STD_LOGIC_VECTOR(5 downto 0);
--		rs, rt, rd, shampt: out std_logic_vector(4 downto 0);
--		jump_address: out std_logic_vector(25 downto 0);
--	   immediate:out std_logic_vector(15 downto 0));
--end ins_register;
--
--architecture Behavioral of ins_register is
--
--begin
--
--process(clock)
--begin
--if (clock='1' and clock' event) then
--
--if reg_write='1' then
----opcode<=instruct_in(15 downto 12);dest_reg<=instruct_in(11 downto 8);src_reg<=instruct_in(7 downto 4);tgt_reg<=instruct_in(3 downto 0);
--
--   opcode <= instruction(31 downto 26);
--	rs <= instruction(25 downto 21);
--	rt <= instruction(20 downto 16);
--	rd <= instruction(15 downto 11);
--	shampt <= instruction(10 downto 6);
--	funct <= instruction(5 downto 0);
--	immediate <= instruction(15 downto 0);
--	jump_address <= instruction(25 downto 0);
--else opcode<=(others=>'0');rs<=(others=>'0');rt<=(others=>'0');rd<=(others=>'0');shampt<=(others=>'0');funct<=(others=>'0');jump_address<=(others=>'0');immediate<=(others=>'0');
--
--end if;
--end if;
--end process;
--
--end Behavioral;
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--




--process(clock,reset)
--begin
--if reset = '0' then
--read_reg1 <= (others => '0');
--read_reg2 <= (others => '0');
--write_reg <= (others => '0');
--elsif rising_edge(clock) then
--
--read_reg1 <= read_reg1 +1;
--read_reg2 <= read_reg2 +1;
--write_reg <= write_reg +1;
--end if;
--
--end process;
--	




