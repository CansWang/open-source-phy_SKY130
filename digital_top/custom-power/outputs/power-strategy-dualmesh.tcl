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



# M2 power grid

# addStripe \
#     -pin_layer M2 \
#     -over_pins 1 \
#     -block_ring_top_layer_limit M2 \
#     -max_same_layer_jog_length 3.6 \
#     -padcore_ring_bottom_layer_limit M2 \
#     -padcore_ring_top_layer_limit M2 \
#     -spacing 2.24 \
#     -master "sky130_fd_sc_hs__tap*" \
#     -merge_stripes_value 0.245 \
#     -create_pins 1 \
#     -direction horizontal \
#     -layer M2 \
#     -block_ring_bottom_layer_limit M2 \
#     -width 0.49 \
#     -extend_to design_boundary \
#     -nets {DVDD DVSS}


  createRouteBlk -box \
    287.04 \
    675.99 \
    306.72 \
    679.32 \
    -name drc_error_route_blk0 \
    -layer M4

  createRouteBlk -box \
    156.24 \
    358.00 \
    170.24 \
    365.68 \
    -name drc_error_route_blk1 \
    -layer M5



createRouteBlk -box 62.50 0 63.00 850.00  -layer M4 -name left_blk1
createRouteBlk -box 136.50 0 137.00 850.00  -layer M4 -name left_blk2


sroute -connect { blockPin } \
    -inst { genblk1_6__prbs_b genblk1_7__prbs_b genblk1_8__prbs_b genblk1_9__prbs_b} \
    -layerChangeRange { M4 M4 } \
    -blockPinTarget { boundaryWithPin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M5 M1 } \
    -nets {DVDD DVSS} \
    -allowLayerChange 0 \
    -blockPin useLef \
    -targetViaLayerRange { M5 M1 }

sroute -connect { blockPin } \
    -inst { genblk1_6__prbs_b genblk1_7__prbs_b genblk1_8__prbs_b genblk1_9__prbs_b} \
    -layerChangeRange { M4 M4 } \
    -blockPinTarget { blockPin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M5 M1 } \
    -nets {DVDD DVSS} \
    -allowLayerChange 0 \
    -blockPin useLef \
    -targetViaLayerRange { M5 M1 }



# createRouteBlk -box 144.00 304.00 144.100 411.00  -layer {M2 M4} -name AVDD_blk1
# createRouteBlk -box 144.00 411.0 335.50 411.50  -layer {M2 M4} -name AVDD_blk2
# createRouteBlk -box 144.00 304.00 335.50 304.50  -layer {M2 M4} -name AVDD_blk3
# createRouteBlk -box 335.00 304.00 335.50 411.00  -layer {M2 M4} -name AVDD_blk4

# M2 power grid

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


createRouteBlk -box 149.5 200.5 150.00 850.00 -layer {M4} -name UP_blk1
createRouteBlk -box 399.36 201.0 400.50 850.00  -layer {M2 M4} -name UP_blk3
createRouteBlk -box 399.36 287 400.5 1 -layer {M4} -name DN_blk1
createRouteBlk -box 148.5 1.00 149 286.38  -layer {M4} -name DN_blk3



sroute -connect { blockPin } \
    -inst { genblk1_0__prbs_b genblk1_1__prbs_b genblk1_2__prbs_b genblk1_3__prbs_b genblk1_4__prbs_b genblk1_5__prbs_b hr_mux_16t4_0 qr_mux_4t1_0 ftl \
    genblk1_10__prbs_b genblk1_11__prbs_b genblk1_12__prbs_b genblk1_13__prbs_b genblk1_14__prbs_b genblk1_15__prbs_b hr_mux_16t4_1 qr_mux_4t1_1} \
    -layerChangeRange { M4 M4 } \
    -blockPinTarget { boundaryWithPin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M5 M1 } \
    -nets {DVDD DVSS} \
    -allowLayerChange 0 \
    -blockPin useLef \
    -targetViaLayerRange { M5 M1 }

sroute -connect { blockPin } \
    -inst { genblk1_0__prbs_b genblk1_1__prbs_b genblk1_2__prbs_b genblk1_3__prbs_b genblk1_4__prbs_b genblk1_5__prbs_b hr_mux_16t4_0 qr_mux_4t1_0 ftl \
    genblk1_10__prbs_b genblk1_11__prbs_b genblk1_12__prbs_b genblk1_13__prbs_b genblk1_14__prbs_b genblk1_15__prbs_b hr_mux_16t4_1 qr_mux_4t1_1 } \
    -layerChangeRange { M4 M4 } \
    -blockPinTarget { blockPin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M5 M1 } \
    -nets {DVDD DVSS} \
    -allowLayerChange 0 \
    -blockPin useLef \
    -targetViaLayerRange { M5 M1 }



# AVDD AVSS Power grid

sroute -connect { blockPin } \
    -inst { osc_inst } \
    -layerChangeRange { M6 M6 } \
    -blockPinTarget { boundaryWithPin } \
    -allowJogging 1 \
    -crossoverViaLayerRange { M6 M1 } \
    -corePinLayer {M6} \
    -nets {AVDD DVSS} \
    -allowLayerChange 1 \
    -blockPin useLef \
    -targetViaLayerRange { M6 M1 }

createPhysicalPin AVDD -net AVDD -layer M6 -rect 152.24 900.43 154.24 902.43



# M4 Power strip on the right-hand side

addStripe -nets {DVDD DVSS} \
   -layer M4 \
   -direction vertical \
   -width 1 \
   -spacing 5 \
   -start_offset 394 \
   -set_to_set_distance 12 \
   -start_from left \
   -max_same_layer_jog_length 2 \
   -padcore_ring_top_layer_limit M4 \
   -padcore_ring_bottom_layer_limit M4 \
   -block_ring_top_layer_limit M4 \
   -block_ring_bottom_layer_limit M4 \
   -use_wire_group 0 \
   -snap_wire_center_to_grid None \
   -skip_via_on_pin {standardcell} \
   -skip_via_on_wire_shape {noshape} \
   -create_pins 1 \
   -extend_to design_boundary

deleteRouteBlk -name *

  createRouteBlk -box \
    156.24 \
    358.00 \
    170.24 \
    365.68 \
    -name drc_error_route_blk1 \
    -layer M5
