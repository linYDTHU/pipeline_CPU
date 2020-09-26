# System clock

set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports {clk}]



create_clock -period 20.000 -name CLK -waveform {0.000 5.000} [get_ports clk]



