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
begin
    process (clk)
        variable count      : integer                                   := 0;
        variable int_output : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
    begin
        if rising_edge(clk) then
            if count = 0 then
                output     <= int_output;
                int_output := (others => '0');
            end if;
            if input = '0' then
                int_output(count) := '0';
            else int_output(count) := '1';
            end if;
            if count = (output'length - 1) then
                count := 0;
            else
                count := count + 1;
            end if;
        end if;
    end process;
end architecture;
