library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity adder_decoder is
    generic (
        DATA_SIZE  : natural := 8;
        count_size : natural := 32
        );
    port (clk          : in  std_logic;
          adder_ready  : out std_logic                                := '0';
          input_signal : in  std_logic_vector(DATA_SIZE - 1 downto 0);
          output_adder : out std_logic_vector(DATA_SIZE - 1 downto 0) := (others => '0')
          );
end entity;

architecture behaviour of adder_decoder is



begin
    process (clk, input_signal)
        variable output_buffer : std_logic_vector(DATA_SIZE - 1 downto 0) := (others => '0');
        variable count         : natural range 0 to count_size            := 0;
    begin
        
        if rising_edge(clk) then
            if count < count_size-1 then
                output_buffer := std_logic_vector(signed(output_buffer)) + std_logic_vector(signed(input_signal));
                count         := count +1;
            else
                adder_ready   <= '1';
                output_adder  <= output_buffer;
                count         := 0;
                output_buffer := (others => '0');

            end if;
        end if;
    end process;
end architecture;
