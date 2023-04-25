LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_codes IS
  PORT (
    SIGNAL clk : IN STD_LOGIC;
    SIGNAL reset : IN STD_LOGIC;
    SIGNAL output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
  );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_codes IS
  SIGNAL int_medium_clk : STD_LOGIC := '0';
  SIGNAL int_low_clk : STD_LOGIC := '0';
  SIGNAL user_data_1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
  -- SIGNAL user_data_2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
  SIGNAL serial_user_data_1 : STD_LOGIC := '0';
  SIGNAL walsh_like_code_1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
  -- SIGNAL walsh_like_code_2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
  SIGNAL encoded_output_1 : STD_LOGIC;
  -- SIGNAL encoded_output_2 : STD_LOGIC;
  SIGNAL signed_output_1 : STD_LOGIC := '0';
  SIGNAL serial_walsh_like_code_1 : STD_LOGIC := '0';
BEGIN
  internal_clock_generator_inst : ENTITY work.internal_clock_generator
    PORT MAP(
      clk => clk,
      reset => reset,
      medium_speed_clk => int_medium_clk,
      low_speed_clk => int_low_clk
    );
  std_logic_vector_to_serial_inst_1 : ENTITY work.std_logic_vector_to_serial
    GENERIC MAP(DATA_WIDTH => 4)
    PORT MAP(
      clk => int_low_clk,
      input => user_data_1,
      output => serial_user_data_1
    );
  std_logic_vector_to_serial_inst_2 : ENTITY work.std_logic_vector_to_serial
    GENERIC MAP(DATA_WIDTH => 4)
    PORT MAP(
      clk => int_medium_clk,
      input => walsh_like_code_1,
      output => serial_walsh_like_code_1
    );
  walsh_like_encoder_inst_1 : ENTITY work.walsh_like_encoder
    PORT MAP(
      medium_speed_clk => int_medium_clk,
      user_data => serial_user_data_1,
      chip_sequence => serial_walsh_like_code_1,
      encoded_output => encoded_output_1
    );
  -- walsh_like_encoder_inst_2 : ENTITY work.walsh_like_encoder
  --   PORT MAP(
  --     user_data => user_data_2,
  --     chip_sequence => walsh_like_code_2,
  --     encoded_output => encoded_output_2
  --   );
  bit_to_four_bit_signed_one_inst : ENTITY work.bit_to_four_bit_signed_one
    PORT MAP(
      high_speed_clk => int_medium_clk,
      medium_speed_clk => int_low_clk,
      input_bit => encoded_output_1,
      output_bit => signed_output_1
    );
  serial_to_std_logic_vector_inst : ENTITY work.serial_to_std_logic_vector
    GENERIC MAP(DATA_WIDTH => 4)
    PORT MAP(
      clk => clk,
      input => signed_output_1,
      output => output
    );
END behaviour;