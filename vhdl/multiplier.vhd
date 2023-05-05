LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY multiplier IS
    GENERIC (
        DATA_SIZE : NATURAL := 8
    );
    PORT (
        medium_speed_clk : IN STD_LOGIC;
        recieved_signal : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        walsh_like_code : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        product_output : OUT STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0) := (OTHERS => '0')
    );
END ENTITY;

ARCHITECTURE behaviour OF multiplier IS

BEGIN
    PROCESS (medium_speed_clk, recieved_signal, walsh_like_code)
        VARIABLE pv, bp : STD_LOGIC_VECTOR(2 * DATA_SIZE - 1 DOWNTO 0) := (OTHERS => '0');
        --CONSTANT DATA_SIZE : NATURAL := 4;
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            pv := "0000000000000000";
            bp := "00000000" & walsh_like_code;
            FOR i IN 0 TO DATA_SIZE - 1 LOOP
                IF recieved_signal(i) = '1' THEN
                    pv := pv + bp;
                END IF;
                bp := bp(2 * DATA_SIZE - 2 DOWNTO 0) & '0';
            END LOOP;
            product_output <= pv(DATA_SIZE - 1 DOWNTO 0);
        END IF;
    END PROCESS;

END ARCHITECTURE;