LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY multiply IS
    GENERIC (
        DATA_SIZE : NATURAL := 8
    );
    PORT (
        clk : IN STD_LOGIC;
        received_signal : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        wlikecode : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        product_output : OUT STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF multiply IS

BEGIN
    PROCESS (clk)
        VARIABLE product_op : UNSIGNED(2 * DATA_SIZE - 1 DOWNTO 0) := (OTHERS => '0');
        VARIABLE wlc : UNSIGNED(DATA_SIZE - 1 DOWNTO 0);
        VARIABLE index : INTEGER := 0;
    BEGIN
        IF rising_edge(clk) THEN
            wlc := UNSIGNED(wlikecode);
            product_op := (OTHERS => '0');
            index := 0;
            FOR i IN 0 TO DATA_SIZE - 1 LOOP
                IF received_signal(i) = '1' THEN
                    product_op := product_op + (wlc SLL index);
                END IF;
                index := index + 1;
            END LOOP;
            product_output <= STD_LOGIC_VECTOR(product_op(DATA_SIZE - 1 DOWNTO 0));
        END IF;
    END PROCESS;

END ARCHITECTURE;