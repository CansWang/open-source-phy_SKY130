#=========================================================================
# setup-ccopt.tcl
#=========================================================================
# Author : Christopher Torng
# Date   : March 26, 2018

# Allow clock gate cloning and merging


create_ccopt_clock_tree -name clk -source ref_clk


# set_ccopt_property sink_type -pin capbank1_fc3_1/B stop

# set_ccopt_property sink_type -pin capbank2/ref_clk stop
# set_ccopt_property sink_type -pin capbank3/ref_clk stop
# set_ccopt_property sink_type -pin capbank4/ref_clk stop
# set_ccopt_property sink_type -pin capbank5/ref_clk stop
