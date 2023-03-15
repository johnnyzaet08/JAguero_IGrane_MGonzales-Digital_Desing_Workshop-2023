-- ENGR 10 VHDL Lab
-- 1-bit Adder Testbench

-- A testbench is used to rigorously tests a design that you have made.
-- The output of the testbench should allow the designer to see if
-- the design worked.  The testbench should also report where the testbench
-- failed.

-- This is just to make a reference to some common things needed.
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Decare a testbench.  Notice that the testbench does not have any
-- input or output ports.
entity TEST_ADD is
end TEST_ADD;

-- Describes the functionality of the tesbench.
architecture TEST of TEST_ADD is 

	-- The object that we wish to test is declared as a component of 
	-- the test bench. Its functionality has already been described elsewhere.
	-- This simply describes what the object's inputs and outputs are, it
	-- does not actually create the object.
	component BIT_ADDER 
		port( a, b, cin         : in  STD_LOGIC;
	      	sum, cout         : out STD_LOGIC );
	end component;

	-- Specifies which description of the adder you will use.
	for U1: BIT_ADDER use entity WORK.BIT_ADDER(BHV);

	-- Create a set of signals which will be associated with both the inputs
	-- and outputs of the component that we wish to test.
	signal A_s, B_s	: STD_LOGIC;
	signal CIN_s	: STD_LOGIC;
	signal SUM_s	: STD_LOGIC;
	signal COUT_s	: STD_LOGIC;

	-- This is where the testbench for the BIT_ADDER actually begins.	
	begin
	
	-- Create a 1-bit adder in the testbench. 	
	-- The signals specified above are mapped to their appropriate
	-- roles in the 1-bit adder which we have created.
	U1: BIT_ADDER port map (A_s, B_s, CIN_s, SUM_s, COUT_s);
	
	-- The process is where the actual testing is done.
	process
	begin

		-- We are now going to set the inputs of the adder and test
		-- the outputs to verify the functionality of our 1-bit adder.

		-- Case 0 : 0+0 with carry in of 0.

		-- Set the signals for the inputs.
		A_s <= '0';
		B_s <= '0';
		CIN_s <= '0';
		
		-- Wait a short amount of time and then check to see if the 
		-- outputs are what they should be. If not, then report an error
		-- so that we will know there is a problem.
		wait for 10 ns; -- #10
		assert ( SUM_s = '0'  ) report "Failed Case 0 - SUM" severity error;
		assert ( COUT_s = '0' ) report "Failed Case 0 - COUT" severity error;
		wait for 40 ns;

		-- Carry out the same process outlined above for the other 7 cases.

		-- Case 1 : 0+0 with carry in of 1.
		A_s <= '0';
		B_s <= '0';
		CIN_s <= '1';
		wait for 10 ns;
		assert ( SUM_s = '1'  ) report "Failed Case 1 - SUM" severity error;
		assert ( COUT_s = '0' ) report "Failed Case 1 - COUT" severity error;
		wait for 40 ns;

		-- Case 2 : 0+1 with carry in of 0.
		A_s <= '0';
		B_s <= '1';
		CIN_s <= '0';
		wait for 10 ns;
		assert ( SUM_s = '1'  ) report "Failed Case 2 - SUM" severity error;
		assert ( COUT_s = '0' ) report "Failed Case 2 - COUT" severity error;
		wait for 40 ns;

		-- Case 3 : 0+1 with carry in of 1.
		A_s <= '0';
		B_s <= '1';
		CIN_s <= '1';
		wait for 10 ns;
		assert ( SUM_s = '0'  ) report "Failed Case 3 - SUM" severity error;
		assert ( COUT_s = '1' ) report "Failed Case 3 - COUT" severity error;
		wait for 40 ns;

		-- Case 4 : 1+0 with carry in of 0.
		A_s <= '1';
		B_s <= '0';
		CIN_s <= '0';
		wait for 10 ns;
		assert ( SUM_s = '1'  ) report "Failed Case 4 - SUM" severity error;
		assert ( COUT_s = '0' ) report "Failed Case 4 - COUT" severity error;
		wait for 40 ns;

		-- Case 5 : 1+0 with carry in of 1.
		A_s <= '1';
		B_s <= '0';
		CIN_s <= '1';
		wait for 10 ns;
		assert ( SUM_s = '0'  ) report "Failed Case 5 - SUM" severity error;
		assert ( COUT_s = '1' ) report "Failed Case 5 - COUT" severity error;
		wait for 40 ns;

		-- Case 6 : 1+1 with carry in of 0.
		A_s <= '1';
		B_s <= '1';
		CIN_s <= '0';
		wait for 10 ns;
		assert ( SUM_s = '0'  ) report "Failed Case 6 - SUM" severity error;
		assert ( COUT_s = '1' ) report "Failed Case 6 - COUT" severity error;
		wait for 40 ns;

		-- Case 7 : 1+1 with carry in of 1.
		A_s <= '1';
		B_s <= '1';
		CIN_s <= '1';
		wait for 10 ns;
		assert ( SUM_s = '1'  ) report "Failed Case 7 - SUM" severity error;
		assert ( COUT_s = '1' ) report "Failed Case 7 - COUT" severity error;
		wait for 40 ns;

	end process;
END TEST;

 