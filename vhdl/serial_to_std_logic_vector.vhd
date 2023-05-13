library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity serial_to_std_logic_vector is
    generic (DATA_WIDTH : natural := 4);
    port (
        signal clk    : in  std_logic;
        signal input  : in  std_logic;
        signal output : out std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0')
        );
end entity;

architecture behaviour of serial_to_std_logic_vector is
    signal counter              : integer range 0 to DATA_WIDTH + 1         := 0;
    signal data_reg             : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal previous_input_value : std_logic                                 := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if counter = 0 then
                data_reg <= (others => '0');
            elsif counter >= 1 and counter <= DATA_WIDTH then
                data_reg(counter - 1) <= previous_input_value;
            end if;
            counter <= (counter + 1);
            if counter = DATA_WIDTH then
                output  <= data_reg;
                counter <= 0;
            end if;
            previous_input_value <= input;
        end if;
    end process;
end architecture;
