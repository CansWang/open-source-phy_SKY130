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

    #================
    #test for the vert_pitch
    #================

    puts $vert_pitch
    puts $horiz_pitch



    set bottom_y [snap_to_grid 100 $vert_pitch]

    set pi_width [dbGet [lindex [dbGet -p top.insts.name *iPI*] 0].cell.size_x]
    set pi_height [dbGet [lindex [dbGet -p top.insts.name *iPI*] 0].cell.size_y]

    set indiv_width [dbGet [dbGet -p top.insts.name *indiv*].cell.size_x]
    set indiv_height [dbGet [dbGet -p top.insts.name *indiv*].cell.size_y]

    set tri_height [dbGet [dbGet -p top.insts.name *iBUF_0__i_tri_buf_p*].cell.size_y]
    set tri_width [dbGet [dbGet -p top.insts.name *iBUF_0__i_tri_buf_p*].cell.size_x]

    set term_height [dbGet [lindex [dbGet -p top.insts.name buf1/i_term_p] 0].cell.size_y]
    # set term_height [dbGet [lindex [dbGet -p top.insts.name itx/buf1/i_term_p] 0].cell.size_y]
    set term_width [dbGet [lindex [dbGet -p top.insts.name buf1/i_term_p] 0].cell.size_x]

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


    set FP_width [snap_to_grid [expr 140 + 0] $horiz_pitch ]
    set FP_height [snap_to_grid 101 $vert_pitch ]


    #floorPlan -site unithd -s $FP_width $FP_height \
                            $core_margin_l $core_margin_b $core_margin_r $core_margin_t
    floorPlan -site unit -s $FP_width $FP_height 0 0 0 0

    setFlipping s

    set sram_to_acore_spacing_x [snap_to_grid 40 $horiz_pitch]
    set sram_to_acore_spacing_y [snap_to_grid 40 $vert_pitch]

    set sram_to_buff_spacing_y [snap_to_grid 30 $vert_pitch]

    set sram_to_sram_spacing  [snap_to_grid 30 $horiz_pitch]
    set sram_neighbor_spacing [expr $sram_width + $sram_to_sram_spacing]
    set sram_pair_spacing [expr 2*$sram_width + $sram_to_sram_spacing]
    set sram_vert_spacing [snap_to_grid 200 $vert_pitch]

    set pi_to_pi_spacing    [snap_to_grid 10 $vert_pitch]
    set pi_neighbor_spacing [expr $pi_height + $pi_to_pi_spacing]
    set pi_neighbor_spacing_vertical [expr $pi_height + $pi_to_pi_spacing]
    #set origin_acore_x    [snap_to_grid [expr $FP_width/2 - $acore_width/2] $horiz_pitch ]
    #set origin_acore_y    [expr $sram_height + $sram_to_acore_spacing_y ]
    puts $pi_to_pi_spacing
    puts $pi_neighbor_spacing



    set origin_acore_x    [expr 199.98]
    set origin_acore_y    [expr 399.744 - $bottom_y]

    set origin_txindiv_x [expr [snap_to_grid 300 $horiz_pitch]]
    set origin_txindiv_y [expr [snap_to_grid 200 $vert_pitch]]

#    set origin_sram_ffe_x [expr $origin_acore_x + $acore_width + 100 + 15*$blockage_width  + $core_margin_l]
#    set origin_sram_ffe_y [expr 6*$blockage_height + $core_margin_b]

#    set origin_sram_ffe_y2 [expr $FP_height - 6*$blockage_height - $core_margin_t -$sram_height ]

    #set origin_sram_adc_x [expr $origin_sram_ffe_x + $sram_pair_spacing]
#    set origin_sram_adc_x [expr $origin_sram_ffe_x]
#    set origin_sram_adc_y [expr 6*$blockage_height + $core_margin_b]
#    set origin_sram_adc_y2 [expr $FP_height - 6*$blockage_height - $core_margin_t -$sram_height]

    #set origin_async_x [expr 3*$blockage_width  + $core_margin_l]
    #set origin_async_y [expr $origin_sram_ffe_y + $sram_height +  $sram_to_buff_spacing_y]

    set origin_async_x [expr 43.56]
    set origin_async_y [expr 312.192 -$bottom_y]
    #set origin_out_x [expr $FP_width - 6*$blockage_width - $output_buffer_width - $core_margin_l]
    #set origin_out_y [expr $origin_sram_adc_y + $sram_height + $sram_to_acore_spacing_y - 4 * $vert_pitch]

    set origin_out_x [expr 555.3]
    set origin_out_y [expr 139.968 -$bottom_y]
    #set origin_main_x [expr $origin_acore_x + [snap_to_grid [expr $acore_width/2] $horiz_pitch]]
    #set origin_main_y [expr [snap_to_grid [expr $sram_height / 2.0] $vert_pitch] + $origin_sram_adc_y]

    set origin_main_x [expr 373.77 ]
    set origin_main_y [expr 312.192 -$bottom_y]
    #set origin_mdll_x [expr $origin_out_x - $mdll_width - [snap_to_grid 60 $horiz_pitch]]
    #set origin_mdll_y [expr $origin_acore_y + [snap_to_grid [expr $acore_height/4] $vert_pitch ]  ]

    set origin_mdll_x [expr 462.51]
    set origin_mdll_y [expr 301.824 - $bottom_y]

    set origin_mon_x [expr 566.82]
    set origin_mon_y [expr 184.32 - $bottom_y]

    set origin_ref_x [expr 504.09]
    set origin_ref_y [expr 184.32 - $bottom_y]

    set origin_txpi_x  [snap_to_grid 100 $horiz_pitch]
    set txpi_x_spacing [snap_to_grid [expr $pi_width + 30] $horiz_pitch]
    set origin_txpi_y  [snap_to_grid 75 $vert_pitch]
    set txpi_y_spacing [snap_to_grid [expr $pi_height + 30] $vert_pitch]
    puts $origin_txpi_y
    puts $txpi_y_spacing

	set origin_term_n_x [snap_to_grid 15 $horiz_pitch]
	set origin_term_n_y [snap_to_grid 90 $vert_pitch]
	set origin_term_p_x [snap_to_grid 15 $horiz_pitch]
	set origin_term_p_y [snap_to_grid 161 $vert_pitch]

    puts $origin_term_n_x
    puts $origin_term_n_y
    puts $origin_term_p_x
    puts $origin_term_p_y

    #set origin_ref_x [expr $FP_width - 6*$blockage_width - $input_buffer_width - $core_margin_l]
    #set origin_ref_y [expr $origin_out_y + $output_buffer_height + $blockage_height + 10*$vert_pitch]


# Use automatic floorplan synthesis to pack macros (e.g., SRAMs) together

    ###################
    # Place Instances #
    ###################

#	placeInstance \
        buf1/i_term_n \
        $origin_term_n_x \
        $origin_term_n_y

#	placeInstance \
        buf1/i_term_p \
        $origin_term_p_x \
        $origin_term_p_y

#    for {set k 0} {$k<6} {incr k} {
 #       for {set j 0} {$j<6} {incr j} {
#            placeInstance \
#                buf1/iBUF_[expr ($j) + ($k)*6]\__i_tri_buf_p/tri_buf \
#                [snap_to_grid [expr 39 + ($k) * ($tri_width*3)] $horiz_pitch]\
 #               [snap_to_grid [expr 134 + ($j) * ($tri_height*3)] $vert_pitch]
 #       }
 #   }

#    for {set k 0} {$k<6} {incr k} {
#        for {set j 0} {$j<6} {incr j} {
#            placeInstance \
#                buf1/iBUF_[expr ($j) + ($k)*6]\__i_tri_buf_n/tri_buf \
#                [snap_to_grid [expr 39 + ($k) * ($tri_width*3)] $horiz_pitch] \
#                [snap_to_grid [expr 110 + ($j) * ($tri_height*3)] $vert_pitch]
#        }
#    }

    #PI Macros
    #
    #
 #   for {set k 0} {$k<4} {incr k} {
 #       placeInstance \
 #       iPI_$k\__iPI \
 #           $origin_txpi_x \
 #           [expr $origin_txpi_y + ($pi_neighbor_spacing)*($k-1)]
 #   }


 #   placeInstance \
 #   indiv \
 #      [snap_to_grid [expr $origin_txpi_x + $pi_width + 20] $horiz_pitch] \
 #       [expr $origin_txpi_y + ($pi_neighbor_spacing)] \
 #            MX
# delaycell origin
set del5_origin [expr (32) * $horiz_pitch]
set del1_origin [expr (69) * $horiz_pitch]
set del4_origin [expr (107) * $horiz_pitch]
set del2_origin [expr (142) * $horiz_pitch]
set del3_origin [expr (181) * $horiz_pitch]
# placement for delay cells

    for {set j 0} {$j < 5} {incr j} {
    
    placeInstance \
      del5/genblk1_$j\__inand \
      $del5_origin \
      [expr (19 + $j) * $vert_pitch] \
    }

    for {set j 0} {$j < 5} {incr j} {
    
    placeInstance \
      del1/genblk1_$j\__inand \
      $del1_origin \
      [expr (19 + $j) * $vert_pitch] \
    }

    for {set j 0} {$j < 5} {incr j} {

    placeInstance \
      del4/genblk1_$j\__inand \
      $del4_origin \
      [expr (19 + $j) * $vert_pitch] \
    }

    for {set j 0} {$j < 5} {incr j} {

    placeInstance \
      del2/genblk1_$j\__inand \
      $del2_origin \
      [expr (19 + $j) * $vert_pitch] \
    }


    for {set j 0} {$j < 5} {incr j} {
    
    placeInstance \
      del3/genblk1_$j\__inand \
      $del3_origin \
      [expr (19 + $j) * $vert_pitch] \
    }

puts $horiz_pitch
puts $vert_pitch



# placement for varactor, del5
placeInstance \
    capbank5_fc1 \
    [expr ($del5_origin - (3) * $horiz_pitch)] \
    [expr (19 + 4) * $vert_pitch] \


placeInstance \
    capbank5_fc2 \
    [expr ($del5_origin - (5) * $horiz_pitch)] \
    [expr (19 + 3) * $vert_pitch] \


placeInstance \
    capbank5_fc3_0 \
    [expr ($del5_origin - (5) * $horiz_pitch)] \
    [expr (19 + 2) * $vert_pitch] \


placeInstance \
    capbank5_fc3_1 \
    [expr ($del5_origin - (5) * $horiz_pitch)] \
    [expr (19 + 1) * $vert_pitch] \

for {set j 0} {$j < 4} {incr j} {
    
    placeInstance \
      capbank5_fc4_$j \
      [expr ($del5_origin - (5) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

    placeInstance \
      capbank5_fc44_$j \
      [expr ($del5_origin - (0) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank5_fc5_$j \
      [expr ($del5_origin + (5) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank5_fc6_$j \
      [expr ($del5_origin - (5) * $horiz_pitch)] \
      [expr (14 - $j) * $vert_pitch] \

    placeInstance \
      capbank5_fc7_$j \
      [expr ($del5_origin + (5) * $horiz_pitch)] \
      [expr (15 - $j) * $vert_pitch] \

    placeInstance \
      capbank5_fc8_$j \
      [expr ($del5_origin - (14) * $horiz_pitch)] \
      [expr (19 + $j) * $vert_pitch] \

}

# placement for varactor, del1
placeInstance \
    capbank1_fc1 \
    [expr ($del1_origin - (3) * $horiz_pitch)] \
    [expr (19 + 4) * $vert_pitch] \


placeInstance \
    capbank1_fc2 \
    [expr ($del1_origin - (5) * $horiz_pitch)] \
    [expr (19 + 3) * $vert_pitch] \


placeInstance \
    capbank1_fc3_0 \
    [expr ($del1_origin - (5) * $horiz_pitch)] \
    [expr (19 + 2) * $vert_pitch] \


placeInstance \
    capbank1_fc3_1 \
    [expr ($del1_origin - (5) * $horiz_pitch)] \
    [expr (19 + 1) * $vert_pitch] \

for {set j 0} {$j < 4} {incr j} {
    
    placeInstance \
      capbank1_fc4_$j \
      [expr ($del1_origin - (5) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

    placeInstance \
      capbank1_fc44_$j \
      [expr ($del1_origin - (0) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank1_fc5_$j \
      [expr ($del1_origin + (5) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank1_fc6_$j \
      [expr ($del1_origin - (5) * $horiz_pitch)] \
      [expr (14 - $j) * $vert_pitch] \

    placeInstance \
      capbank1_fc7_$j \
      [expr ($del1_origin + (5) * $horiz_pitch)] \
      [expr (15 - $j) * $vert_pitch] \

    placeInstance \
      capbank1_fc8_$j \
      [expr ($del1_origin - (14) * $horiz_pitch)] \
      [expr (19 + $j) * $vert_pitch] \

}

# placement for varactor, del4
placeInstance \
    capbank4_fc1 \
    [expr ($del4_origin - (3) * $horiz_pitch)] \
    [expr (19 + 4) * $vert_pitch] \


placeInstance \
    capbank4_fc2 \
    [expr ($del4_origin - (5) * $horiz_pitch)] \
    [expr (19 + 3) * $vert_pitch] \


placeInstance \
    capbank4_fc3_0 \
    [expr ($del4_origin - (5) * $horiz_pitch)] \
    [expr (19 + 2) * $vert_pitch] \


placeInstance \
    capbank4_fc3_1 \
    [expr ($del4_origin - (5) * $horiz_pitch)] \
    [expr (19 + 1) * $vert_pitch] \

for {set j 0} {$j < 4} {incr j} {
    
    placeInstance \
      capbank4_fc4_$j \
      [expr ($del4_origin - (5) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

    placeInstance \
      capbank4_fc44_$j \
      [expr ($del4_origin - (0) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank4_fc5_$j \
      [expr ($del4_origin + (5) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank4_fc6_$j \
      [expr ($del4_origin - (5) * $horiz_pitch)] \
      [expr (14 - $j) * $vert_pitch] \

    placeInstance \
      capbank4_fc7_$j \
      [expr ($del4_origin + (5) * $horiz_pitch)] \
      [expr (15 - $j) * $vert_pitch] \

    placeInstance \
      capbank4_fc8_$j \
      [expr ($del4_origin - (14) * $horiz_pitch)] \
      [expr (19 + $j) * $vert_pitch] \

}

# placement for varactor, del2
placeInstance \
    capbank2_fc1 \
    [expr ($del2_origin - (3) * $horiz_pitch)] \
    [expr (19 + 4) * $vert_pitch] \


placeInstance \
    capbank2_fc2 \
    [expr ($del2_origin - (5) * $horiz_pitch)] \
    [expr (19 + 3) * $vert_pitch] \


placeInstance \
    capbank2_fc3_0 \
    [expr ($del2_origin - (5) * $horiz_pitch)] \
    [expr (19 + 2) * $vert_pitch] \


placeInstance \
    capbank2_fc3_1 \
    [expr ($del2_origin - (5) * $horiz_pitch)] \
    [expr (19 + 1) * $vert_pitch] \

for {set j 0} {$j < 4} {incr j} {
    
    placeInstance \
      capbank2_fc4_$j \
      [expr ($del2_origin - (5) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

    placeInstance \
      capbank2_fc44_$j \
      [expr ($del2_origin - (0) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank2_fc5_$j \
      [expr ($del2_origin + (5) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank2_fc6_$j \
      [expr ($del2_origin - (5) * $horiz_pitch)] \
      [expr (14 - $j) * $vert_pitch] \

    placeInstance \
      capbank2_fc7_$j \
      [expr ($del2_origin + (5) * $horiz_pitch)] \
      [expr (15 - $j) * $vert_pitch] \

    placeInstance \
      capbank2_fc8_$j \
      [expr ($del2_origin - (14) * $horiz_pitch)] \
      [expr (19 + $j) * $vert_pitch] \

}

# placement for varactor, del3
placeInstance \
    capbank3_fc1 \
    [expr ($del3_origin - (3) * $horiz_pitch)] \
    [expr (19 + 4) * $vert_pitch] \


placeInstance \
    capbank3_fc2 \
    [expr ($del3_origin - (5) * $horiz_pitch)] \
    [expr (19 + 3) * $vert_pitch] \


placeInstance \
    capbank3_fc3_0 \
    [expr ($del3_origin - (5) * $horiz_pitch)] \
    [expr (19 + 2) * $vert_pitch] \


placeInstance \
    capbank3_fc3_1 \
    [expr ($del3_origin - (5) * $horiz_pitch)] \
    [expr (19 + 1) * $vert_pitch] \

for {set j 0} {$j < 4} {incr j} {
    
    placeInstance \
      capbank3_fc4_$j \
      [expr ($del3_origin - (5) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

    placeInstance \
      capbank3_fc44_$j \
      [expr ($del3_origin - (0) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank3_fc5_$j \
      [expr ($del3_origin + (5) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

    placeInstance \
      capbank3_fc6_$j \
      [expr ($del3_origin - (5) * $horiz_pitch)] \
      [expr (14 - $j) * $vert_pitch] \

    placeInstance \
      capbank3_fc7_$j \
      [expr ($del3_origin + (5) * $horiz_pitch)] \
      [expr (15 - $j) * $vert_pitch] \

    placeInstance \
      capbank3_fc8_$j \
      [expr ($del3_origin - (14) * $horiz_pitch)] \
      [expr (19 + $j) * $vert_pitch] \

}


# place the edge injector

placeInstance \
    einj/inj_0 \
    [expr ($del3_origin + (22) * $horiz_pitch)] \
    [expr (23) * $vert_pitch] \

placeInstance \
    einj/inj_1 \
    [expr ($del3_origin + (22) * $horiz_pitch)] \
    [expr (22) * $vert_pitch] \

placeInstance \
    einj/dff_1 \
    [expr ($del3_origin + (22) * $horiz_pitch)] \
    [expr (21) * $vert_pitch] \

placeInstance \
    einj/dff_2 \
    [expr ($del3_origin + (22) * $horiz_pitch)] \
    [expr (20) * $vert_pitch] \

placeInstance \
    einj/inv_hold \
    [expr ($del3_origin + (22) * $horiz_pitch)] \
    [expr (19) * $vert_pitch] \

for {set j 1} {$j < 5} {incr j} {

  placeInstance \
      einj/dff_del_$j \
      [expr ($del3_origin + (39) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      einj/dff_del_5_$j \
      [expr ($del3_origin + (22) * $horiz_pitch)] \
      [expr (18 - $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      einj/inj_del_5_$j \
      [expr ($del3_origin + (56) * $horiz_pitch)] \
      [expr (23 - $j) * $vert_pitch] \

}

for {set j 1} {$j < 5} {incr j} {

  placeInstance \
      einj/inj_del_$j \
      [expr ($del3_origin + (56) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

}

  placeInstance \
      einj/buf_ref \
      [expr ($del3_origin + (79) * $horiz_pitch)] \
      [expr (23 - 0) * $vert_pitch] \

  placeInstance \
      einj/del_1 \
      [expr ($del3_origin + (79) * $horiz_pitch)] \
      [expr (23 - 1) * $vert_pitch] \

  placeInstance \
      einj/del_4 \
      [expr ($del3_origin + (79) * $horiz_pitch)] \
      [expr (23 - 2) * $vert_pitch] \

  placeInstance \
      einj/del_16 \
      [expr ($del3_origin + (79) * $horiz_pitch)] \
      [expr (23 - 3) * $vert_pitch] \

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      einj/del_64_$j \
      [expr ($del3_origin + (79) * $horiz_pitch)] \
      [expr (19 - $j) * $vert_pitch] \

}


# Phase Interpolator Placement
# PI5
placeInstance \
    pi5/buf_l \
    [expr $del5_origin - (2) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

placeInstance \
    pi5/buf_r \
    [expr $del5_origin - (21) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi5/blend_left_$j \
      [expr $del5_origin - (2) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi5/blend_right_$j \
      [expr $del5_origin - (21) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

  placeInstance \
      pi5/out_buf \
      [expr $del5_origin - (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \


#  PI1
placeInstance \
    pi1/buf_l \
    [expr $del1_origin - (0) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

placeInstance \
    pi1/buf_r \
    [expr $del1_origin - (19) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi1/blend_left_$j \
      [expr $del1_origin - (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi1/blend_right_$j \
      [expr $del1_origin - (19) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

  placeInstance \
      pi1/out_buf \
      [expr $del1_origin - (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \



#  PI4
placeInstance \
    pi4/buf_l \
    [expr $del4_origin - (0) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

placeInstance \
    pi4/buf_r \
    [expr $del4_origin - (19) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi4/blend_left_$j \
      [expr $del4_origin - (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi4/blend_right_$j \
      [expr $del4_origin - (19) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

  placeInstance \
      pi4/out_buf \
      [expr $del4_origin - (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \



#  PI2

placeInstance \
    pi2/buf_l \
    [expr $del2_origin + (4) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

placeInstance \
    pi2/buf_r \
    [expr $del2_origin - (15) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi2/blend_left_$j \
      [expr $del2_origin + (4) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi2/blend_right_$j \
      [expr $del2_origin - (15) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

  placeInstance \
      pi2/out_buf \
      [expr $del2_origin + (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \


#  PI3

placeInstance \
    pi3/buf_l \
    [expr $del3_origin + (5) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

placeInstance \
    pi3/buf_r \
    [expr $del3_origin - (14) * $horiz_pitch] \
    [expr (24) * $vert_pitch]

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi3/blend_left_$j \
      [expr $del3_origin + (5) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

for {set j 0} {$j < 4} {incr j} {

  placeInstance \
      pi3/blend_right_$j \
      [expr $del3_origin - (14) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \

}

  placeInstance \
      pi3/out_buf \
      [expr $del3_origin + (0) * $horiz_pitch] \
      [expr (25 + $j) * $vert_pitch] \



109
    ###################
    # Place Blockages #
    ###################

    #rotated by 90
    #createPlaceBlockage -box  \
        [expr $origin_txindiv_x -$blockage_width] \
        [expr $origin_txindiv_y -$blockage_height] \
        [expr $origin_txindiv_x + $indiv_width + $blockage_width] \
        [expr $origin_txindiv_y + $indiv_height + $blockage_height]
