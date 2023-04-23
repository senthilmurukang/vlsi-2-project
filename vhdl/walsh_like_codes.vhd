LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY walsh_like_codes IS
  PORT (
    SIGNAL clk : IN STD_LOGIC;
    SIGNAL reset : IN STD_LOGIC;
    SIGNAL low_speed_clk : OUT STD_LOGIC := '0'
  );
END ENTITY;

ARCHITECTURE behaviour OF walsh_like_codes IS
  SIGNAL count_reg : STD_LOGIC_VECTOR (4 DOWNTO 0) := (OTHERS => '0');
  SIGNAL min_count : STD_LOGIC_VECTOR (4 DOWNTO 0) := (OTHERS => '0');
  SIGNAL mid_count : STD_LOGIC_VECTOR (4 DOWNTO 0) := "10000";
  SIGNAL max_count : STD_LOGIC_VECTOR (4 DOWNTO 0) := (OTHERS => '1');
BEGIN
  clk_process : PROCESS (clk, reset)
    VARIABLE int_clk : STD_LOGIC := '0';
  BEGIN
    IF reset = '1' THEN
      count_reg <= min_count;
    ELSIF rising_edge(clk) THEN
      IF count_reg = max_count THEN
        count_reg <= min_count;
      ELSE
        count_reg <= count_reg + 1;
      END IF;
      IF count_reg = mid_count THEN
        int_clk := '0';
      ELSIF count_reg = min_count THEN
        int_clk := '1';
      END IF;
    END IF;
    low_speed_clk <= int_clk;
  END PROCESS clk_process;
END behaviour;