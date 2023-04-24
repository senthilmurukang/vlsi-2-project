LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY bit_to_four_bit_signed_one IS
    PORT (
        medium_speed_clk : IN STD_LOGIC;
        low_speed_clk : IN STD_LOGIC;
        inputBit : IN STD_LOGIC;
        outputBit : OUT STD_LOGIC);
END bit_to_four_bit_signed_one;

ARCHITECTURE behavioral OF bit_to_four_bit_signed_one IS
    SIGNAL outputReg : STD_LOGIC := '0';
    SIGNAL input_bit_value : BIT := '0';
    SHARED VARIABLE counter : NATURAL := 0;
BEGIN
    PROCESS (medium_speed_clk)
        VARIABLE positive_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
        VARIABLE negative_one_bits : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
    BEGIN
        IF rising_edge(medium_speed_clk) THEN
            IF input_bit_value = '1' THEN
                outputReg <= positive_one_bits(counter);
            ELSE
                outputReg <= negative_one_bits(counter);
            END IF;
            counter := counter + 1;
            IF counter > 3 THEN
                counter := 0;
            END IF;
        END IF;
    END PROCESS;
    PROCESS (low_speed_clk)
    BEGIN
        IF rising_edge(low_speed_clk) THEN
            IF inputBit = '0' THEN
                input_bit_value <= '0';
            ELSE
                input_bit_value <= '1';
            END IF;
            counter := 0;
        END IF;
    END PROCESS;
    outputBit <= outputReg;
END behavioral;