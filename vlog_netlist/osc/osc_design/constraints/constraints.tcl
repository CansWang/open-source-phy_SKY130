# Modified from ButterPHY and Garnet constraints

set_load -pin_load $ADK_TYPICAL_ON_CHIP_LOAD [all_outputs]

set_driving_cell -no_design_rule \
  -lib_cell $ADK_DRIVING_CELL [all_inputs]

set_max_fanout 20 $dc_design_name

set T 1

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

set REF_T [expr {10.00*$T}]
set REF_T_05 [expr {5.00*$T}]

create_clock -name clk_ref \
    -period $REF_T \
    -waveform "$T0 $REF_T_05" \
    [get_ports ref_clk]

# create_clock -name clk_tx_pi_0 \
#     -period $T \
#     -waveform "$T0 $T2" \
#     [get_ports clk_Q]

# create_clock -name clk_tx_pi_1 \
#     -period $T \
#     -waveform "$T1 $T3" \
#     [get_ports clk_I]

# create_clock -name clk_tx_pi_2 \
#     -period $T \
#     -waveform "$T2 $T4" \
#     [get_ports clk_QB]

# create_clock -name clk_tx_pi_3 \
#     -period $T \
#     -waveform "$T3 $T5" \
#     [get_ports clk_IB]

# set_max_transition [expr {0.025*$time_scale}] [get_ports clk_Q]
# set_max_transition [expr {0.025*$time_scale}] [get_ports clk_I]
# set_max_transition [expr {0.025*$time_scale}] [get_ports clk_QB]
# set_max_transition [expr {0.025*$time_scale}] [get_ports clk_IB]
# Internal nets

set_dont_touch [get_cells {del1}]
set_dont_touch [get_cells {del2}]
set_dont_touch [get_cells {del3}]
set_dont_touch [get_cells {del4}]
set_dont_touch [get_cells {del5}]

set_dont_touch [get_cells {einj}]
set_dont_touch [get_cells {pi1 pi2 pi3 pi4 pi5}]


# Five stages of capbank
for {set i 1} {$i < 6} {incr i} {
    set_dont_touch [get_cells "capbank$i/fc1"]
    set_dont_touch [get_cells "capbank$i/fc2"]
    set_dont_touch [get_cells "capbank$i/fc3_0"]
    set_dont_touch [get_cells "capbank$i/fc3_1"]

    for {set l 0} {$l < 4} {incr l} {
        set_dont_touch [get_cells "capbank$i/fc44_$l"]
    }

    for {set j 4} {$j < 9} {incr j} {
        for {set k 0} {$k < 4} {incr k} {
            set_dont_touch [get_cells "capbank$i/fc$j\_$k"]
        }
    }
}

# dont touch for the edge injector
for {set i 1} {$i < 5} {incr i} {
    set_dont_touch [get_cells "einj/inj_del_$i"]
    set_dont_touch [get_cells "einj/dff_del_$i"]
}
for {set i 0} {$i < 4} {incr i} {
    set_dont_touch [get_cells "einj/inj_del_5_$i"]
    set_dont_touch [get_cells "einj/del_64_$i"]
    set_dont_touch [get_cells "einj/dff_del_5_$i"]
}

    set_dont_touch [get_cells "einj/dff_1"]
    set_dont_touch [get_cells "einj/dff_2"]
    set_dont_touch [get_cells "einj/inv_hold"]
    set_dont_touch [get_cells "einj/inj_0"]
    set_dont_touch [get_cells "einj/inj_1"]

    set_dont_touch [get_cells "einj/del_1"]
    set_dont_touch [get_cells "einj/del_4"]
    set_dont_touch [get_cells "einj/del_16"]
    set_dont_touch [get_cells "einj/buf_ref"]















