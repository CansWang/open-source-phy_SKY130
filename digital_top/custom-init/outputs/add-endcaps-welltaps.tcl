#=========================================================================
# add-endcaps-welltaps.tcl
#=========================================================================
# Author : 
# Date   : 

#-------------------------------------------------------------------------
# Endcap and well tap specification
#-------------------------------------------------------------------------
# TSMC16 requires specification of different taps/caps for different
# locations/orientations, which the foundation flow does not natively support

if {[expr {$ADK_END_CAP_CELL == ""} && {$ADK_WELL_TAP_CELL == ""}]} {
  adk_set_end_cap_mode
  adk_set_well_tap_mode
  adk_add_end_caps

#placeInstance \
  indiv \
     [expr $origin_txindiv_x-4.5] \
     [expr $origin_txindiv_y-$vert_pitch] \
     MX
 
 adk_add_well_taps
}

addWellTap -cell [list $ADK_WELL_TAP_CELL] \
           -prefix       WELLTAP \
           -cellInterval $ADK_WELL_TAP_INTERVAL \
           -checkerboard

verifyWellTap -cells [list $ADK_WELL_TAP_CELL] \
              -report reports/welltap.rpt \
              -rule   [ expr $ADK_WELL_TAP_INTERVAL/2 ]
