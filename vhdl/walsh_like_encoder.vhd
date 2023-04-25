LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_encoder IS
    PORT (
        SIGNAL medium_speed_clk : IN STD_LOGIC;
        SIGNAL user_data : IN STD_LOGIC;
        SIGNAL chip_sequence : IN STD_LOGIC;
        SIGNAL encoded_output : OUT STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_encoder IS
    SIGNAL output_reg : STD_LOGIC := '0';
    SIGNAL user_data_bit : STD_LOGIC := '0';
    SIGNAL chip_sequence_bit : STD_LOGIC := '0';
BEGIN

    encoder : PROCESS (medium_speed_clk)
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            IF user_data_bit = '1' THEN
                IF chip_sequence_bit = '0' THEN
                    output_reg <= '0';
                ELSE
                    output_reg <= '1';
                END IF;
            ELSE
                IF chip_sequence_bit = '0' THEN
                    output_reg <= '1';
                ELSE
                    output_reg <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    sample_chip_bit : PROCESS (chip_sequence) IS
    BEGIN
        IF rising_edge(chip_sequence) THEN
            chip_sequence_bit <= '1';
        END IF;
        IF falling_edge(chip_sequence) THEN
            chip_sequence_bit <= '0';
        END IF;
    END PROCESS;
    sample_input_bit : PROCESS (user_data)
    BEGIN
        IF rising_edge(user_data) THEN
            user_data_bit <= '1';
        END IF;
        IF falling_edge(user_data) THEN
            user_data_bit <= '0';
        END IF;
    END PROCESS;
    encoded_output <= output_reg;
END ARCHITECTURE;