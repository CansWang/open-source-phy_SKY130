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

	  set sram_FP_adjust [snap_to_grid 350 $horiz_pitch]
    set bottom_y [snap_to_grid 100 $vert_pitch]

    set output_buffer_width 13.05;# [dbGet [dbGet -p top.insts.name *out_buff_i*].cell.size_x]
    set output_buffer_height 18.4032; # [dbGet [dbGet -p top.insts.name *out_buff_i*].cell.size_y]

    set acore_width [dbGet [dbGet -p top.insts.name *iacore*].cell.size_x]
    set acore_height [dbGet [dbGet -p top.insts.name *iacore*].cell.size_y]

    set pi_width [dbGet [lindex [dbGet -p top.insts.name *iPI*] 0].cell.size_x]
    set pi_height [dbGet [lindex [dbGet -p top.insts.name *iPI*] 0].cell.size_y]

    set indiv_width [dbGet [dbGet -p top.insts.name *indiv*].cell.size_x]
    set indiv_height [dbGet [dbGet -p top.insts.name *indiv*].cell.size_y]

    set mdll_width [dbGet [dbGet -p top.insts.name *imdll*].cell.size_x]
    set mdll_height [dbGet [dbGet -p top.insts.name *imdll*].cell.size_y]

    set sram_height [dbGet [dbGet -p top.insts.name *errt_i_sram_i_memory*].cell.size_y]
    set sram_width  [dbGet [dbGet -p top.insts.name *errt_i_sram_i_memory*].cell.size_x]

    set small_sram_height [dbGet [lindex [dbGet -p top.insts.name *hist_sram_inst_memory*] 0].cell.size_y]
    set small_sram_width  [dbGet [lindex [dbGet -p top.insts.name *hist_sram_inst_memory*] 0].cell.size_x]

	set term_height [dbGet [lindex [dbGet -p top.insts.name buf1/i_term_p] 0].cell.size_y]
    set term_width [dbGet [lindex [dbGet -p top.insts.name buf1/i_term_p] 0].cell.size_x]

    set tri_height [dbGet [dbGet -p top.insts.name *iBUF_0__i_tri_buf_p*].cell.size_y]
    set tri_width [dbGet [dbGet -p top.insts.name *iBUF_0__i_tri_buf_p*].cell.size_x]



    set core_margin_t 0;#$vert_pitch
    set core_margin_b 0;#$vert_pitch
    set core_margin_r 0;#[expr 5 * $horiz_pitch]
    set core_margin_l 0;#[expr 5 * $horiz_pitch]




    set FP_width [snap_to_grid [expr 20  + 0] $horiz_pitch ]
    set FP_height [snap_to_grid 20 $vert_pitch ]

    set sram_to_acore_spacing_x [snap_to_grid 40 $horiz_pitch]
    set sram_to_acore_spacing_y [snap_to_grid 40 $vert_pitch]

    set sram_to_buff_spacing_y [snap_to_grid 30 $vert_pitch]

    set sram_to_sram_spacing  [snap_to_grid 30 $horiz_pitch]
    set sram_neighbor_spacing [expr $sram_width + $sram_to_sram_spacing]
    set sram_pair_spacing [expr 2*$sram_width + $sram_to_sram_spacing]
    set sram_vert_spacing [snap_to_grid 200 $vert_pitch]

	  set pi_to_pi_spacing    [snap_to_grid 25 $horiz_pitch]
    set pi_neighbor_spacing [expr $pi_width + $pi_to_pi_spacing]






	set origin_acore_x    [expr 199.98]
    set origin_acore_y    [expr 399.744 - $bottom_y]

	set origin_txindiv_x [expr [snap_to_grid 300 $horiz_pitch]]
    set origin_txindiv_y [expr [snap_to_grid 200 $vert_pitch]]

	set origin_sram_ffe_x [expr $origin_acore_x + $acore_width + 100 + 15*$blockage_width  + $core_margin_l]
    set origin_sram_ffe_y [expr 6*$blockage_height + $core_margin_b]

    set origin_sram_ffe_y2 [expr $FP_height - 6*$blockage_height - $core_margin_t -$sram_height]

    set origin_sram_adc_x [expr $origin_sram_ffe_x]
    set origin_sram_adc_y [expr 6*$blockage_height + $core_margin_b]
    set origin_sram_adc_y2 [expr $FP_height - 6*$blockage_height - $core_margin_t -$sram_height]

    set origin_async_x [expr 43.56]
    set origin_async_y [expr 312.192 - $bottom_y]

    set origin_out_x [expr 555.3]
    set origin_out_y [expr 140.544 - $bottom_y]

    set origin_main_x [expr 373.77]
    set origin_main_y [expr 312.192 - $bottom_y]

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

	set origin_term_n_x [snap_to_grid 15 $horiz_pitch]
    set origin_term_n_y [snap_to_grid 90 $vert_pitch]
    set origin_term_p_x [snap_to_grid 15 $horiz_pitch]
    set origin_term_p_y [snap_to_grid 161 $vert_pitch]




#    add_ndr -name tx_out_buf -spacing {M1:M7 0.12} -width {M1:M3 0.12 M4:M7 0.4}
#    setAttribute -net {buf1/BTN buf1/BTP dout_p dout_n} -non_default_rule tx_out_buf


addStripe \
    -pin_layer M2 \
    -over_pins 1 \
    -block_ring_top_layer_limit M2 \
    -max_same_layer_jog_length 3.6 \
    -padcore_ring_bottom_layer_limit M2 \
    -padcore_ring_top_layer_limit M2 \
    -spacing 2.24 \
    -master "sky130_fd_sc_hs__tap*" \
    -merge_stripes_value 0.245 \
    -create_pins 1 \
    -direction horizontal \
    -layer M2 \
    -block_ring_bottom_layer_limit M2 \
    -width 0.49 \
    -extend_to design_boundary \
    -nets {DVDD DVSS}

deleteRouteBlk -name *
deletePlaceBlockage -all
# Temperal M1 Power Grid Fix


addStripe -nets {DVDD DVSS} \
   -layer M6 \
   -direction vertical \
   -width 2 \
   -spacing 8 \
   -start_offset 2 \
   -set_to_set_distance 20 \
   -start_from left \
   -max_same_layer_jog_length 2 \
   -padcore_ring_top_layer_limit M6 \
   -padcore_ring_bottom_layer_limit M6 \
   -block_ring_top_layer_limit M6 \
   -block_ring_bottom_layer_limit M6 \
   -use_wire_group 0 \
   -snap_wire_center_to_grid None \
   -skip_via_on_pin {standardcell} \
   -skip_via_on_wire_shape {noshape} \
   -create_pins 1 \
   -extend_to design_boundary


##############################################
##### Manual Routes for Tx output buffer #####
##############################################
##-------------------------------------------------------------------------------------------------------

setEdit -layer_minimum M1
setEdit -layer_maximum M5
setEdit -force_regular 1
getEditMode -snap_to_track_regular
getEditMode -snap_to_pin
setEdit -force_special 1
getEditMode -snap_to_track
getEditMode -snap_special_wire
getEditMode -align_wire_at_pin
getEditMode -snap_to_row
getEditMode -snap_to_pin
setViaGenMode -ignore_DRC false
setViaGenMode -use_fgc 1
setViaGenMode -use_cce false

setEdit -layer_vertical M5
setEdit -width_vertical 1
setEdit -layer_horizontal M4
setEdit -width_horizontal 1

set del5_origin [expr (32) * $horiz_pitch]
set del1_origin [expr (79) * $horiz_pitch]
set del4_origin [expr (137) * $horiz_pitch]
set del2_origin [expr (182) * $horiz_pitch]
set del3_origin [expr (224) * $horiz_pitch]

setEdit -nets osc_000
editAddRoute [expr $del5_origin + 5*$horiz_pitch] [expr (19 + 5) * $vert_pitch]
editCommitRoute [expr $del5_origin + 5*$horiz_pitch] [expr (10) * $vert_pitch]

setEdit -nets osc_036
editAddRoute [expr $del1_origin + 5*$horiz_pitch] [expr (19 + 5) * $vert_pitch]
editCommitRoute [expr $del1_origin + 5*$horiz_pitch] [expr (10) * $vert_pitch]

setEdit -nets osc_144
editAddRoute [expr $del4_origin + 10*$horiz_pitch] [expr (19 + 5) * $vert_pitch]
editCommitRoute [expr $del4_origin + 10*$horiz_pitch] [expr (10) * $vert_pitch]

setEdit -nets osc_072
editAddRoute [expr $del2_origin + 5*$horiz_pitch] [expr (19 + 5) * $vert_pitch]
editCommitRoute [expr $del2_origin + 5*$horiz_pitch] [expr (10) * $vert_pitch]

setEdit -nets osc_108
editAddRoute [expr $del3_origin + 7*$horiz_pitch] [expr (19 + 5) * $vert_pitch]
editCommitRoute [expr $del3_origin + 7*$horiz_pitch] [expr (10) * $vert_pitch]

