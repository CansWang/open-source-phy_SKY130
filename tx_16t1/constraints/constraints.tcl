# Modified from ButterPHY and Garnet constraints

set_load -pin_load $ADK_TYPICAL_ON_CHIP_LOAD [all_outputs]

set_driving_cell -no_design_rule \
  -lib_cell $ADK_DRIVING_CELL [all_inputs]

set_max_fanout 20 $dc_design_name

set T 0.6

set time_scale 1.0

set T0 [expr {0.00*$T}]
set T1 [expr {0.25*$T}]
set T2 [expr {0.50*$T}]
set T3 [expr {0.75*$T}]
set T4 [expr {1.00*$T}]
set T5 [expr {1.25*$T}]

set TR_4X [expr {0.025*$T}]
set TR [expr {0.1*$T}]
set TR_HR [expr {0.2*$T}]
set TR_QR [expr {0.4*$T}]

create_clock -name clk_tx_pi_0 \
    -period $T \
    -waveform "$T0 $T2" \
    [get_ports clk_Q]

create_clock -name clk_tx_pi_1 \
    -period $T \
    -waveform "$T1 $T3" \
    [get_ports clk_I]

create_clock -name clk_tx_pi_2 \
    -period $T \
    -waveform "$T2 $T4" \
    [get_ports clk_QB]

create_clock -name clk_tx_pi_3 \
    -period $T \
    -waveform "$T3 $T5" \
    [get_ports clk_IB]

set_max_transition [expr {0.025*$time_scale}] [get_ports clk_Q]
set_max_transition [expr {0.025*$time_scale}] [get_ports clk_I]
set_max_transition [expr {0.025*$time_scale}] [get_ports clk_QB]
set_max_transition [expr {0.025*$time_scale}] [get_ports clk_IB]
# Internal nets

set_dont_touch [get_cells {dff_Q0}]
set_dont_touch [get_cells {dff_I0}]
set_dont_touch [get_cells {dff_QB0}]
set_dont_touch [get_cells {dff_QB1}]
set_dont_touch [get_cells {dff_IB0}]
set_dont_touch [get_cells {dff_IB1}]
set_dont_touch [get_cells {mux_4/mux}]
set_dont_touch [get_cells {buf_IB}]
set_dont_touch [get_cells {buf_QB}]
