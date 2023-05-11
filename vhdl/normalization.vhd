library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity normalization is
    generic (
        DATA_SIZE : natural := 4
        );
    port (
        signal clk               : in  std_logic;
        signal ready             : in  std_logic;
        signal adder_data        : in  std_logic_vector(DATA_SIZE - 1 downto 0);
        signal normalized_output : out std_logic_vector(DATA_SIZE - 1 downto 0) := (others => '0')
        );
end entity;

architecture behaviour of normalization is
begin
    process (adder_data, clk)
    begin
        if ready = '1' then
            if rising_edge(clk) then
                if adder_data(DATA_SIZE - 1) = '1' then
                    normalized_output <= "11111111";
                else
                    normalized_output <= "00000001";
                end if;
            end if;
        end if;
    end process;
end architecture;
