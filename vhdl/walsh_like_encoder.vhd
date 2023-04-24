LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_encoder IS
    PORT (
        SIGNAL high_speed_clk : IN STD_LOGIC;
        SIGNAL medium_speed_clk : IN STD_LOGIC;
        SIGNAL low_speed_clk : IN STD_LOGIC;
        SIGNAL user_data : IN STD_LOGIC;
        SIGNAL chip_sequence : IN STD_LOGIC;
        SIGNAL encoded_output : OUT STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_encoder IS
    SIGNAL output_reg : STD_LOGIC := '0';
    SIGNAL input_bit_value : BIT := '0';
    SIGNAL user_data_bit : BIT := '0';
    SIGNAL chip_sequence_bit : BIT := '0';
    SHARED VARIABLE counter : NATURAL := 0;
    SHARED VARIABLE user_and_chip_product : BIT := '0';
BEGIN

    signed_bit_generator : PROCESS (high_speed_clk)
        VARIABLE positive_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
        VARIABLE negative_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
    BEGIN
        IF rising_edge(high_speed_clk) THEN
            IF input_bit_value = '1' THEN
                output_reg <= positive_one_bits(counter);
            ELSE
                output_reg <= negative_one_bits(counter);
            END IF;
            counter := counter + 1;
            IF counter > 3 THEN
                counter := 0;
            END IF;
        END IF;
    END PROCESS;

    sample_user_data_chip_product : PROCESS (medium_speed_clk)
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            IF user_and_chip_product = '0' THEN
                input_bit_value <= '0';
            ELSE
                input_bit_value <= '1';
            END IF;
            counter := 0;
        END IF;
    END PROCESS;

    sample_chip_bit : PROCESS (medium_speed_clk) IS
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            IF chip_sequence = '0' THEN
                chip_sequence_bit <= '0';
            ELSE
                chip_sequence_bit <= '1';
            END IF;
        END IF;
    END PROCESS;

    user_data_chip_product : PROCESS (medium_speed_clk)
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            IF user_data_bit = '1' THEN
                user_and_chip_product := chip_sequence_bit;
            ELSE
                user_and_chip_product := NOT chip_sequence_bit;
            END IF;
        END IF;
    END PROCESS;

    sample_input_bit : PROCESS (low_speed_clk)
    BEGIN
        IF rising_edge(low_speed_clk) THEN
            IF user_data = '0' THEN
                user_data_bit <= '0';
            ELSE
                user_data_bit <= '1';
            END IF;
        END IF;
    END PROCESS;
    encoded_output <= output_reg;
END ARCHITECTURE;