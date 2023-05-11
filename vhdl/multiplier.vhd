library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplier is
    generic (
        DATA_SIZE : natural := 8
        );
    port (
        medium_speed_clk : in  std_logic;
        recieved_signal  : in  std_logic_vector(DATA_SIZE - 1 downto 0);
        walsh_like_code  : in  std_logic_vector(DATA_SIZE - 1 downto 0);
        product_output   : out std_logic_vector(DATA_SIZE - 1 downto 0) := (others => '0')
        );
end entity;

architecture behaviour of multiplier is

begin
    process (medium_speed_clk, recieved_signal, walsh_like_code)
        variable pv, bp : std_logic_vector(2 * DATA_SIZE - 1 downto 0) := (others => '0');
    --CONSTANT DATA_SIZE : NATURAL := 4;
    begin
        if rising_edge(medium_speed_clk) then
            pv := "0000000000000000";
            bp := "00000000" & walsh_like_code;
            for i in 0 to DATA_SIZE - 1 loop
                if recieved_signal(i) = '1' then
                    pv := pv + bp;
                end if;
                bp := bp(2 * DATA_SIZE - 2 downto 0) & '0';
            end loop;
            product_output <= pv(DATA_SIZE - 1 downto 0);
        end if;
    end process;

end architecture;
