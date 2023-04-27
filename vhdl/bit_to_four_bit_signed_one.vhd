LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY bit_to_four_bit_signed_one IS
    PORT (
        SIGNAL high_speed_clk : IN STD_LOGIC;
        SIGNAL input_bit : IN STD_LOGIC;
        SIGNAL output_bit : OUT STD_LOGIC
    );
END bit_to_four_bit_signed_one;

ARCHITECTURE behavioral OF bit_to_four_bit_signed_one IS
    SIGNAL output_reg : STD_LOGIC := '0';
BEGIN
    PROCESS (high_speed_clk)
        CONSTANT positive_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
        CONSTANT negative_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
        VARIABLE counter : NATURAL RANGE 0 TO 4;
    BEGIN
        IF rising_edge(high_speed_clk) THEN
            IF input_bit = '1' THEN
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
    output_bit <= output_reg;
END behavioral;