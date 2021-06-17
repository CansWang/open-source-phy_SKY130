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

set ports_layer M3

#editPin -layer $ports_layer -pin $pins_left_half  -side LEFT  -spreadType SIDE
#editPin -layer $ports_layer -pin $pins_right_half -side RIGHT -spreadType SIDE

set pins_top {\
  {eqn[0]} {eqn[1]} {eqn[2]} {eqn[3]} {eqn[4]} {eqn[5]}\
  {eqn[6]} {eqn[7]} {eqn[8]} {eqn[9]} {eqn[10]} {eqn[11]}\
  {eqn[12]} {eqn[13]} 
}

set pins_right {{eqn[14]} {eqn[15]} {eqn[16]} {eqn[17]}\
  {eqn[18]} {eqn[19]} {eqn[20]} {eqn[21]} {eqn[22]} {eqn[23]}\
  {eqn[24]} {eqn[25]} {eqn[26]}  {out} {eqn[27]} {eqn[28]} {eqn[29]}\
  {eqn[30]} {eqn[31]} {rst} {cke} {inj_err} {inv_chicken[0]} {inv_chicken[1]}\
}

set pins_left {\
  {init_val[0]} {init_val[1]} {init_val[2]} {init_val[3]} {init_val[4]} {init_val[5]}\
  {init_val[6]} {init_val[7]} {init_val[8]} {init_val[9]} {init_val[10]} {init_val[11]}\
  {init_val[12]} {init_val[13]} 
}

set pins_bottom {{init_val[14]} {init_val[15]} {init_val[16]} {init_val[17]}\
  {init_val[18]} {init_val[19]} {init_val[20]} {init_val[21]} {init_val[22]} {init_val[23]}\
  {init_val[24]} {init_val[25]} {init_val[26]} {init_val[27]} {init_val[28]} {init_val[29]}\
  {init_val[30]} {init_val[31]} {clk}
  }



editPin -layer M4 -pin $pins_right  -side RIGHT  -spreadType SIDE
editPin -layer M4 -pin $pins_left   -side LEFT   -spreadType SIDE
editPin -layer $ports_layer -pin $pins_bottom -side BOTTOM -spreadType SIDE
editPin -layer $ports_layer -pin $pins_top    -side TOP    -spreadType SIDE
