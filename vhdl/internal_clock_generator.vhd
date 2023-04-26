LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY internal_clock_generator IS
    PORT (
        SIGNAL clk : IN STD_LOGIC;
        SIGNAL reset : IN STD_LOGIC;
        SIGNAL high_speed_clk : OUT STD_LOGIC := '0';
        SIGNAL medium_speed_clk : OUT STD_LOGIC := '0';
        SIGNAL low_speed_clk : OUT STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE behaviour OF internal_clock_generator IS
    SIGNAL high_speed_count_reg : STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL high_speed_min_count : STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL high_speed_mid_count : STD_LOGIC_VECTOR (1 DOWNTO 0) := "10";
    SIGNAL high_speed_max_count : STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => '1');

    SIGNAL medium_speed_count_reg : STD_LOGIC_VECTOR (6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL medium_speed_min_count : STD_LOGIC_VECTOR (6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL medium_speed_mid_count : STD_LOGIC_VECTOR (6 DOWNTO 0) := "1000000";
    SIGNAL medium_speed_max_count : STD_LOGIC_VECTOR (6 DOWNTO 0) := (OTHERS => '1');

    SIGNAL low_speed_count_reg : STD_LOGIC_VECTOR (8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL low_speed_min_count : STD_LOGIC_VECTOR (8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL low_speed_mid_count : STD_LOGIC_VECTOR (8 DOWNTO 0) := "100000000";
    SIGNAL low_speed_max_count : STD_LOGIC_VECTOR (8 DOWNTO 0) := (OTHERS => '1');
BEGIN
    high_speed_clk_process : PROCESS (clk, reset)
        VARIABLE int_high_speed_clk : STD_LOGIC := '0';
    BEGIN
        IF reset = '1' THEN
            high_speed_count_reg <= high_speed_min_count;
        ELSIF rising_edge(clk) THEN
            IF high_speed_count_reg = high_speed_max_count THEN
                high_speed_count_reg <= high_speed_min_count;
            ELSE
                high_speed_count_reg <= high_speed_count_reg + 1;
            END IF;
            IF high_speed_count_reg = high_speed_mid_count THEN
                int_high_speed_clk := '0';
            ELSIF high_speed_count_reg = high_speed_min_count THEN
                int_high_speed_clk := '1';
            END IF;
        END IF;
        high_speed_clk <= int_high_speed_clk;
    END PROCESS high_speed_clk_process;
    medium_speed_clk_process : PROCESS (clk, reset)
        VARIABLE int_medium_speed_clk : STD_LOGIC := '0';
    BEGIN
        IF reset = '1' THEN
            medium_speed_count_reg <= medium_speed_min_count;
        ELSIF rising_edge(clk) THEN
            IF medium_speed_count_reg = medium_speed_max_count THEN
                medium_speed_count_reg <= medium_speed_min_count;
            ELSE
                medium_speed_count_reg <= medium_speed_count_reg + 1;
            END IF;
            IF medium_speed_count_reg = medium_speed_mid_count THEN
                int_medium_speed_clk := '0';
            ELSIF medium_speed_count_reg = medium_speed_min_count THEN
                int_medium_speed_clk := '1';
            END IF;
        END IF;
        medium_speed_clk <= int_medium_speed_clk;
    END PROCESS medium_speed_clk_process;
    low_speed_clk_process : PROCESS (clk, reset)
        VARIABLE int_low_speed_clk : STD_LOGIC := '0';
    BEGIN
        IF reset = '1' THEN
            low_speed_count_reg <= low_speed_min_count;
        ELSIF rising_edge(clk) THEN
            IF low_speed_count_reg = low_speed_max_count THEN
                low_speed_count_reg <= low_speed_min_count;
            ELSE
                low_speed_count_reg <= low_speed_count_reg + 1;
            END IF;
            IF low_speed_count_reg = low_speed_mid_count THEN
                int_low_speed_clk := '0';
            ELSIF low_speed_count_reg = low_speed_min_count THEN
                int_low_speed_clk := '1';
            END IF;
        END IF;
        low_speed_clk <= int_low_speed_clk;
    END PROCESS low_speed_clk_process;
END behaviour;