LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_encoder IS
    PORT (
        SIGNAL medium_speed_clk : IN STD_LOGIC;
        SIGNAL high_speed_clk : IN STD_LOGIC;
        SIGNAL user_data : IN STD_LOGIC;
        SIGNAL chip_sequence : IN STD_LOGIC;
        SIGNAL encoded_output : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_encoder IS
    SIGNAL positive_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    SIGNAL negative_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
    SIGNAL user_data_high_on_high_speed_rising : STD_LOGIC := '0';
    SIGNAL user_data_low_on_high_speed_rising : STD_LOGIC := '0';
BEGIN
    PROCESS (medium_speed_clk)
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            IF user_data = '1' THEN
                user_data_high_on_high_speed_rising <= '1';
            ELSIF user_data = '0' THEN
                user_data_low_on_high_speed_rising <= '1';
            END IF;
        END IF;
    END PROCESS;
    PROCESS
    BEGIN
        IF user_data_high_on_high_speed_rising = '1' THEN
            FOR index IN positive_one_bits'RANGE LOOP
                WAIT UNTIL rising_edge(high_speed_clk);
                IF chip_sequence = '1' THEN
                    encoded_output <= positive_one_bits(index);
                ELSE
                    encoded_output <= negative_one_bits(index);
                END IF;
            END LOOP;
            user_data_high_on_high_speed_rising <= '0';
        END IF;
    END PROCESS;
    PROCESS
    BEGIN
        IF user_data_low_on_high_speed_rising = '1' THEN
            FOR index IN negative_one_bits'RANGE LOOP
                WAIT UNTIL rising_edge(high_speed_clk);
                IF chip_sequence = '1' THEN
                    encoded_output <= negative_one_bits(index);
                ELSE
                    encoded_output <= positive_one_bits(index);
                END IF;
            END LOOP;
            user_data_high_on_high_speed_rising <= '0';
        END IF;
    END PROCESS;
END ARCHITECTURE;