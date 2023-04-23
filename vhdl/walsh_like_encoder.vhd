LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_encoder IS
    PORT (
        SIGNAL user_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        SIGNAL chip_sequence : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        SIGNAL encoded_output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_encoder IS
BEGIN
    PROCESS (user_data, chip_sequence)
    BEGIN
        FOR i IN chip_sequence'RANGE LOOP
            IF user_data(i) = '1' THEN
                encoded_output(i) <= chip_sequence(i);
            ELSIF user_data(i) = '0' THEN
                encoded_output(i) <= NOT chip_sequence(i);
            END IF;
        END LOOP;
    END PROCESS;
END ARCHITECTURE;