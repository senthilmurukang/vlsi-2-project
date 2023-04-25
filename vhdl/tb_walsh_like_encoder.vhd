LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_walsh_like_encoder IS
END ENTITY;

ARCHITECTURE behavior OF tb_walsh_like_encoder IS
    COMPONENT walsh_like_encoder IS
        PORT (
            SIGNAL user_data : IN STD_LOGIC;
            SIGNAL chip_sequence : IN STD_LOGIC;
            SIGNAL encoded_output : OUT STD_LOGIC := '0'
        );
    END COMPONENT;

    SIGNAL user_data : STD_LOGIC := '0';
    SIGNAL chip_sequence : STD_LOGIC := '0';
    SIGNAL encoded_output : STD_LOGIC;
    --SIGNAL sequence_buf : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');

BEGIN
    -- Instantiate the DUT

    DUT : walsh_like_encoder
    PORT MAP(
        user_data => user_data,
        chip_sequence => chip_sequence,
        encoded_output => encoded_output
    );

    -- Stimulus process

    user_data_proc : PROCESS
    BEGIN
        user_data <= '0';
        WAIT FOR 640 ns;
        user_data <= '1';
        WAIT FOR 640 ns;

    END PROCESS;
    -- Apply test vectors and wait
    chip_sequence_proc : PROCESS
    BEGIN
        --
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '0') REPORT "Failed case 1" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '0') REPORT "Failed case 2" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '0') REPORT "Failed case 3" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 4" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 5" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 6" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 7" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 8" SEVERITY error;
        -- when user_data<="1"
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '0') REPORT "Failed case 9" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '0') REPORT "Failed case 10" SEVERITY error;
        chip_sequence <= '0';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '0') REPORT "Failed case 11" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 12" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 13" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 14" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 15" SEVERITY error;
        chip_sequence <= '1';
        WAIT FOR 80 ns;
        ASSERT(encoded_output = '1') REPORT "Failed case 16" SEVERITY error;
        ASSERT FALSE
        REPORT "End of simulation"
            SEVERITY error;
    END PROCESS;
END ARCHITECTURE;