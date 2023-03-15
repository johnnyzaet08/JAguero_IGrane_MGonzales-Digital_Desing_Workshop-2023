library IEEE;
use IEEE.std_logic_1164.all;

entity add4_tst is
end entity;

architecture arch of add4_tst is

    component add4 is
        port (
				a : in std_logic_vector (3 downto 0);
            b : in std_logic_vector (3 downto 0);
				ans : out std_logic_vector (4 downto 0);
            cin : in std_logic
        );
    end component;

    signal testFourBitsA, testFourBitsB : std_logic_vector (3 downto 0);
	 signal testFourBitsSum : std_logic_vector (4 downto 0);
    signal testCarryIn : std_logic;

begin

    unit_under_test : add4 port map (
        a => testFourBitsA,
        b => testFourBitsB,
		  
		  ans => testFourBitsSum,

        
        cin => testCarryIn
    );

    generate_signals : process
    begin
        testCarryIn <= '0'; testFourBitsA <= "0000"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0001"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0010"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0011"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0100"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0101"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0110"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "0111"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1000"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1001"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1010"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1011"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1100"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1101"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1110"; testFourBitsB <= "0001"; wait for 10 ns;
        testCarryIn <= '0'; testFourBitsA <= "1111"; testFourBitsB <= "0001"; wait for 10 ns;
        wait;
    end process;

end architecture;