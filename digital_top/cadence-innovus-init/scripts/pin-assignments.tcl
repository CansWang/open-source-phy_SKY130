#=========================================================================
# pin-assignments.tcl
#=========================================================================
# The ports of this design become physical pins along the perimeter of the
# design. The commands below will spread the pins along the left and right
# perimeters of the core area. This will work for most designs, but a
# detail-oriented project should customize or replace this section.
#
# Author : Christopher Torng
# Date   : March 26, 2018

#-------------------------------------------------------------------------
# Pin Assignments
#-------------------------------------------------------------------------

# Take all ports and split into halves
proc snap_to_grid {input granularity} {
   set new_value [expr ceil($input / $granularity) * $granularity]
   return $new_value
}



set vert_pitch  3.33
set horiz_pitch 0.48
set all_ports       [dbGet top.terms.name -v *clk*]

set num_ports       [llength $all_ports]
set half_ports_idx  [expr $num_ports / 2]

set pins_left_half  [lrange $all_ports 0               [expr $half_ports_idx - 1]]
set pins_right_half [lrange $all_ports $half_ports_idx [expr $num_ports - 1]     ]

# Take all clock ports and place them center-left

set clock_ports     [dbGet top.terms.name *clk*]
set half_left_idx   [expr [llength $pins_left_half] / 2]

if { $clock_ports != 0 } {
  for {set i 0} {$i < [llength $clock_ports]} {incr i} {
    set pins_left_half \
      [linsert $pins_left_half $half_left_idx [lindex $clock_ports $i]]
  }
}

set FP_width [snap_to_grid [expr 550 + 0] $horiz_pitch ]
set FP_height [snap_to_grid 900 $vert_pitch ]
set block_clearance_x [snap_to_grid 10 $horiz_pitch]
set block_clearance_y [snap_to_grid 10 $vert_pitch]

set place_origin_x [snap_to_grid 150 $horiz_pitch]
set place_origin_y [snap_to_grid 425 $vert_pitch]
set place_blk_y $vert_pitch
set place_blk_x [expr 6 * $horiz_pitch]



# Spread the pins evenly across the left and right sides of the block

set ports_layer {M3}

set pins_left {{rst} {rst_prbs} {inj_error} {CTL_BUF_N[0]} \
    {CTL_BUF_N[1]} {CTL_BUF_N[2]} {CTL_BUF_N[3]} {CTL_BUF_N[4]} \
    {CTL_BUF_N[5]} {CTL_BUF_P[0]} {CTL_BUF_P[1]} {CTL_BUF_P[2]} \
    {CTL_BUF_P[3]} {CTL_BUF_P[4]} {CTL_BUF_P[5]} {osc_en} {aux_osc_en} \
    {inj_en} {fftl_en} {con_perb[0]} {con_perb[1]} {con_perb[2]} {con_perb[3]} \
    {div_ratio_half[0]} {div_ratio_half[1]} {div_ratio_half[2]} {div_ratio_half[3]} \
    {div_ratio_half[4]} {div_ratio_half[5]} {fine_control_avg_window_select[0]} \
    {fine_control_avg_window_select[1]} {fine_control_avg_window_select[2]} \
    {fine_control_avg_window_select[3]} {fine_control_avg_window_select[4]} \
    {fine_con_step_size[0]} {fine_con_step_size[1]} {fine_con_step_size[2]} \
    {fine_con_step_size[3]} {manual_control_osc[0]} {manual_control_osc[1]} \
    {manual_control_osc[2]} {manual_control_osc[3]} {manual_control_osc[4]} \
    {manual_control_osc[5]} {manual_control_osc[6]} {manual_control_osc[7]} \
    {manual_control_osc[8]} {manual_control_osc[9]} {manual_control_osc[10]} \
    {manual_control_osc[11]} {manual_control_osc[12]}}

set pins_top {{pi1_con[0]} {pi1_con[1]} {pi1_con[2]} {pi1_con[3]} \
    {pi2_con[0]} {pi2_con[1]} {pi2_con[2]} {pi2_con[3]} \
    {pi3_con[0]} {pi3_con[1]} {pi3_con[2]} {pi3_con[3]} \

}

set pins_bot    { {test_mux_select[0]} {test_mux_select[1]} {test_mux_select[2]} \
    {test_mux_select[3]} {test_mux_clk_I_select[0]} {test_mux_clk_I_select[1]} \
    {test_mux_clk_Q_select[0]} {test_mux_clk_Q_select[1]} \
    {pi4_con[0]} {pi4_con[1]} {pi4_con[2]} {pi4_con[3]} \
    {pi5_con[0]} {pi5_con[1]} {pi5_con[2]} {pi5_con[3]} \
    }



# editPin -layer $ports_layer -pin ref_ext_p -assign {$FP_width [expr $FP_height - 10.5 * $vert_pitch]} -side RIGHT
# editPin -layer $ports_layer -pin ref_ext_n -assign {$FP_width [expr $FP_height - 15.5 * $vert_pitch]} -side RIGHT
# editPin -layer $ports_layer -pin test_mux_misc -assign {$FP_width [expr $FP_height - 25.5 * $vert_pitch]} -side RIGHT
# editPin -layer $ports_layer -pin test_mux_clk_Q -assign {$FP_width [expr $FP_height - 35.5 * $vert_pitch]} -side RIGHT
# editPin -layer $ports_layer -pin test_mux_clk_Q -assign {$FP_width [expr $FP_height - 45.5 * $vert_pitch]} -side RIGHT


editPin -layer $ports_layer -pin $pins_left  -side LEFT  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_top  -side TOP  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_bot  -side BOTTOM  -spreadType SIDE

set pins_top {{rst} {rst_prbs}}


editPin -layer M3 -pin dout_p -pinWidth 6 -pinDepth 135 -assign {549.00 450.00} -edge 2
editPin -layer M3 -pin dout_n -pinWidth 6 -pinDepth 135 -assign {549.00 405.00} -edge 2
editPin -layer M3 -pin ref_clk_ext_n -pinWidth 4 -pinDepth 20 -assign {549.00 500.00} -edge 2
editPin -layer M3 -pin ref_clk_ext_p -pinWidth 4 -pinDepth 20 -assign {549.00 575.00} -edge 2
editPin -layer M3 -pin test_mux_clk_I -pinWidth 4 -pinDepth 20 -assign {549.00 750.00} -edge 2
editPin -layer M3 -pin test_mux_clk_Q -pinWidth 4 -pinDepth 20 -assign {549.00 800.00} -edge 2
editPin -layer M3 -pin test_mux_misc -pinWidth 4 -pinDepth 20 -assign {549.00 850.00} -edge 2


# Manual fix for pins




