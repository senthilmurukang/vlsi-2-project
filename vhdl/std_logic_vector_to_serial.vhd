library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity std_logic_vector_to_serial is
    generic (DATA_WIDTH : natural := 4);
    port (
        signal clk    : in  std_logic;
        signal input  : in  std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
        signal output : out std_logic                                 := '0'
        );
end entity;

architecture behaviour of std_logic_vector_to_serial is
    signal bit_count : integer := -1;
begin
    process
    begin
        wait until rising_edge(clk);
        if bit_count = (DATA_WIDTH - 1) then
            output    <= input(0);
            bit_count <= 0;
        else
            output    <= input(bit_count + 1);
            bit_count <= bit_count + 1;
        end if;
    end process;
end architecture;
