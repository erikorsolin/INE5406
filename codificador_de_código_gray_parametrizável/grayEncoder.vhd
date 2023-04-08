library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity grayEncoder is
	generic(width: natural);
	port(	binInput: in std_logic_vector(width-1 downto 0);
			grayOutput: out std_logic_vector(width-1 downto 0));
end entity;

architecture concurrent_behav0 of grayEncoder is

signal b: std_logic_vector(width-1 downto 0);
begin

 b <= binInput; 
 
 
ff: for i in 0 to width-2  generate  -- implementando a lógica do bit i da saida receber i xor i+1 dos bits da entrada G[i] <= B[i] xor B[i+1] 
        grayOutput(i) <= b(i) xor b(i+1); -- como a entrada e a saída tem o mesmo numero de bits, para a lógica funcionar o loop precisa ir do 0 até o penúltimo bit, assim o penúltimo bit da saida vai receber B[i] xor B[i+1]
    end generate;
    
    grayOutput(width-1) <= b(width-1); -- o último bit da saida recebe um xor entre o ultimo bit da entrada e o próximo bit que é zero, já que um zero a esquerda não altera o valor da entrada

end architecture;