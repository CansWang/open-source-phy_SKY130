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

    set vert_pitch  [dbGet top.fPlan.coreSite.size_y]
    set horiz_pitch [dbGet top.fPlan.coreSite.size_x]

    #================
    #test for the vert_pitch
    #================

    puts $vert_pitch
    puts $horiz_pitch


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

set del5_origin [expr (32) * $horiz_pitch]
set del1_origin [expr (79) * $horiz_pitch]
set del4_origin [expr (137) * $horiz_pitch]
set del2_origin [expr (182) * $horiz_pitch]
set del3_origin [expr (224) * $horiz_pitch]

# Spread the pins evenly across the left and right sides of the block

set ports_layer M3

editPin -layer $ports_layer -pin $pins_left_half  -side LEFT  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_right_half -side RIGHT -spreadType SIDE

# set pins_top {{osc_000} {osc_036} {osc_072} {osc_108} {osc_144}}

# set pins_top {{rst}}

# set pins_right {{data}}

# set pins_left {{din[0]} {din[1]} {din[2]} {din[3]}}

# set pins_bottom {{clk_Q} {clk_QB} {clk_I} {clk_IB}}

# editPin -layer $ports_layer -pin $pins_right  -side RIGHT  -spreadType SIDE
# editPin -layer $ports_layer -pin $pins_left   -side LEFT   -spreadType SIDE
# editPin -layer $ports_layer -pin $pins_bottom -side BOTTOM -spreadType SIDE
# editPin -layer $ports_layer -pin $pins_top    -side TOP    -spreadType SIDE

editPin -layer $ports_layer -pin {p5} -assign $del5_origin 106.56
editPin -layer $ports_layer -pin {p1} -assign $del1_origin 106.56
editPin -layer $ports_layer -pin {p4} -assign [expr ($del4_origin + 1)] 106.56
editPin -layer $ports_layer -pin {p2} -assign $del2_origin 106.56
editPin -layer $ports_layer -pin {p3} -assign [expr ($del3_origin + 1)] 106.56
editPin -layer $ports_layer -pin {osc_000} -assign 20.50 106.56
editPin -layer $ports_layer -pin {osc_036} -assign 40.50 106.56
editPin -layer $ports_layer -pin {osc_144} -assign 60.50 106.56
editPin -layer $ports_layer -pin {osc_072} -assign 75.50 106.56
editPin -layer $ports_layer -pin {osc_108} -assign 96.50 106.56