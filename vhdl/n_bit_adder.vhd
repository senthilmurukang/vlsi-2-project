LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY n_bit_adder IS
    GENERIC (
        INPUT_WIDTH : NATURAL := 4
    );
    PORT (
        input_a : IN STD_LOGIC_VECTOR (INPUT_WIDTH - 1 DOWNTO 0);
        input_b : IN STD_LOGIC_VECTOR (INPUT_WIDTH - 1 DOWNTO 0);
        output_sum : OUT STD_LOGIC_VECTOR (INPUT_WIDTH - 1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behavioral OF n_bit_adder IS
BEGIN
    PROCESS (input_a, input_b)
    BEGIN
        output_sum <= input_a + input_b;
    END PROCESS;
END ARCHITECTURE;