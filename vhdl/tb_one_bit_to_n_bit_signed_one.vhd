LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY tb_one_bit_to_n_bit_signed_one IS
END ENTITY tb_one_bit_to_n_bit_signed_one;

-- Architecture for the Test Bench
ARCHITECTURE behavior OF tb_one_bit_to_n_bit_signed_one IS

    -- Signal declarations
    SIGNAL clk : STD_LOGIC := '0'; -- Clock signal
    SIGNAL data_in : STD_LOGIC := '0'; -- Input data
    SIGNAL data_out : STD_LOGIC; -- Output data

    -- Component declaration for the DUT
    COMPONENT one_bit_to_n_bit_signed_one IS
        PORT (
            high_speed_clk : IN STD_LOGIC;
            input_bit : IN STD_LOGIC;
            output_bit : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN

    -- Clock generation process
    clk_process : PROCESS
    BEGIN
        WAIT FOR 10 ns;
        clk <= NOT clk;
    END PROCESS clk_process;

    -- Stimulus process
    stim_process : PROCESS
    BEGIN
        WAIT FOR 10 ns;

        data_in <= '1';
        WAIT FOR 80 ns;
        data_in <= '0';
        WAIT FOR 80 ns;
        data_in <= '1';
        WAIT FOR 80 ns;
        data_in <= '0';

        WAIT;
    END PROCESS stim_process;

    validation_process : PROCESS
    BEGIN
        WAIT FOR 10 ns;
        WAIT FOR 1 ns; -- accommodating for delays
        ASSERT(data_out = '1') REPORT "The output is not '1'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '0') REPORT "The output is not '0'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '0') REPORT "The output is not '0'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '0') REPORT "The output is not '0'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '1') REPORT "The output is not '1'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '1') REPORT "The output is not '1'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '1') REPORT "The output is not '1'." SEVERITY error;

        WAIT FOR 20 ns;
        ASSERT(data_out = '1') REPORT "The output is not '1'." SEVERITY error;

        WAIT;
    END PROCESS;

    -- Instantiate the DUT
    dut_one_bit_to_n_bit_signed_one : one_bit_to_n_bit_signed_one
    PORT MAP(
        high_speed_clk => clk,
        input_bit => data_in,
        output_bit => data_out
    );

END ARCHITECTURE behavior;