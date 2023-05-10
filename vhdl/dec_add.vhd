LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY dec_add IS
    GENERIC (
        DATA_SIZE : NATURAL := 8;
        countip : NATURAL := 32
    );
    PORT (
        clk : IN STD_LOGIC;
        input_signal : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        addedop : OUT STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0)
    );
END ENTITY;
ARCHITECTURE behaviour OF dec_add IS
BEGIN
    PROCESS (clk)
        VARIABLE output_buffer : unsigned(DATA_SIZE - 1 DOWNTO 0) := (OTHERS => '0');
        VARIABLE count : NATURAL RANGE 0 TO countip := 0;
    BEGIN
        IF rising_edge(clk) THEN
            IF count < countip - 1 THEN
                output_buffer := output_buffer + unsigned(input_signal);
                count := count + 1;
            ELSE
                addedop <= STD_LOGIC_VECTOR(output_buffer);
                count := 0;
                output_buffer := (OTHERS => '0');
            END IF;
        END IF;
    END PROCESS;
END behaviour;