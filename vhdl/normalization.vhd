LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY normalization IS
    GENERIC (
        DATA_SIZE : NATURAL := 4
    );
    PORT (
        SIGNAL clk : IN STD_LOGIC;
        SIGNAL ready : IN STD_LOGIC;
        SIGNAL adder_data : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        SIGNAL normalized_output : OUT STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0) := (OTHERS => '0')

    );
END ENTITY;

ARCHITECTURE behaviour OF normalization IS
BEGIN
    PROCESS (adder_data, clk)
    BEGIN
        IF ready = '1' THEN
            IF rising_edge(clk) THEN
                IF adder_data(DATA_SIZE - 1) = '1' THEN
                    normalized_output <= "11111111";
                ELSE
                    normalized_output <= "00000001";
                END IF;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;