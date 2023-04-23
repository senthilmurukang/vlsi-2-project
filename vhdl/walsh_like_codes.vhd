LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY walsh_like_codes IS
  PORT (
    SIGNAL clk : IN STD_LOGIC;
    SIGNAL start : IN STD_LOGIC;
    SIGNAL reset : IN STD_LOGIC;
    SIGNAL internal_clk : OUT STD_LOGIC := '0'
  );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_codes IS
BEGIN
  counter : PROCESS (clk, start, reset)
    VARIABLE count : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    VARIABLE int_clk : STD_LOGIC := '0';
  BEGIN
    IF (reset = '1') THEN
      count := (OTHERS => '0');
    ELSIF (clk'event AND clk = '1') THEN
      count := STD_LOGIC_VECTOR(unsigned(count) + 1);
      IF unsigned(count) >= 2 THEN
        count := (OTHERS => '0');
        IF int_clk = '1' THEN
          int_clk := '0';
        ELSE
          int_clk := '1';
        END IF;
      END IF;
    END IF;
    internal_clk <= int_clk;
  END PROCESS counter;
END behaviour;