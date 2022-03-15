set_property PACKAGE_PIN V5 [get_ports {abcdefg_n[0]}]
set_property PACKAGE_PIN W7 [get_ports {abcdefg_n[1]}]
set_property PACKAGE_PIN V7 [get_ports {abcdefg_n[2]}]
set_property PACKAGE_PIN AA4 [get_ports {abcdefg_n[3]}]
set_property PACKAGE_PIN Y4 [get_ports {abcdefg_n[4]}]
set_property PACKAGE_PIN AB6 [get_ports {abcdefg_n[5]}]
set_property PACKAGE_PIN AB7 [get_ports {abcdefg_n[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg_n[0]}]
set_property PACKAGE_PIN V4 [get_ports c]
set_property PACKAGE_PIN Y9 [get_ports mclk]
set_property PACKAGE_PIN M15 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports c]
set_property IOSTANDARD LVCMOS33 [get_ports mclk]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports mclk]
