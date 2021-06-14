proc snap_to_grid {input granularity} {
   set new_value [expr ceil($input / $granularity) * $granularity]
   return $new_value
}

# Set the floorplan to target a reasonable placement density with a good
# aspect ratio (height:width). An aspect ratio of 2.0 here will make a
# rectangular chip with a height that is twice the width.

  set blk_width 3
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




set FP_width [snap_to_grid [expr 200  + 0] $horiz_pitch ]
set FP_height [snap_to_grid 1400 $vert_pitch ]

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


#	placeInstance \
itx/indiv \
[expr $origin_txindiv_x-4.5]  \
[expr $origin_txindiv_y-$vert_pitch] \
MX

# createRouteBlk -box \
[expr $origin_mdll_x-$blockage_width] \
[expr $origin_mdll_y-$blockage_width] \
[expr $origin_mdll_x+$mdll_width+$blockage_width] \
[expr $origin_mdll_y+$mdll_height+$blockage_width] \
-name mdll_block -layer 1

# createRouteBlk -box \
[expr $origin_async_x-$blockage_width] \
[expr $origin_async_y-$blockage_width] \
[expr $origin_async_x+$input_buffer_width+$blockage_width] \
[expr $origin_async_y+$input_buffer_height+$blockage_width] \
-name inbuf_async_blk -layer 1

# createRouteBlk -box \
[expr $origin_main_x-$blockage_width] \
[expr $origin_main_y-$blockage_width] \
[expr $origin_main_x+$input_buffer_width+$blockage_width] \
[expr $origin_main_y+$input_buffer_height+$blockage_width] \
-name inbuf_main_blk -layer 1

# createRouteBlk -box \
[expr $origin_mon_x-$blockage_width] \
[expr $origin_mon_y-$blockage_width] \
[expr $origin_mon_x+$input_buffer_width+$blockage_width] \
[expr $origin_mon_y+$input_buffer_height+$blockage_width] \
-name inbuf_mon_blk -layer 1

# createRouteBlk -box \
[expr $origin_ref_x-$blockage_width] \
[expr $origin_ref_y-$blockage_width] \
[expr $origin_ref_x+$input_buffer_width+$blockage_width] \
[expr $origin_ref_y+$input_buffer_height+$blockage_width] \
-name inbuf_ref_blk -layer 1

# createRouteBlk -box \
[expr $origin_sram_ffe_x - $blockage_width] \
[expr $origin_sram_ffe_y2 - $blockage_height] \
[expr $origin_sram_ffe_x + 2*$sram_pair_spacing + $blockage_width] \
[expr $origin_sram_ffe_y2 + $sram_height       + $blockage_height] \
-name memory_ffe_blk -layer 1

# createRouteBlk -box \
[expr $origin_sram_ffe_x + 2*$sram_pair_spacing] \
[expr $origin_sram_ffe_y2 - $blockage_height] \
[expr $origin_sram_ffe_x + 2*$sram_pair_spacing + $small_sram_width + $blockage_width]\
[expr $origin_sram_ffe_y2 + 2*$small_sram_height + $blockage_height] \
-name memory_hist_blk -layer 1

# createRouteBlk -box \
[expr $origin_sram_adc_x - $blockage_width] \
[expr $origin_sram_adc_y - $blockage_height] \
[expr $origin_sram_adc_x + 2*$sram_pair_spacing + $sram_width +  $blockage_width] \
[expr $origin_sram_adc_y + $sram_height         + $blockage_height] \
-name memory_adc_blk -layer 1

# createRouteBlk -box \
[expr $origin_acore_x-$blockage_width] \
[expr $origin_acore_y-$blockage_width] \
[expr $origin_acore_x+$acore_width+$blockage_width] \
[expr $origin_acore_y+$acore_height+$blockage_width] \
-name acore_blk -layer 1



# addStripe \
# -pin_layer M1 \
# -over_pins 1 \
# -block_ring_top_layer_limit M1 \
# -max_same_layer_jog_length 3.6 \
# -padcore_ring_bottom_layer_limit M1 \
# -padcore_ring_top_layer_limit M1 \
# -spacing 2.24 \
# -master "sky130_fd_sc_hd__tap*" \
# -merge_stripes_value 0.25 \
# -create_pins 1 \
# -direction horizontal \
# -layer M1 \
# -block_ring_bottom_layer_limit M1 \
# -width 0.24 \
# -extend_to design_boundary \
# -nets {DVDD DVSS}

deleteRouteBlk -name *

# Temperal M1 Power Grid Fix
# sroute -nets {DVDD DVSS} -layer M1


# addStripe -nets {DVDD DVSS} \
#   -layer M4 -direction vertical -width 1 -spacing 2 -start_offset 2 -set_to_set_distance 6 -start_from left -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M4 -padcore_ring_bottom_layer_limit M4 -block_ring_top_layer_limit M4 -block_ring_bottom_layer_limit M4 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {standardcell} -skip_via_on_wire_shape {noshape} -create_pins 1 -extend_to design_boundary



set x_offset 0.19
set y_offset 0.24
set hr_0_x [expr [snap_to_grid 170 3] - $x_offset]
set hr_0_y [expr [snap_to_grid 170 $vert_pitch] - $y_offset]
set hr_1_x [expr [snap_to_grid 170 3] - $x_offset]
set hr_1_y [expr [snap_to_grid 250 $vert_pitch] - $y_offset]
set qr_0_x [expr [snap_to_grid 250 3] - $x_offset]
set qr_0_y [expr [snap_to_grid 170 $vert_pitch] - $y_offset]
set qr_1_x [expr [snap_to_grid 250 3] - $x_offset]
set qr_1_y [expr [snap_to_grid 250 $vert_pitch] - $y_offset]

# createRouteBlk -box \
#   [expr $hr_0_x - $blk_width] \
#   [expr $hr_0_y - $blk_width] \
#   [expr $hr_0_x + 40 + $blk_width] \
#   [expr $hr_0_y + 40 + $blk_width] \
#   -name hr_0_blk -layer all
# set acore_x $origin_acore_x
# set acore_y $origin_acore_y    

# set inbuf_async_x $origin_async_x 
# set inbuf_async_y $origin_async_y 

# set outbuf_x $origin_out_x 
# set outbuf_y $origin_out_y 

# set inbuf_main_x $origin_main_x 
# set inbuf_main_y $origin_main_y 

# set mdll_x $origin_mdll_x 
# set mdll_y $origin_mdll_y 

# set inbuf_mdll_mon_x $origin_mon_x 
# set inbuf_mdll_mon_y $origin_mon_y 

# set inbuf_mdll_ref_x $origin_ref_x 
# set inbuf_mdll_ref_y $origin_ref_y 

# createRouteBlk -box \
#   [expr $hr_1_x - $blk_width] \
#   [expr $hr_1_y - $blk_width] \
#   [expr $hr_1_x + 40 + $blk_width] \
#   [expr $hr_1_y + 40 + $blk_width] \
#   -name hr_1_blk -layer all

# createRouteBlk -box \
#   [expr $qr_0_x - $blk_width] \
#   [expr $qr_0_y - $blk_width] \
#   [expr $qr_0_x + 30 + $blk_width] \
#   [expr $qr_0_y + 30 + $blk_width] \
#   -name qr_0_blk -layer all

# createRouteBlk -box \
#   [expr $qr_1_x - $blk_width] \
#   [expr $qr_1_y - $blk_width] \
#   [expr $qr_1_x + 30 + $blk_width] \
#   [expr $qr_1_y + 30 + $blk_width] \
#   -name qr_1_blk -layer all

#   for {set i 0} {$i < 6} {incr i} {
#     createRouteBlk -box  \
#       [expr [snap_to_grid 90 $horiz_pitch] - $blk_width] \
#       [expr [snap_to_grid [expr $i * 80 + 10] $vert_pitch] - $blk_width] \
#       [expr [snap_to_grid 90 $horiz_pitch] + 70 + $blk_width] \
#       [expr [snap_to_grid [expr $i * 80 + 10] $vert_pitch] + 70 + $blk_width] \
#       -layer all
#   }

#   for {set i 6} {$i < 8} {incr i} {
#     createRouteBlk -box  \
#       [expr [snap_to_grid 10 $horiz_pitch] - $blk_width] \
#       [expr [snap_to_grid [expr ($i-4) * 80 + 10] $vert_pitch] - $blk_width] \
#       [expr [snap_to_grid 10 $horiz_pitch] + 70 + $blk_width] \
#       [expr [snap_to_grid [expr ($i-4) * 80 + 10] $vert_pitch] + 70 + $blk_width] \
#       -layer all
#   }

#   for {set i 8} {$i < 10} {incr i} {
#     createRouteBlk -box  \
#       [expr [snap_to_grid 170 $horiz_pitch] - $blk_width] \
#       [expr [snap_to_grid [expr ($i-8) * 80 + 10] $vert_pitch] - $blk_width] \
#       [expr [snap_to_grid 170 $horiz_pitch] + 70 + $blk_width] \
#       [expr [snap_to_grid [expr ($i-8) * 80 + 10] $vert_pitch] + 70 + $blk_width] \
#       -layer all
#   }

#   for {set i 10} {$i < 12} {incr i} {
#     createRouteBlk -box  \
#       [expr [snap_to_grid 170 $horiz_pitch] - $blk_width] \
#       [expr [snap_to_grid [expr ($i-6) * 80 + 10] $vert_pitch] - $blk_width] \
#       [expr [snap_to_grid 170 $horiz_pitch] + 70 + $blk_width] \
#       [expr [snap_to_grid [expr ($i-6) * 80 + 10] $vert_pitch] + 70 + $blk_width] \
#       -layer all
#   }

#   for {set i 12} {$i < 14} {incr i} {
#     createRouteBlk -box  \
#       [expr [snap_to_grid 250 $horiz_pitch] - $blk_width] \
#       [expr [snap_to_grid [expr ($i-12) * 80 + 10] $vert_pitch] - $blk_width] \
#       [expr [snap_to_grid 250 $horiz_pitch] + 70 + $blk_width] \
#       [expr [snap_to_grid [expr ($i-12) * 80 + 10] $vert_pitch] + 70 + $blk_width] \
#       -layer all
#   }

#   for {set i 14} {$i < 16} {incr i} {
#     createRouteBlk -box  \
#       [expr [snap_to_grid 250 $horiz_pitch] - $blk_width] \
#       [expr [snap_to_grid [expr ($i-10) * 80 + 10] $vert_pitch] - $blk_width] \
#       [expr [snap_to_grid 250 $horiz_pitch] + 70 + $blk_width] \
#       [expr [snap_to_grid [expr ($i-10) * 80 + 10] $vert_pitch] + 70 + $blk_width] \
#       -layer all
#   }

# Final Step, connects all the power grid from M10 to M1
