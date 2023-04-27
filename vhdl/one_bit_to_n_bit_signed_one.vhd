LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY one_bit_to_n_bit_signed_one IS
    GENERIC (
        DATA_WIDTH : NATURAL := 8
    );
    PORT (
        SIGNAL high_speed_clk : IN STD_LOGIC;
        SIGNAL input_bit : IN STD_LOGIC;
        SIGNAL output_bit : OUT STD_LOGIC := '0'
    );
END one_bit_to_n_bit_signed_one;

ARCHITECTURE behavioral OF one_bit_to_n_bit_signed_one IS
    SIGNAL output_reg : STD_LOGIC := '0';
BEGIN
    PROCESS (high_speed_clk)
        CONSTANT all_zeros : STD_LOGIC_VECTOR(DATA_WIDTH - 2 DOWNTO 0) := (OTHERS => '0');
        CONSTANT positive_one_bits : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0) := all_zeros & '1';
        CONSTANT negative_one_bits : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0) := (OTHERS => '1');
        VARIABLE counter : NATURAL RANGE 0 TO DATA_WIDTH;
    BEGIN
        IF rising_edge(high_speed_clk) THEN
            IF input_bit = '1' THEN
                output_reg <= positive_one_bits(counter);
            ELSE
                output_reg <= negative_one_bits(counter);
            END IF;
            counter := counter + 1;
            IF counter > (DATA_WIDTH - 1) THEN
                counter := 0;
            END IF;
        END IF;
    END PROCESS;
    output_bit <= output_reg;
END behavioral;