library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binaryDecoder2x4 is
	port(
	    input: in std_logic_vector(1 downto 0);
	    output: out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch1 of binaryDecoder2x4 is


begin

fff: for i in output'range generate
    output(i) <= '1' when i = unsigned(input) else '0';
    end generate;
 
end architecture;