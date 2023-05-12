
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dec_mul_tb IS
END ENTITY dec_mul_tb;

ARCHITECTURE testbench OF dec_mul_tb IS
    -- Component Declaration
    COMPONENT dec_mul
        GENERIC (
            DATA_SIZE : NATURAL := 4
        );
        PORT (
            clk : IN STD_LOGIC;
            received_signal : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
            walsh_like_code : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
            product_output : OUT STD_LOGIC_VECTOR(2 * DATA_SIZE - 1 DOWNTO 0)
        );
    END COMPONENT;

    -- Component Signals
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL received_signal : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL walsh_like_code : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL product_output : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    -- Instantiate the Design Under Test (DUT)
    dut: dec_mul
        GENERIC MAP (
            DATA_SIZE => 4
        )
        PORT MAP (
            clk => clk,
            received_signal => received_signal,
            walsh_like_code => walsh_like_code,
            product_output => product_output
        );

    -- Clock Process
    PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
    END PROCESS;

    -- Stimulus Process
    PROCESS
    BEGIN
        received_signal <= "1111";
        walsh_like_code <= "0101";
        WAIT FOR 10 ns;
        
        received_signal <= "1111";
        walsh_like_code <= "0111";
        WAIT FOR 10 ns;
    
        received_signal <= "0000";
        walsh_like_code <= "0000";
        WAIT FOR 10 ns;
        
        received_signal <= "0010";
        walsh_like_code <= "0101";
        WAIT FOR 10 ns;
        
        received_signal <= "0100";
        walsh_like_code <= "0101";
        WAIT FOR 10 ns;
        
        received_signal <= "0111";
        walsh_like_code <= "0101";
        WAIT FOR 10 ns;
        
        
        
        WAIT;
    END PROCESS;

END testbench;

