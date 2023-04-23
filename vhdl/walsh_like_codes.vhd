LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_codes IS
  PORT (
    SIGNAL clk : IN STD_LOGIC;
    SIGNAL reset : IN STD_LOGIC;
    SIGNAL output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0')
  );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_codes IS
  SIGNAL int_clk : STD_LOGIC := '0';
  SIGNAL user_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := "10111011101110111011101110111011";
  SIGNAL serial_user_data : STD_LOGIC := '0';
BEGIN
  internal_clock_generator_inst : ENTITY work.internal_clock_generator
    PORT MAP(
      clk => clk,
      reset => reset,
      low_speed_clk => int_clk
    );
  std_logic_vector_to_serial_inst : ENTITY work.std_logic_vector_to_serial
    PORT MAP(
      clk => clk,
      input => user_data,
      output => serial_user_data
    );
  serial_to_std_logic_vector_inst : ENTITY work.serial_to_std_logic_vector
    PORT MAP(
      clk => int_clk,
      input => serial_user_data,
      output => output
    );
END behaviour;