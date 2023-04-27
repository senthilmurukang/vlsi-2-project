LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY n_bit_adder IS
    GENERIC (
        INPUT_WIDTH : NATURAL := 4
    );
    PORT (
        high_speed_clk : IN STD_LOGIC;
        medium_speed_clk : IN STD_LOGIC;
        input_a : IN STD_LOGIC;
        input_b : IN STD_LOGIC;
        output_sum : OUT STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE behavioral OF n_bit_adder IS
    SIGNAL input_vector_a : STD_LOGIC_VECTOR (INPUT_WIDTH - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL input_vector_b : STD_LOGIC_VECTOR (INPUT_WIDTH - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL output_vector : STD_LOGIC_VECTOR (INPUT_WIDTH - 1 DOWNTO 0) := (OTHERS => '0');
BEGIN
    sampling_input : PROCESS (high_speed_clk) IS
        VARIABLE input_counter : NATURAL RANGE 0 TO INPUT_WIDTH + 1 := 0;
    BEGIN
        IF rising_edge(high_speed_clk) THEN
            input_vector_a(input_counter) <= input_a;
            input_vector_b(input_counter) <= input_b;
            input_counter := input_counter + 1;
            IF input_counter > (INPUT_WIDTH - 1) THEN
                input_counter := 0;
            END IF;
        END IF;
    END PROCESS;

    vector_input_addition : PROCESS (medium_speed_clk)
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            output_vector <= input_vector_a + input_vector_b;
        END IF;
    END PROCESS;

    output_generation : PROCESS (high_speed_clk) IS
        VARIABLE output_counter : NATURAL RANGE 0 TO INPUT_WIDTH + 1 := 0;
    BEGIN
        IF rising_edge(high_speed_clk) THEN
            output_sum <= output_vector(output_counter);
            output_counter := output_counter + 1;
            IF output_counter > (INPUT_WIDTH - 1) THEN
                output_counter := 0;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;