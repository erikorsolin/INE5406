-- COMPLETE COM O NOME COMPLETO DOS ALUNOS QUE FAZEM ESTA AVALIACAO
-- Aluno 1: Erik Orsolin de Paula
-- Aluno 2: Lucas Moacir Peres

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifterRotator is
    generic(
        width: positive;
        isShifter: boolean; -- true para operação de deslocamento, false para operação de rotação
        isLogical: boolean;  -- true para deslocamento lógico, false para deslocamento aritmético
        toLeft: boolean;  -- true para deslocar/rotacionar para a esquerda, false para direita
        bitsToShift: positive -- quantidade de bits a serem deslocados/rotacionados
    );
    port(
        input: in std_logic_vector(width-1 downto 0);
        output: out std_logic_vector(width-1 downto 0)
    );
    begin
        assert (bitsToShift < width) severity error;
end entity;

architecture behav of shifterRotator is

begin


 genShift: if isShifter generate  -- deslocador
    genLogic: if isLogical generate  -- deslocamento lógico
        output <= std_logic_vector(shift_left(unsigned(input), bitstoshift)) when toLeft else  -- para esquerda
                  std_logic_vector(shift_right(unsigned(input), bitstoshift));  -- para direita
    end generate genLogic;
    
    genArith: if not isLogical generate -- Deslocamento Aritmético
        output <= std_logic_vector(shift_left(signed(input), bitstoshift)) when toLeft else  -- para esquerda
                  std_logic_vector(shift_right(signed(input), bitstoshift));  -- para direita
                   
    end generate genArith;
 end generate genShift;
 

 genRotate: if not isShifter generate -- Rotacionador
        genRotateLeft: if toLeft generate -- Rotação para a esquerda
            output <= std_logic_vector(rotate_left(unsigned(input), bitstoshift));
        end generate genRotateLeft;
        genRotateRight: if not toLeft generate -- Rotação para a direita
            output <= std_logic_vector(rotate_right(unsigned(input), bitstoshift));
        end generate genRotateRight;
    end generate genRotate;
    
end architecture;