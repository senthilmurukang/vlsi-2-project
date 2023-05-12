set_units -time ns -voltage V -current uA
create_clock -name clk -period 5.0 [get_ports clk]
set_input_delay -clock clk -max 1.0 [get_ports reset]
set_input_delay -clock clk -max 1.0 [get_ports enable]
set_output_delay -clock clk -max 1.0 [get_ports count]
set_multicycle_path -setup -from * -to * 0  
#set_max_delay -from * -to * 5.0 [get_ports clk]  
#set_clock_uncertainty -setup 0.5 [get_clocks clk]


