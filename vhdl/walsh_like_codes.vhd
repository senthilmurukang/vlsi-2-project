library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(
        a, b: in std_logic;
        sum, carry_out: out std_logic
    );
end entity half_adder;

architecture behavioral of half_adder is
begin
    sum <= a xor b;
    carry_out <= a and b;
end architecture behavioral;
