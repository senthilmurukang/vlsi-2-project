LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY serial_to_std_logic_vector IS
    PORT (
        SIGNAL clk : IN STD_LOGIC;
        SIGNAL input : IN STD_LOGIC;
        SIGNAL output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0')
    );
END ENTITY;

ARCHITECTURE behaviour OF serial_to_std_logic_vector IS
BEGIN
    PROCESS (clk)
        VARIABLE count : INTEGER := 0;
        VARIABLE int_output : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        IF rising_edge(clk) THEN
            int_output(count) := input;
            IF count = (output'length - 1) THEN
                count := 0;
                output <= int_output;
            ELSE
                count := count + 1;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;