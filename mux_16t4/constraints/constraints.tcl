# Modified from ButterPHY and Garnet constraints

set_load -pin_load $ADK_TYPICAL_ON_CHIP_LOAD [all_outputs]

set_driving_cell -no_design_rule \
  -lib_cell $ADK_DRIVING_CELL [all_inputs]

set_max_fanout 20 $dc_design_name

set T 0.6

set T2 [expr {2*$T}]
set T4 [expr {4*$T}]

set TR_4X [expr {0.025*$T}]
set TR [expr {0.1*$T}]
set TR_HR [expr {0.2*$T}]
set TR_QR [expr {0.4*$T}]

create_clock -name clk_16t4_hr \
    -period $T2 \
    [get_ports clk_hr]

create_clock -name clk_16t4_prbs \
    -period $T4 \
    [get_ports clk_prbs]

# Internal nets
