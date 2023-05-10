LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dec_mul IS
    GENERIC (
        DATA_SIZE : NATURAL := 4
    );
    PORT (
        clk : IN STD_LOGIC;
        received_signal : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        walsh_like_code : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
        product_output : OUT STD_LOGIC_VECTOR(2 * DATA_SIZE - 1 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF dec_mul IS
    SIGNAL product : STD_LOGIC_VECTOR(2 * DATA_SIZE - 1 DOWNTO 0);
    SIGNAL rs : STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
    SIGNAL wlc : STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);

BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            rs <= received_signal;
            wlc <= walsh_like_code;
            product <= STD_LOGIC_VECTOR(unsigned(rs) * unsigned(wlc));
            product_output <= product;
        END IF;
    END PROCESS;
END ARCHITECTURE;