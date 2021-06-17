    #=========================================================================
    # floorplan.tcl
    #=========================================================================
    # Author : Christopher Torng
    # Date   : March 26, 2018

    #-------------------------------------------------------------------------
    # Floorplan variables
    #-------------------------------------------------------------------------

    proc snap_to_grid {input granularity} {
       set new_value [expr ceil($input / $granularity) * $granularity]
       return $new_value
    }

    # Set the floorplan to target a reasonable placement density with a good
    # aspect ratio (height:width). An aspect ratio of 2.0 here will make a
    # rectangular chip with a height that is twice the width.

    set core_aspect_ratio   1.00; # Aspect ratio 1.0 for a square chip
    set core_density_target 0.70; # Placement density of 70% is reasonable

    set vert_pitch  [dbGet top.fPlan.coreSite.size_y]
    set horiz_pitch [dbGet top.fPlan.coreSite.size_x]

    set blk_width 3

    #================
    #test for the vert_pitch
    #================

    puts $vert_pitch
    puts $horiz_pitch



    set bottom_y [snap_to_grid 100 $vert_pitch]

    # Read dimension from lef file

    set qr_mux_height [dbGet [lindex [dbGet -p top.insts.name qr_mux_4t1_0] 0].cell.size_y]
    set qr_mux_width [dbGet [lindex [dbGet -p top.insts.name qr_mux_4t1_0] 0].cell.size_x]

    set hr_mux_height [dbGet [lindex [dbGet -p top.insts.name hr_mux_16t4_0] 0].cell.size_y]
    set hr_mux_width [dbGet [lindex [dbGet -p top.insts.name hr_mux_16t4_0] 0].cell.size_x]

    set prbs_gen_height [dbGet [lindex [dbGet -p top.insts.name genblk1_15__prbs_b] 0].cell.size_y]
    set prbs_gen_width [dbGet [lindex [dbGet -p top.insts.name genblk1_15__prbs_b] 0].cell.size_x]

    set osc_core_height [dbGet [lindex [dbGet -p top.insts.name osc_inst] 0].cell.size_y]
    set osc_core_width [dbGet [lindex [dbGet -p top.insts.name osc_inst] 0].cell.size_x]

    set ftl_height [dbGet [lindex [dbGet -p top.insts.name ftl] 0].cell.size_y]
    set ftl_width [dbGet [lindex [dbGet -p top.insts.name ftl] 0].cell.size_x]




    # Make room in the floorplan for the core power ring


    set_db [get_db nets ext_clk_async*] .skip_routing true
    set_db [get_db nets ext_mdll_clk_mon*] .skip_routing true
    set pwr_net_list  {CVDD CVSS AVDD AVSS DVDD DVSS}; # List of power nets in the core power ring

    set M1_min_width   [dbGet [dbGetLayerByZ 1].minWidth]
    set M1_min_spacing [dbGet [dbGetLayerByZ 1].minSpacing]

    set savedvars(p_ring_width)   [expr 48 * $M1_min_width];   # Arbitrary!
    set savedvars(p_ring_spacing) [expr 24 * $M1_min_spacing]; # Arbitrary!

    # Core bounding box margins
    # Set in Geom-Vars File
    set core_margin_t 0;#$vert_pitch
    set core_margin_b 0;#$vert_pitch
    set core_margin_r 0;#[expr 5 * $horiz_pitch]
    set core_margin_l 0;#[expr 5 * $horiz_pitch]


    #-------------------------------------------------------------------------
    # Floorplan
    #-------------------------------------------------------------------------

    # Calling floorPlan with the "-r" flag sizes the floorplan according to
    # the core aspect ratio and a density target (70% is a reasonable
    # density).
    #

    #floorPlan -r $core_aspect_ratio $core_density_target \
    #             $core_margin_l $core_margin_b $core_margin_r $core_margin_t


    set FP_width [snap_to_grid [expr 550 + 0] $horiz_pitch ]
    set FP_height [snap_to_grid 900 $vert_pitch ]


    #floorPlan -site unithd -s $FP_width $FP_height \
                            $core_margin_l $core_margin_b $core_margin_r $core_margin_t
    floorPlan -site unit -s $FP_width $FP_height 0 0 0 0

    setFlipping s

    #set origin_acore_x    [snap_to_grid [expr $FP_width/2 - $acore_width/2] $horiz_pitch ]
    #set origin_acore_y    [expr $sram_height + $sram_to_acore_spacing_y ]

    #set origin_ref_x [expr $FP_width - 6*$blockage_width - $input_buffer_width - $core_margin_l]
    #set origin_ref_y [expr $origin_out_y + $output_buffer_height + $blockage_height + 10*$vert_pitch]


# Use automatic floorplan synthesis to pack macros (e.g., SRAMs) together

set block_clearance_x [snap_to_grid 10 $horiz_pitch]
set block_clearance_y [snap_to_grid 10 $vert_pitch]

set place_origin_x [snap_to_grid 150 $horiz_pitch]
set place_origin_y [snap_to_grid 425 $vert_pitch]
set place_blk_y $vert_pitch
set place_blk_x [expr 6 * $horiz_pitch]



    ###################
    # Place Instances #
    ###################

placeInstance \
  ftl \
  $place_origin_x \
  $place_origin_y \

placeInstance \
  osc_inst \
  $place_origin_x \
  [expr $place_origin_y - $block_clearance_y -$place_blk_y - $osc_core_height] 

set osc_inst_origin_y [expr $place_origin_y - $block_clearance_y -$place_blk_y - $osc_core_height]

placeInstance \
  hr_mux_16t4_0 \
  [expr $place_origin_x + ((1) * $prbs_gen_width) + (2 * (1) * $place_blk_x) + ((1) * $block_clearance_x) + $horiz_pitch ] \
  [expr $place_origin_y + $ftl_height + (2 * $place_blk_y) + $block_clearance_y - $vert_pitch]

placeInstance \
  qr_mux_4t1_0 \
  [expr $place_origin_x + ((2) * $prbs_gen_width) + (2 * (2) * $place_blk_x) + ((2) * $block_clearance_x) + $horiz_pitch ] \
  [expr $place_origin_y + $ftl_height + (2 * $place_blk_y) + $block_clearance_y - $vert_pitch]

placeInstance \
  hr_mux_16t4_1 \
  [expr $place_origin_x + ((1) * $prbs_gen_width) + (2 * (1) * $place_blk_x) + ((1) * $block_clearance_x) + $horiz_pitch ] \
  [expr $place_origin_y - $osc_core_height - (4 * $place_blk_y) - (2 * $block_clearance_y) - $hr_mux_height  - $vert_pitch]

placeInstance \
  qr_mux_4t1_1 \
  [expr $place_origin_x + ((2) * $prbs_gen_width) + (2 * (2) * $place_blk_x) + ((2) * $block_clearance_x) + $horiz_pitch ] \
  [expr $place_origin_y - $osc_core_height - (4 * $place_blk_y) - (2 * $block_clearance_y) - $hr_mux_height  - $vert_pitch]


for {set i 0} {$i < 3} {incr i} {
  placeInstance \
    genblk1_$i\__prbs_b \
    [expr $place_origin_x + (($i) * $prbs_gen_width) + (2 * ($i) * $place_blk_x) + (($i) * $block_clearance_x) + $horiz_pitch ] \
    [expr $place_origin_y + $hr_mux_height + $ftl_height + (4 * $place_blk_y) + (2 * $block_clearance_y) - $vert_pitch]
}

for {set i 3} {$i < 6} {incr i} {
  placeInstance \
    genblk1_$i\__prbs_b \
    [expr $place_origin_x + (($i-3) * $prbs_gen_width) + (2 * ($i-3) * $place_blk_x) + (($i-3) * $block_clearance_x) + $horiz_pitch ] \
    [expr $place_origin_y + $prbs_gen_height +$hr_mux_height + $ftl_height + (6 * $place_blk_y) + (3 * $block_clearance_y) - $vert_pitch]
}

for {set i 6} {$i < 10} {incr i} {
  placeInstance \
    genblk1_$i\__prbs_b \
    [expr $place_origin_x - ($prbs_gen_width) - (2 * $place_blk_x) - ($block_clearance_x) ] \
    [expr $place_origin_y + ((7 - $i) * $prbs_gen_height) + (2 * (7 - $i) * $place_blk_y) + ((7 - $i) * $block_clearance_y)]
}

for {set i 10} {$i < 13} {incr i} {
  placeInstance \
    genblk1_$i\__prbs_b \
    [expr $place_origin_x + (($i - 10) * $prbs_gen_width) + (2 * ($i - 10) * $place_blk_x) + (($i - 10) * $block_clearance_x) + $horiz_pitch ] \
    [expr ($place_origin_y - $prbs_gen_height - $osc_core_height - (6 * $place_blk_y) - (3 * $block_clearance_y) - $hr_mux_height) - $vert_pitch]
}

for {set i 13} {$i < 16} {incr i} {
  placeInstance \
    genblk1_$i\__prbs_b \
    [expr $place_origin_x + (($i - 13) * $prbs_gen_width) + (2 * ($i - 13) * $place_blk_x) + (($i - 13) * $block_clearance_x) + $horiz_pitch ] \
    [expr ($place_origin_y - (2 * $prbs_gen_height) - $osc_core_height - (8 * $place_blk_y) - (4 * $block_clearance_y) - $hr_mux_height) - $vert_pitch]
}


set tri_buf_width [expr 7 * $horiz_pitch]



set pos_tri_buf_x [snap_to_grid 350 $horiz_pitch]
set pos_tri_buf_y [expr ($place_origin_y + 3 * $vert_pitch)]


  for {set i 0} {$i < 6} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + ($i * 2 * $tri_buf_width))] \
      $pos_tri_buf_y

  }

  for {set i 6} {$i < 12} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + (($i - 6) * 2 * $tri_buf_width))] \
      [expr $pos_tri_buf_y + (2 * $vert_pitch)]
  
  }

  for {set i 12} {$i < 18} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + (($i - 12) * 2 * $tri_buf_width))] \
      [expr $pos_tri_buf_y + (4 * $vert_pitch)]
  
  }

  for {set i 18} {$i < 24} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + (($i - 18) * 2 * $tri_buf_width))] \
      [expr $pos_tri_buf_y + (6 * $vert_pitch)]
  
  }

  for {set i 24} {$i < 30} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + (($i - 24) * 2 * $tri_buf_width))] \
      [expr $pos_tri_buf_y + (8 * $vert_pitch)]
  
  }

  for {set i 30} {$i < 36} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + (($i - 30) * 2 * $tri_buf_width))] \
      [expr $pos_tri_buf_y + (10 * $vert_pitch)]
  
  }

  for {set i 36} {$i < 40} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_p \
      [expr ($pos_tri_buf_x + (($i - 36) * 2 * $tri_buf_width))] \
      [expr $pos_tri_buf_y + (12 * $vert_pitch)]
  
  }

set neg_tri_buf_x [snap_to_grid 330 $horiz_pitch]
set neg_tri_buf_y [expr ($place_origin_y - 3 * $vert_pitch)]

  for {set i 0} {$i < 6} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + ($i * 2 * $tri_buf_width))] \
      $neg_tri_buf_y

  }

  for {set i 6} {$i < 12} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + (($i - 6) * 2 * $tri_buf_width))] \
      [expr $neg_tri_buf_y - (2 * $vert_pitch)]

  }

  for {set i 12} {$i < 18} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + (($i - 12) * 2 * $tri_buf_width))] \
      [expr $neg_tri_buf_y - (4 * $vert_pitch)]

  }

  for {set i 18} {$i < 24} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + (($i - 18) * 2 * $tri_buf_width))] \
      [expr $neg_tri_buf_y - (6 * $vert_pitch)]

  }

  for {set i 24} {$i < 30} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + (($i - 24) * 2 * $tri_buf_width))] \
      [expr $neg_tri_buf_y - (8 * $vert_pitch)]

  }

  for {set i 30} {$i < 36} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + (($i - 30) * 2 * $tri_buf_width))] \
      [expr $neg_tri_buf_y - (10 * $vert_pitch)]

  }

  for {set i 36} {$i < 40} {incr i} {
    placeInstance \
      ibuf_genblk1_$i\__i_tri_buf_n \
      [expr ($pos_tri_buf_x + (($i - 36) * 2 * $tri_buf_width))] \
      [expr $neg_tri_buf_y - (12 * $vert_pitch)]

  }    


# placeInstance \
#   hr_mux_16t4_0 \
#   [expr $hr_0_x]  \
#   [expr $hr_0_y] \

# set hr_1_x [expr 62*$pg_hori_pitch - $x_offset]
# set hr_1_y [expr [snap_to_grid 250 $vert_pitch] - $y_offset]
# placeInstance \
#   hr_mux_16t4_1 \
#   [expr $hr_1_x]  \
#   [expr $hr_1_y] \

# set qr_0_x [expr 84*$pg_hori_pitch - $x_offset]
# set qr_0_y [expr [snap_to_grid 170 $vert_pitch] - $y_offset]
# placeInstance \
#   qr_mux_4t1_0 \
#   [expr $qr_0_x]  \
#   [expr $qr_0_y] \

# set qr_1_x [expr 84*$pg_hori_pitch - $x_offset]
# set qr_1_y [expr [snap_to_grid 250 $vert_pitch] - $y_offset]
# placeInstance \
#   qr_mux_4t1_1 \
#   [expr $qr_1_x]  \
#   [expr $qr_1_y] \

# set osc_core_x [expr ]
# set osc_core_y [expr ]




#   createPlaceBlockage -box  \
#     [expr [snap_to_grid 10 $horiz_pitch] - $blk_width] \
#     [expr [snap_to_grid [expr ($i-4) * 80 + 10] $vert_pitch] - $blk_width] \
#     [expr [snap_to_grid 10 $horiz_pitch] + 70 + $blk_width] \
#     [expr [snap_to_grid [expr ($i-4) * 80 + 10] $vert_pitch] + 70 + $blk_width]
# }

# for {set i 8} {$i < 10} {incr i} {
#   placeInstance \
#     genblk1_$i\__prbs_b \
#     [snap_to_grid 170 $horiz_pitch]  \
#     [snap_to_grid [expr ($i-8) * 80 + 10] $vert_pitch] \

#   createPlaceBlockage -box  \
#     [expr [snap_to_grid 170 $horiz_pitch] - $blk_width] \
#     [expr [snap_to_grid [expr ($i-8) * 80 + 10] $vert_pitch] - $blk_width] \
#     [expr [snap_to_grid 170 $horiz_pitch] + 70 + $blk_width] \
#     [expr [snap_to_grid [expr ($i-8) * 80 + 10] $vert_pitch] + 70 + $blk_width]
# }

# for {set i 10} {$i < 12} {incr i} {
#   placeInstance \
#     genblk1_$i\__prbs_b \
#     [snap_to_grid 170 $horiz_pitch]  \
#     [snap_to_grid [expr ($i-6) * 80 + 10] $vert_pitch] \

#   createPlaceBlockage -box  \
#     [expr [snap_to_grid 170 $horiz_pitch] - $blk_width] \
#     [expr [snap_to_grid [expr ($i-6) * 80 + 10] $vert_pitch] - $blk_width] \
#     [expr [snap_to_grid 170 $horiz_pitch] + 70 + $blk_width] \
#     [expr [snap_to_grid [expr ($i-6) * 80 + 10] $vert_pitch] + 70 + $blk_width]
# }

# for {set i 12} {$i < 14} {incr i} {
#   placeInstance \
#     genblk1_$i\__prbs_b \
#     [snap_to_grid 250 $horiz_pitch]  \
#     [snap_to_grid [expr ($i-12) * 80 + 10] $vert_pitch] \

#   createPlaceBlockage -box  \
#     [expr [snap_to_grid 250 $horiz_pitch] - $blk_width] \
#     [expr [snap_to_grid [expr ($i-12) * 80 + 10] $vert_pitch] - $blk_width] \
#     [expr [snap_to_grid 250 $horiz_pitch] + 70 + $blk_width] \
#     [expr [snap_to_grid [expr ($i-12) * 80 + 10] $vert_pitch] + 70 + $blk_width]
# }

# for {set i 14} {$i < 16} {incr i} {
#   placeInstance \
#     genblk1_$i\__prbs_b \
#     [snap_to_grid 250 $horiz_pitch]  \
#     [snap_to_grid [expr ($i-10) * 80 + 10] $vert_pitch] \

#   createPlaceBlockage -box  \
#     [expr [snap_to_grid 250 $horiz_pitch] - $blk_width] \
#     [expr [snap_to_grid [expr ($i-10) * 80 + 10] $vert_pitch] - $blk_width] \
#     [expr [snap_to_grid 250 $horiz_pitch] + 70 + $blk_width] \
#     [expr [snap_to_grid [expr ($i-10) * 80 + 10] $vert_pitch] + 70 + $blk_width]
# }

# createPlaceBlockage -box  \
#   [expr $hr_0_x - $blk_width] \
#   [expr $hr_0_y - $blk_width] \
#   [expr $hr_0_x + $hr_mux_width + $blk_width] \
#   [expr $hr_0_y + $hr_mux_height + $blk_width]

# createPlaceBlockage -box  \
#   [expr $hr_1_x - $blk_width] \
#   [expr $hr_1_y - $blk_width] \
#   [expr $hr_1_x + $hr_mux_width + $blk_width] \
#   [expr $hr_1_y + $hr_mux_height + $blk_width]

# createPlaceBlockage -box  \
#   [expr $qr_0_x - $blk_width] \
#   [expr $qr_0_y - $blk_width] \
#   [expr $qr_0_x + $qr_mux_width + $blk_width] \
#   [expr $qr_0_y + $qr_mux_height + $blk_width]

# createPlaceBlockage -box  \
#   [expr $qr_1_x - $blk_width] \
#   [expr $qr_1_y - $blk_width] \
#   [expr $qr_1_x + $qr_mux_width + $blk_width] \
#   [expr $qr_1_y + $qr_mux_height + $blk_width]

    ###################
    # Place Blockages #
    ###################

    #rotated by 90
    #createPlaceBlockage -box  \
        [expr $origin_txindiv_x -$blockage_width] \
        [expr $origin_txindiv_y -$blockage_height] \
        [expr $origin_txindiv_x + $indiv_width + $blockage_width] \
        [expr $origin_txindiv_y + $indiv_height + $blockage_height]

	#PI Blockages
    #for {set k 0} {$k<4} {incr k} {
    	#createPlaceBlockage -box \
        	[expr $origin_txpi_x - $blockage_width]   \
        	[expr $origin_txpi_y - $blockage_height + ($pi_neighbor_spacing)*($k-1)]\
        	[expr $origin_txpi_x + $pi_width + $blockage_width]  \
        	[expr $origin_txpi_y + ($pi_height)*(1) + ($pi_neighbor_spacing)*($k-1) + $blockage_height]
  #  }


   #createPlaceBlockage -box \
        [expr $origin_out_x - $blockage_width] \
        [expr $origin_out_y - $blockage_height] \
        [expr $origin_out_x + $output_buffer_width  + $blockage_width] \
        [expr $origin_out_y + $output_buffer_height + $blockage_height]

    #createInstGroup test -region
    #addInstToInstGroup test {qr_mux_4t1_0 qr_mux_4t1_1}
    #createRegion test 35 107 72 145


# Avoid cells to be put into AVDD/AVSS

  createPlaceBlockage -box \
    [expr $place_origin_x - (2 * $place_blk_x) - $horiz_pitch] \
    [expr $osc_inst_origin_y - $place_blk_y ] \
    [expr $place_origin_x + (2 * $place_blk_x) + $osc_core_width] \
    [expr $osc_inst_origin_y + $place_blk_y + $osc_core_height] \
    -name osc_place_blk


