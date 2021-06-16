# Modified from ButterPHY and Garnet constraints

set_load -pin_load $ADK_TYPICAL_ON_CHIP_LOAD [all_outputs]

set_driving_cell -no_design_rule \
  -lib_cell $ADK_DRIVING_CELL [all_inputs]

set_max_fanout 20 $dc_design_name

set T 10.0

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
set TR_10 [expr {0.01*$T}]

set_max_transition $TR_10 [current_design]

# create_clock -name clk_interp_slice_0 \
#     -period $T \
#     -waveform "$T0 $T2" \
#     [get_ports clk_interp_slice_0]

# create_clock -name clk_interp_slice_1 \
#     -period $T \
#     -waveform "$T1 $T3" \
#     [get_ports clk_interp_slice_1]

# create_clock -name clk_interp_slice_2 \
#     -period $T \
#     -waveform "$T2 $T4" \
#     [get_ports clk_interp_slice_2]

# create_clock -name clk_interp_slice_3 \
#     -period $T \
#     -waveform "$T3 $T5" \
#     [get_ports clk_interp_slice_3]

create_clock -name ref \
     -period $T \
     -waveform "$T0 $T2" \
     [get_ports ref_clk_ext]


# Pass the clk property to one of the mdll output
create_generated_clock -name mdll_out \
    -source [get_ports ref_clk_ext] \
    -multiply_by 10 \
    [get_pins osc_inst/p3]

# Internal nets


##############
# DONT TOUCH #
##############

# ibuf/ dont touch
    for {set l 0} {$l < 40} {incr l} {
        set_dont_touch [get_cells "ibuf/genblk1[$l].i_tri_buf_n"]
        set_dont_touch [get_cells "ibuf/genblk1[$l].i_tri_buf_p"]
    }

    for {set l 0} {$l < 4} {incr l} {
        set_dont_touch [get_cells "ibuf/predrv_p1_$l"]
        set_dont_touch [get_cells "ibuf/predrv_n1_$l"]

    }
        set_dont_touch [get_cells "ibuf/predrv_p0_0"]
        set_dont_touch [get_cells "ibuf/predrv_p0_1"]
        set_dont_touch [get_cells "ibuf/predrv_n0_0"]
        set_dont_touch [get_cells "ibuf/predrv_n0_1"]
        

# test logic don't touch
    for {set l 0} {$l < 4} {incr l} {
        set_dont_touch [get_cells "test_mux_$l"]
        set_dont_touch [get_cells "test_buf_$l"]
        set_dont_touch [get_cells "test_clk_Q_buf$l"]
        set_dont_touch [get_cells "test_clk_I_buf$l"]
        set_dont_touch [get_cells "ref_clk_in_buf2_$l"]
    }

    for {set l 0} {$l < 2} {incr l} {
        set_dont_touch [get_cells "test_mux_Q$l"]
        set_dont_touch [get_cells "test_mux_I$l"]
        set_dont_touch [get_cells "ref_clk_in_buf1_$l"]
    }





