LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY std_logic_vector_to_serial IS
    PORT (
        SIGNAL clk : IN STD_LOGIC;
        SIGNAL input : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "10111011101110111011101110111011";
        SIGNAL output : OUT STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE behaviour OF std_logic_vector_to_serial IS
    SIGNAL bit_count : INTEGER := 0;
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL rising_edge(clk);
        IF bit_count = 31 THEN
            output <= input(0);
            bit_count <= 0;
        ELSE
            output <= input(bit_count + 1);
            bit_count <= bit_count + 1;
        END IF;
    END PROCESS;
END ARCHITECTURE;