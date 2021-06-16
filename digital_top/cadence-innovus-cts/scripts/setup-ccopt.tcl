#=========================================================================
# setup-ccopt.tcl
#=========================================================================
# Author : Christopher Torng
# Date   : March 26, 2018

# Allow clock gate cloning and merging

set_ccopt_property -pin qr_mux_4t1_0/clk_Q -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_0/clk_Q sink_type stop
set_ccopt_property -pin qr_mux_4t1_0/clk_QB -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_0/clk_QB sink_type stop
set_ccopt_property -pin qr_mux_4t1_0/clk_I -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_0/clk_I sink_type stop
set_ccopt_property -pin qr_mux_4t1_0/clk_IB -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_0/clk_IB sink_type stop

set_ccopt_property -pin qr_mux_4t1_1/clk_Q -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_1/clk_Q sink_type stop
set_ccopt_property -pin qr_mux_4t1_1/clk_QB -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_1/clk_QB sink_type stop
set_ccopt_property -pin qr_mux_4t1_1/clk_I -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_1/clk_I sink_type stop
set_ccopt_property -pin qr_mux_4t1_1/clk_IB -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin qr_mux_4t1_1/clk_IB sink_type stop

set_ccopt_property -pin hr_mux_16t4_0/clk -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin hr_mux_16t4_0/clk sink_type stop

set_ccopt_property -pin hr_mux_16t4_1/clk -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin hr_mux_16t4_1/clk sink_type stop

set_ccopt_property -pin ftl/ref_clk -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin ftl/ref_clk sink_type stop

set_ccopt_property -pin osc_inst/ref_clk -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin osc_inst/ref_clk sink_type stop

set_ccopt_property -pin osc_inst/ref_clk -delay_corner delay_default capacitance_override 0.01
set_ccopt_property -pin osc_inst/ref_clk sink_type stop



for {set i 0} {$i < 16} {incr i} {
  set_ccopt_property -pin genblk1_$i\__prbs_b/clk -delay_corner delay_default capacitance_override 0.01
  set_ccopt_property -pin genblk1_$i\__prbs_b/clk sink_type stop
}
