
-- 
-- Definition of  bit_to_four_bit_signed_one
-- 
--      Wed Apr 26 21:35:55 2023
--      
--      LeonardoSpectrum Level 3, 2011a.4
-- 

library ieee, adk; use ieee.std_logic_1164.all, use ieee.numeric_std.all, adk.adk_components.all;

entity bit_to_four_bit_signed_one is
   port (
      high_speed_clk : IN std_logic ;
      input_bit : IN std_logic ;
      output_bit : OUT std_logic) ;
end bit_to_four_bit_signed_one ;

architecture behavioral of bit_to_four_bit_signed_one is
   signal counter_1, counter_0, NOT_counter_0, nx8, nx24: std_logic ;

begin
   reg_output_reg : dff port map ( Q=>output_bit, QB=>OPEN, D=>nx24, CLK=>
      high_speed_clk);
   ix25 : oai21 port map ( Y=>nx24, A0=>counter_1, A1=>counter_0, B0=>
      input_bit);
   reg_counter_dup_0 : dff port map ( Q=>counter_1, QB=>OPEN, D=>nx8, CLK=>
      high_speed_clk);
   reg_counter_dup_1 : dff port map ( Q=>counter_0, QB=>NOT_counter_0, D=>
      NOT_counter_0, CLK=>high_speed_clk);
   ix9 : xor2 port map ( Y=>nx8, A0=>counter_1, A1=>counter_0);
end behavioral ;

