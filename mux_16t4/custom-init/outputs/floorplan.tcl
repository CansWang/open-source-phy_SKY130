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

    set qr_mux_height [dbGet [lindex [dbGet -p top.insts.name qr_mux_4t1_0] 0].cell.size_x]
    set qr_mux_width [dbGet [lindex [dbGet -p top.insts.name qr_mux_4t1_0] 0].cell.size_y]

    set hr_mux_height [dbGet [lindex [dbGet -p top.insts.name hr_mux_16t4_0] 0].cell.size_x]

    set hr_mux_width [dbGet [lindex [dbGet -p top.insts.name hr_mux_16t4_0] 0].cell.size_x]

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


    set FP_width [snap_to_grid [expr 50 + 0] $horiz_pitch ]
    set FP_height [snap_to_grid 50 $vert_pitch ]


    #floorPlan -site unithd -s $FP_width $FP_height \
                            $core_margin_l $core_margin_b $core_margin_r $core_margin_t
    floorPlan -site unit -s $FP_width $FP_height 0 0 0 0

    setFlipping s

    createPlaceBlockage -box  \
        0 \
        0 \
        [expr (3 * $horiz_pitch)] \
        $FP_height \
        -name tapcell_blk_left



    createPlaceBlockage -box  \
        [expr $FP_width - (3 * $horiz_pitch)] \
        0 \
        $FP_width \
        $FP_height \
        -name tapcell_blk_right