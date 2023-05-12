LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY dec_add_tb IS
END ENTITY dec_add_tb;

ARCHITECTURE testbench OF dec_add_tb IS
    -- Component Declaration
    COMPONENT dec_add
        GENERIC (
            DATA_SIZE : NATURAL := 8;
            countip : NATURAL := 32
        );
        PORT (
            clk : IN STD_LOGIC;
            input_signal : IN STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0);
            addedop : OUT STD_LOGIC_VECTOR(DATA_SIZE - 1 DOWNTO 0)
        );
    END COMPONENT;

    -- Component Signals
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL input_signal : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL addedop : STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN
 
    -- design under test is instantiated
    dut: dec_add
        GENERIC MAP (
            DATA_SIZE => 8,
            countip => 32
        )
        PORT MAP (
            clk => clk,
            input_signal => input_signal,
            addedop => addedop
        );
        
    -- Clock 
    Process
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
        input_signal <= "00000000";
        WAIT FOR 10 ns;
        
        input_signal <= "00000001";
        WAIT FOR 10 ns;
        
        input_signal <= "00000010";
        WAIT FOR 10 ns;

       input_signal <="00000100";
        WAIT FOR 10 ns;

       input_signal <= "00001000";
        WAIT FOR 10 ns;

      input_signal <= "00010000";
        WAIT FOR 10 ns;

        input_signal <= "00100000";
        WAIT FOR 10 ns;

	      input_signal <= "01000000";
        WAIT FOR 10 ns;

	      input_signal <= "10000000";
        WAIT FOR 10 ns;
       
        WAIT;
    END PROCESS;
END testbench;
