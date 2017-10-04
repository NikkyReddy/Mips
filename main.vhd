----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    11:06:34 06/19/2017 
-- design name: 
-- module name:    main - behavioral 
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
--use ieee.std_logic_signed.all;

-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;

-- uncomment the following library declaration if instantiating
-- any xilinx primitives in this code.
--library unisim;
--use unisim.vcomponents.all;

entity main is
	port(
		clock: in std_logic;
		reset:in std_logic;
		--instruction:in std_logic_vector(31 downto 0);
		--instruction_address: in std_logic_vector(31 downto 0);
		out1 : out std_logic_vector(31 downto 0)
		);

end main;

architecture behavioral of main is


	signal instruction_address: std_logic_vector(31 downto 0); -- address of the instruction to run
	signal next_address: std_logic_vector(31 downto 0); -- next address to be loaded into pc
	signal instruction,read_data,read_data1, read_data2, write_data, extended_immediate, shifted_immediate, alu_in2, alu_result, incremented_address, add1_result, mux4_result, concatenated_pc_and_jump_address, mem_read_data: std_logic_vector(31 downto 0);
	signal shifted_jump_address: std_logic_vector(27 downto 0);
	signal jump_address: std_logic_vector(25 downto 0);
	signal immediate: std_logic_vector(15 downto 0);
	signal opcode, funct: std_logic_vector(5 downto 0);
	signal rs, rt, rd, shampt, write_reg: std_logic_vector(4 downto 0);
	--signal function1: std_logic_vector(5 downto 0);
	signal reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, alu_zero, branch_and_alu_zero: std_logic; -- vhdl does not allow me to port map " s => (branch and alu_zero) "
	signal alu_op: std_logic_vector(1 downto 0);
   --signal irwrite : std_logic:='0';
	signal alu_control_funct : std_logic_vector(5 downto 0);
	--signal alu_control_funct: std_logic_vector(3 downto 0);
	
   
	 -- enum for checking if the instructions have loaded
	type state is (loading, running, done);
	signal s: state:= loading;

	

component pc
		port ( clock: in std_logic;
		       address_to_load: in std_logic_vector(31 downto 0);
					       current_address: out std_logic_vector(31 downto 0));
			
end component;

component add
		port ( x,y : in  std_logic_vector (31 downto 0);
             z : out  std_logic_vector (31 downto 0));
end component;

component alu
		port ( a,b : in  std_logic_vector (31 downto 0);
	          function1 : in  std_logic_vector (5 downto 0);
             alu_result : out  std_logic_vector (31 downto 0);
			    zero : out std_logic);
end component;

component control
	   port ( clock:in std_logic;
				 opcode: in std_logic_vector(5 downto 0);
				 reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
		       alu_op: out std_logic_vector(1 downto 0));
end component;

	component alu_control
		port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(1 downto 0);
		alu_control_funct: out std_logic_vector(5 downto 0)
	);
end component;

component register_file
		    port   ( clk: in std_logic;	
	          reset: in std_logic;
	          reg_write: in std_logic;
				 read_reg1,read_reg2,write_reg :  in std_logic_vector (4 downto 0);
             write_data : in  std_logic_vector (31 downto 0);
             read_data1,read_data2 : out  std_logic_vector (31 downto 0));

     
end component;

component data_memory
		port ( address, write_data: in std_logic_vector (31 downto 0);
		    memwrite, memread,clk: in std_logic;
			 reset: in std_logic;
			 read_data: out std_logic_vector (31 downto 0));
end component;

component mux1
		generic (n: natural:= 1); -- number of bits in the choices
		port ( x,y: in std_logic_vector(n-1 downto 0);
				 s: in std_logic;
		       z: out std_logic_vector(n-1 downto 0));
end component;

component shift_left2
generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
		port (
			x: in std_logic_vector(n1-1 downto 0);
			y: out std_logic_vector(n2-1 downto 0)
		);end component;
		
		component shift2_left
     generic (n1: natural:= 26; n2: natural:= 28; k: natural:= 2);
		port (
			x: in std_logic_vector(n1-1 downto 0);
			y: out std_logic_vector(n2-1 downto 0)
		);end component;

component sign_extend
     port ( x : in  std_logic_vector (15 downto 0);
            y : out  std_logic_vector (31 downto 0));
end component;


component instruction_memory
	port (   clock : in std_logic;
				reset : in std_logic;
				memdata : in std_logic_vector(31 downto 0);
				--irwrite : in std_logic;
				instruction: out std_logic_vector(31 downto 0));			


end component;

component multiplexer2 
			port (
						x,y: in std_logic_vector(31 downto 0);
						s: in std_logic;
						z: out std_logic_vector(31 downto 0)
	);
	end component;
	
	
	
	component instruction_register is
port (clk,reset,reg_write:in STD_LOGIC;
		instruction:in STD_LOGIC_VECTOR(31 downto 0);
		opcode,funct:out STD_LOGIC_VECTOR(5 downto 0);
		rs, rt, rd, shampt: out std_logic_vector(4 downto 0);
		jump_address: out std_logic_vector(25 downto 0);
	   immediate:out  std_logic_vector(15 downto 0));
end component;

begin

	
	opcode <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	shampt <= instruction(10 downto 6);
	funct <= instruction(5 downto 0);
	immediate <= instruction(15 downto 0);
	jump_address <= instruction(25 downto 0);

	program_counter: pc port map (clock, next_address,instruction_address); 

	im: instruction_register port map (
--	clock => clock,
	reset => reset,
	memdata => instruction_address,
	opcode => instruction(31 downto 26),
	rs => instruction(25 downto 21),
	rt => instruction(20 downto 16),
	rd =>instruction(15 downto 11),
	shampt => instruction(10 downto 6),
	funct => instruction(5 downto 0),
	immediate => instruction(15 downto 0),
	jump_address => instruction(25 downto 0));
	
	
	control1: control port map (
		clock => clock,
		opcode => opcode,
		reg_dest => reg_dest, 
		jump => jump,
		branch => branch, 
		mem_read => mem_read, 
		mem_to_reg => mem_to_reg,
		mem_write => mem_write,
		alu_src => alu_src,
		reg_write => reg_write,
		alu_op => alu_op 
	);



	-- this mux is going into register's write register port; chooses between rt and rd
	mux_1: mux1 generic map(5) port map (
		x => rt, 
		y => rd, 
		s => reg_dest,
		z => write_reg
	);

	reg: register_file port map (
--		clock => clock,
	reg_write => reg_write,
	read_reg1 => rs,
	read_reg2 => rt,
		write_reg => write_reg, 
		write_data => write_data, 
		read_data1 => read_data1, 
		read_data2 => read_data2,
		reset=>reset
	);

   alu_control1: alu_control port map (
	
	funct => funct,
	alu_op =>alu_op,
	alu_control_funct => alu_control_funct
	);

	---- this mux is going into the alu's second input; chooses between read_data_2 and the immediate
	sgn_ext: sign_extend port map (immediate, extended_immediate);

	mux2: multiplexer2 port map (
		x => read_data2, 
		y => extended_immediate, 
		s => alu_src,
		z => alu_in2
	);

	alu1: alu port map (
	a =>read_data1,
	b =>alu_in2,
	function1 => alu_control_funct,
	alu_result => out1 ,
	zero => alu_zero);

	-- this mux is going into the register's write data; chooses between the alu_result and read_data from data memory
	mux3: multiplexer2 port map (
		x => alu_result, 
		y => mem_read_data, 
		s => mem_to_reg,
		z => write_data
	);

	-- the shift left 2 for the immediate
	shift2: shift_left2 port map (
		x => extended_immediate,
		y => shifted_immediate
	);

	-- the +4 adder for the pc
	add2: add port map (
		x => instruction_address,
		y => "00000000000000000000000000000100",
		z => incremented_address
	);

	-- the mux between the +4 adder and the following adder
	branch_and_alu_zero <= branch and alu_zero;
	mux4: multiplexer2 port map (
		x => incremented_address,
		y => add1_result,
		s => branch_and_alu_zero,
		z => mux4_result
	);

	-- the adder between the pc and the sign-extended immediate
	add1: add port map (
		x => incremented_address,
		y => shifted_immediate,
		z => add1_result
	);

	-- the shift left 2 for the jump instruction
	shift1: shift2_left port map (
		x => jump_address,
		y => shifted_jump_address
	);

	-- this mux chooses between the result of mux4 and the jump address
	concatenated_pc_and_jump_address <= incremented_address(31 downto 28) & shifted_jump_address;
	mux5: multiplexer2 port map (
		x => mux4_result,
		y => concatenated_pc_and_jump_address,
		s => jump,
		z => next_address
	);
	
	mem: data_memory port map (
		address => alu_result,
		write_data => read_data2,
		memwrite => mem_write,
		memread => mem_read,
--		clock => clock,
		read_data => mem_read_data,
		reset => reset
	);
	
	
	
process(clock )--,instruction_31_26,instruction_25_21,instruction_20_16,instruction_15_00 )

		begin

		if clock='1' and clock'event then
			case s is
				when loading =>
					s <= running; 
				when running =>
					if(instruction_address > instruction)then
						s <= done; 					
					end if;
				when others =>
					null;
			end case;
		end if;
	end process;
	

end behavioral;

