library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display is
    Port ( suma : in  STD_LOGIC_VECTOR (4 downto 0);
          hexa : out  STD_LOGIC_VECTOR (13 downto 0)
             );
end display;

architecture conversor_arch of display is

begin

process (suma)
BEGIN
    case suma is
        when "00000"=> hexa <="11111111000000";  -- '0'
        when "00001"=> hexa <="11111111111001";  -- '1'
        when "00010"=> hexa <="11111110100100";  -- '2'
        when "00011"=> hexa <="11111110110000";  -- '3'
        when "00100"=> hexa <="11111110011001";  -- '4' 
        when "00101"=> hexa <="11111110010010";  -- '5'
        when "00110"=> hexa <="11111110000010";  -- '6'
        when "00111"=> hexa <="11111111111000";  -- '7'
        when "01000"=> hexa <="11111110000000";  -- '8'
        when "01001"=> hexa <="11111110010000";  -- '9'
        when "01010"=> hexa <="11111110001000";  -- 'A'
        when "01011"=> hexa <="11111110000011";  -- 'b'
        when "01100"=> hexa <="11111111000110";  -- 'C'
        when "01101"=> hexa <="11111110100001";  -- 'd'
        when "01110"=> hexa <="11111110000110";  -- 'E'
        when "01111"=> hexa <="11111110001110";  -- 'F'
		  
		  when "10000"=> hexa <="11110011000000";  -- '10'
        when "10001"=> hexa <="11110011111001";  -- '11'
        when "10010"=> hexa <="11110010100100";  -- '12'
        when "10011"=> hexa <="11110010110000";  -- '13'
        when "10100"=> hexa <="11110010011001";  -- '14' 
        when "10101"=> hexa <="11110010010010";  -- '15'
        when "10110"=> hexa <="11110010000010";  -- '16'
        when "10111"=> hexa <="11110011111000";  -- '17'
        when "11000"=> hexa <="11110010000000";  -- '18'
        when "11001"=> hexa <="11110010010000";  -- '19'
        when "11010"=> hexa <="11110010001000";  -- '1A'
        when "11011"=> hexa <="11110010000011";  -- '1b'
        when "11100"=> hexa <="11110011000110";  -- '1C'
        when "11101"=> hexa <="11110010100001";  -- '1d'
        when "11110"=> hexa <="11110010000110";  -- '1E'
        when "11111"=> hexa <="11110010001110";  -- '1F'
        when others =>  NULL;
    end case;
end process;

end conversor_arch;