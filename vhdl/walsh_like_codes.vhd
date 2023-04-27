LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_codes IS
  PORT (
    SIGNAL clk : IN STD_LOGIC;
    SIGNAL reset : IN STD_LOGIC;
    SIGNAL output : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_codes IS
  SIGNAL int_medium_clk : STD_LOGIC := '0';
  SIGNAL int_low_clk : STD_LOGIC := '0';
  SIGNAL user_data_1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
  SIGNAL user_data_2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
  SIGNAL serial_user_data_1 : STD_LOGIC := '0';
  SIGNAL serial_user_data_2 : STD_LOGIC := '0';
  SIGNAL walsh_like_code_1 : STD_LOGIC_VECTOR(31 DOWNTO 0) := "10101010101010101010101010101010";
  SIGNAL walsh_like_code_2 : STD_LOGIC_VECTOR(31 DOWNTO 0) := "11111111111111110000000000000000";
  SIGNAL encoded_output_1 : STD_LOGIC;
  SIGNAL encoded_output_2 : STD_LOGIC;
  SIGNAL signed_output_1 : STD_LOGIC := '0';
  SIGNAL signed_output_2 : STD_LOGIC := '0';
  SIGNAL serial_walsh_like_code_1 : STD_LOGIC := '0';
  SIGNAL serial_walsh_like_code_2 : STD_LOGIC := '0';
  SIGNAL transmit_signal : STD_LOGIC := '0';
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
    GENERIC MAP(DATA_WIDTH => 32)
    PORT MAP(
      clk => int_medium_clk,
      input => walsh_like_code_1,
      output => serial_walsh_like_code_1
    );
  std_logic_vector_to_serial_inst_3 : ENTITY work.std_logic_vector_to_serial
    GENERIC MAP(DATA_WIDTH => 4)
    PORT MAP(
      clk => int_low_clk,
      input => user_data_2,
      output => serial_user_data_2
    );
  std_logic_vector_to_serial_inst_4 : ENTITY work.std_logic_vector_to_serial
    GENERIC MAP(DATA_WIDTH => 32)
    PORT MAP(
      clk => int_medium_clk,
      input => walsh_like_code_2,
      output => serial_walsh_like_code_2
    );
  walsh_like_encoder_inst_1 : ENTITY work.walsh_like_encoder
    PORT MAP(
      user_data => serial_user_data_1,
      chip_sequence => serial_walsh_like_code_1,
      encoded_output => encoded_output_1
    );
  walsh_like_encoder_inst_2 : ENTITY work.walsh_like_encoder
    PORT MAP(
      user_data => serial_user_data_2,
      chip_sequence => serial_walsh_like_code_2,
      encoded_output => encoded_output_2
    );
  one_bit_to_n_bit_signed_one_inst_1 : ENTITY work.one_bit_to_n_bit_signed_one
    GENERIC MAP(DATA_WIDTH => 8)
    PORT MAP(
      high_speed_clk => clk,
      input_bit => encoded_output_1,
      output_bit => signed_output_1
    );
  one_bit_to_n_bit_signed_one_inst_2 : ENTITY work.one_bit_to_n_bit_signed_one
    GENERIC MAP(DATA_WIDTH => 8)
    PORT MAP(
      high_speed_clk => clk,
      input_bit => encoded_output_2,
      output_bit => signed_output_2
    );
  n_bit_adder_inst : ENTITY work.n_bit_adder
    GENERIC MAP(INPUT_WIDTH => 8)
    PORT MAP(
      high_speed_clk => clk,
      medium_speed_clk => int_medium_clk,
      input_a => signed_output_1,
      input_b => signed_output_2,
      output_sum => transmit_signal
    );
  output <= transmit_signal;
END behaviour;