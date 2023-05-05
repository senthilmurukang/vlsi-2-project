library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity walsh_like_codes is
  port (
    signal clk    : in  std_logic;
    signal reset  : in  std_logic;
    signal output : out std_logic
    );
end entity;

architecture behaviour of walsh_like_codes is
  signal int_medium_clk                     : std_logic                     := '0';
  signal int_low_clk                        : std_logic                     := '0';
  signal user_data_1                        : std_logic_vector(3 downto 0)  := "1011";
  signal user_data_2                        : std_logic_vector(3 downto 0)  := "1001";
  signal serial_user_data_1                 : std_logic                     := '0';
  signal serial_user_data_2                 : std_logic                     := '0';
  signal walsh_like_code_1                  : std_logic_vector(31 downto 0) := "10101010101010101010101010101010";
  signal walsh_like_code_2                  : std_logic_vector(31 downto 0) := "11111111111111110000000000000000";
  signal encoded_output_1                   : std_logic;
  signal encoded_output_2                   : std_logic;
  signal signed_output_1                    : std_logic                     := '0';
  signal signed_output_2                    : std_logic                     := '0';
  signal serial_walsh_like_code_1           : std_logic                     := '0';
  signal serial_walsh_like_code_2           : std_logic                     := '0';
  signal transmit_signal                    : std_logic                     := '0';
  signal output_vector_decoder              : std_logic_vector(7 downto 0)  := (others => '0');
  signal serial_walsh_like_code_decoder_1   : std_logic                     := '0';
  signal output_vector_walsh_like_decoder_2 : std_logic_vector(7 downto 0)  := (others => '0');
  signal multiplier_output                  : std_logic_vector(7 downto 0)  := (others => '0');
  signal output_adder_decoder               : std_logic_vector(7 downto 0)  := (others => '0');
  signal normalization_output_decoder       : std_logic_vector(7 downto 0)  := (others => '0');
begin
  internal_clock_generator_inst : entity work.internal_clock_generator
    port map(
      clk              => clk,
      reset            => reset,
      medium_speed_clk => int_medium_clk,
      low_speed_clk    => int_low_clk
      );
  std_logic_vector_to_serial_inst_1 : entity work.std_logic_vector_to_serial
    generic map(DATA_WIDTH => 4)
    port map(
      clk    => int_low_clk,
      input  => user_data_1,
      output => serial_user_data_1
      );
  std_logic_vector_to_serial_inst_2 : entity work.std_logic_vector_to_serial
    generic map(DATA_WIDTH => 32)
    port map(
      clk    => int_medium_clk,
      input  => walsh_like_code_1,
      output => serial_walsh_like_code_1
      );
  std_logic_vector_to_serial_inst_3 : entity work.std_logic_vector_to_serial
    generic map(DATA_WIDTH => 4)
    port map(
      clk    => int_low_clk,
      input  => user_data_2,
      output => serial_user_data_2
      );
  std_logic_vector_to_serial_inst_4 : entity work.std_logic_vector_to_serial
    generic map(DATA_WIDTH => 32)
    port map(
      clk    => int_medium_clk,
      input  => walsh_like_code_2,
      output => serial_walsh_like_code_2
      );
  walsh_like_encoder_inst_1 : entity work.walsh_like_encoder
    port map(
      user_data      => serial_user_data_1,
      chip_sequence  => serial_walsh_like_code_1,
      encoded_output => encoded_output_1
      );
  walsh_like_encoder_inst_2 : entity work.walsh_like_encoder
    port map(
      user_data      => serial_user_data_2,
      chip_sequence  => serial_walsh_like_code_2,
      encoded_output => encoded_output_2
      );
  one_bit_to_n_bit_signed_one_inst_1 : entity work.one_bit_to_n_bit_signed_one
    generic map(DATA_WIDTH => 8)
    port map(
      high_speed_clk => clk,
      input_bit      => encoded_output_1,
      output_bit     => signed_output_1
      );
  one_bit_to_n_bit_signed_one_inst_2 : entity work.one_bit_to_n_bit_signed_one
    generic map(DATA_WIDTH => 8)
    port map(
      high_speed_clk => clk,
      input_bit      => encoded_output_2,
      output_bit     => signed_output_2
      );
  n_bit_adder_inst : entity work.n_bit_adder
    generic map(INPUT_WIDTH => 8)
    port map(
      high_speed_clk   => clk,
      medium_speed_clk => int_medium_clk,
      input_a          => signed_output_1,
      input_b          => signed_output_2,
      output_sum       => transmit_signal
      );
  serial_to_std_logic_vector_inst_1 : entity work.serial_to_std_logic_vector
    generic map(DATA_WIDTH => 8)
    port map(
      clk    => clk,
      input  => transmit_signal,
      output => output_vector_decoder
      );
  std_logic_vector_to_serial_inst_5 : entity work.std_logic_vector_to_serial
    generic map(DATA_WIDTH => 32)
    port map(
      clk    => int_medium_clk,
      input  => walsh_like_code_1,
      output => serial_walsh_like_code_decoder_1
      ); 
  serial_to_std_logic_vector_inst_2 : entity work.serial_to_std_logic_vector
    generic map(DATA_WIDTH => 8)
    port map(
      clk    => clk,
      input  => serial_walsh_like_code_decoder_1,
      output => output_vector_walsh_like_decoder_2
      );

  multiplier_inst : entity work.multiplier
    generic map(DATA_SIZE => 8)
    port map(
      medium_speed_clk => int_medium_clk,
      recieved_signal  => output_vector_decoder,
      walsh_like_code  => output_vector_walsh_like_decoder_2,
      product_output   => multiplier_output
      ); 
  adder_decoder_inst : entity work.adder_decoder
    generic map(DATA_SIZE  => 8,
                count_size => 32)
    port map(
      clk          => int_medium_clk,
      input_signal => multiplier_output,
      output_adder => output_adder_decoder
      ); 
  normalization_inst : entity work.normalization
    port map(
      clk               => int_low_clk,
      adder_data        => output_adder_decoder,
      normalized_output => normalization_output_decoder
      );
  --output <= normalization_output_decoder;

end behaviour;
