LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_encoder IS
    PORT (
        SIGNAL user_data : IN STD_LOGIC;
        SIGNAL chip_sequence : IN STD_LOGIC;
        SIGNAL encoded_output : OUT STD_LOGIC := '0'
    );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_encoder IS
    SIGNAL output_reg : STD_LOGIC := '0';
BEGIN

    encoder : PROCESS (chip_sequence)
    BEGIN

        IF user_data = '1' THEN
            IF chip_sequence = '0' THEN
                output_reg <= '0';
            ELSE
                output_reg <= '1';
            END IF;
        ELSE
            IF chip_sequence = '0' THEN
                output_reg <= '1';
            ELSE
                output_reg <= '0';
            END IF;
        END IF;

    END PROCESS;
    encoded_output <= output_reg;
END ARCHITECTURE;