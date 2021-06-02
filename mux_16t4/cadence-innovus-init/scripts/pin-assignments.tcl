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

# Spread the pins evenly across the left and right sides of the block

set ports_layer M4

#editPin -layer $ports_layer -pin $pins_left_half  -side LEFT  -spreadType SIDE
#editPin -layer $ports_layer -pin $pins_right_half -side RIGHT -spreadType SIDE

set pins_top {{rst}}

set pins_right {{dout[0]} {dout[1]} {dout[2]} {dout[3]}}

set pins_left {\
  {din[0]}  {din[1]}  {din[2]}  {din[3]}  {din[4]}  {din[5]}\
  {din[6]}  {din[7]}  {din[8]}  {din[9]}  {din[10]} {din[11]}\
  {din[12]} {din[13]} {din[14]} {din[15]}\
}

set pins_bottom {{clk} {clk_prbs}}

editPin -layer $ports_layer -pin $pins_right  -side RIGHT  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_left   -side LEFT   -spreadType SIDE
editPin -layer $ports_layer -pin $pins_bottom -side BOTTOM -spreadType SIDE
editPin -layer $ports_layer -pin $pins_top    -side TOP    -spreadType SIDE
