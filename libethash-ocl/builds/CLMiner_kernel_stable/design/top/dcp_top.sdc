set_time_format -unit ns -decimal_places 3

# Default clocks for HSSI PLLs
create_clock -name {hssi_pll_r_0_outclk0} -period 3.800 -waveform { 0.000 1.900 } [get_nets {*|inst_hssi_ctrl|pll_r_0|xcvr_fpll_a10_0|outclk0}]
create_clock -name {hssi_pll_r_0_outclk1} -period 3.800 -waveform { 0.000 1.900 } [get_nets {*|inst_hssi_ctrl|pll_r_0|xcvr_fpll_a10_0|outclk1}]
create_clock -name {hssi_pll_t_outclk0}   -period 3.800 -waveform { 0.000 1.900 } [get_nets {*|inst_hssi_ctrl|pll_t|xcvr_fpll_a10_0|outclk0}]
create_clock -name {hssi_pll_t_outclk1}   -period 3.800 -waveform { 0.000 1.900 } [get_nets {*|inst_hssi_ctrl|pll_t|xcvr_fpll_a10_0|outclk1}]

set inst_list [get_entity_instances -nowarn "green_hssi_e10"]
if {$inst_list > 0} {
create_clock -name {hssi_pll_r_0_outclk0} -period 6.400 -waveform { 0.000 3.200 } [get_nets {*|inst_hssi_ctrl|pll_r_0|xcvr_fpll_a10_0|outclk0}]
create_clock -name {hssi_pll_r_0_outclk1} -period 3.200 -waveform { 0.000 1.600 } [get_nets {*|inst_hssi_ctrl|pll_r_0|xcvr_fpll_a10_0|outclk1}]
create_clock -name {hssi_pll_t_outclk0}   -period 6.400 -waveform { 0.000 3.200 } [get_nets {*|inst_hssi_ctrl|pll_t|xcvr_fpll_a10_0|outclk0}]
create_clock -name {hssi_pll_t_outclk1}   -period 3.200 -waveform { 0.000 1.600 } [get_nets {*|inst_hssi_ctrl|pll_t|xcvr_fpll_a10_0|outclk1}]
}

set inst_list [get_entity_instances -nowarn "green_hssi_e40"]
if {$inst_list > 0} {
create_clock -name {hssi_pll_r_0_outclk0} -period 3.200 -waveform { 0.000 1.600 } [get_nets {*|inst_hssi_ctrl|pll_r_0|xcvr_fpll_a10_0|outclk0}]
create_clock -name {hssi_pll_t_outclk0}   -period 3.200 -waveform { 0.000 1.600 } [get_nets {*|inst_hssi_ctrl|pll_t|xcvr_fpll_a10_0|outclk0}]
}

create_clock -name SYS_RefClk             -period  10.000 -waveform {0.000  5.000} [get_ports {SYS_RefClk}]
create_clock -name QSFP1_REFCLK_OSC_P     -period   3.103 -waveform {0.000  1.5515} [get_ports {QSFP1_REFCLK_OSC_P}]
create_clock -name {altera_reserved_tck}  -period 100.000 -waveform {0.000 50.000} [get_ports {altera_reserved_tck}]

derive_pll_clocks -create_base_clocks  
derive_clock_uncertainty

set_clock_groups -asynchronous -group [get_clocks {hssi_pll_r_0_outclk0 hssi_pll_r_0_outclk1}] \
                               -group [get_clocks {hssi_pll_t_outclk0 hssi_pll_t_outclk1}] \
                               -group [get_clocks {SYS_RefClk}]
set_clock_groups -asynchronous -group [get_clocks {fpga_top|inst_fiu_top|inst_hssi_ctrl|ntv0|xcvr_native_a10_0|g_xcvr_native_insts[*]*|rx_pma_clk}]

# Cutting path from temp sense logic to FME sampling logic
set_false_path -from {altera_ts_clk} -to {*dcp_iopll|clk100}
set_false_path -from [get_registers {fpga_top|inst_fiu_top|*|PR_IP|*|freeze_reg}] -to *
set_false_path -from [get_registers {SYS_RST_N}] -to *
set_false_path -from {DDR4_RST_N} -to *
set_false_path -from {HSSI_RST_N} -to *
set_false_path -from [get_registers {fpga_top|inst_fiu_top|*|PR_IP|*|freeze_reg}] -to *

# Cut paths from FME Clock domain to 25 MHz SPIFlash domain
set_false_path -from [get_registers {*|inst_fme_csr|go_bit_r2}] -to [get_clocks {*|dcp_iopll|clk25}]
set_false_path -from [get_registers {*|inst_fme_csr|go_bit_r3}] -to [get_clocks {*|dcp_iopll|clk25}]
set_false_path -from [get_registers {*|inst_fme_csr|csr_reg[14][1][*]}] -to [get_clocks {*|dcp_iopll|clk25}]
set_false_path -from [get_registers {*|inst_hssi_ctrl|*meta*}] -to *
set_false_path -to [get_registers {*|inst_hssi_ctrl|*meta*}] -from *

set_false_path -from [get_registers {fpga_top|inst_green_bs|inst_ccip_std_afu|ENET|rx_rst}] -to *
set_false_path -from [get_registers {fpga_top|inst_green_bs|inst_ccip_std_afu|ENET|tx_rst}] -to *
set_false_path -from [get_registers {fpga_top|inst_fiu_top|inst_ccip_fabric_top|inst_fme_top|inst_PR_cntrl|pr2fme_freeze_32UI[0]}] -to *
set_false_path -from [get_ports SYS_RST_N] -to *
set_false_path -from [get_registers {*|inst_hssi_ctrl|system_status_r[*]}] -to [get_registers {*|inst_fiu_top|inst_ccip_fabric_top|inst_fme_top|inst_fme_csr|csr_reg[6][2][*]}]
set_false_path -to [get_registers {*|inst_hssi_ctrl|system_ctrl_r[*]}] -from [get_registers {*|inst_fiu_top|inst_ccip_fabric_top|inst_fme_top|inst_fme_csr|csr_reg[6][1][*]}]
set_false_path -from [get_registers {*|inst_fiu_top|inst_ccip_fabric_top|inst_fme_top|inst_PR_cntrl|pr2fme_freeze_32UI[0]}]	-to [get_registers {*|inst_fiu_top|inst_hssi_ctrl|aux_rdata[1]}]
set_false_path -through [get_nets {*|hssi.f2a_tx_cal_busy}]
set_false_path -through [get_nets {*|hssi.f2a_tx_cal_locked}]
set_false_path -through [get_nets {*|hssi.f2a_tx_locked}]
set_false_path -through [get_nets {*|hssi.f2a_tx_pll_locked}]
set_false_path -through [get_nets {*|hssi.f2a_rx_cal_busy}]


# Cut paths for unneeded jtag connection ID ROM
set_false_path -from {*|alt_sld_fab_0|sldfabric|\jtag_hub_gen:real_sld_jtag_hub|mix_writedata*} -to {*connection_id_rom*}

# Async "slow" GPIO signals
set_false_path -from {MACID_SDA} -to *
set_false_path -to {MACID_SDA} -from *
set_false_path -from {QSFP1_SDA} -to *
set_false_path -to {QSFP1_SDA} -from *
set_false_path -from {QSFP1_PRS_L} -to *
set_false_path -from {QSFP1_INT_L} -to *
set_false_path -to {LED_L_0} -from *
set_false_path -to {LED_L_1} -from *
set_false_path -to {LED_L_2} -from *
set_false_path -to {LED_L_3} -from *
set_false_path -to {MACID_SCL} -from *
set_false_path -from {MACID_SCL} -to *
set_false_path -to {MACID_WP} -from *
set_false_path -to {QSFP1_SCL} -from *
set_false_path -from {QSFP1_SCL} -to *
set_false_path -to {QSFP1_LP} -from *
set_false_path -to {QSFP1_RST_L} -from *




	
