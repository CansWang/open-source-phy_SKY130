#=========================================================================
# setup-optmode.tcl
#=========================================================================
# Useful knobs for setOptMode
#
# Author : Christopher Torng
# Date   : May 15, 2020

# Useful skew
#
# setOptMode -usefulSkew [ true | false ]
#
# - This enables/disables all other -usefulSkew* options (e.g.,
#   -usefulSkewCCOpt, -usefulSkewPostRoute, and -usefulSkewPreCTS)
#
# setOptMode -usefulSkewPreCTS [ true | false ]
#
# - If setOptMode -usefulSkew is false, then this entire option is ignored
#

#########################################
# Instances group-ing command insertion #
#########################################


    # Create a group and specify its placement region
    # createInstGroup MUX_4_fixed \
        # -fence 42.5 124 55 130
    
    
    # Add instances into the group
    # addInstToInstGroup MUX_4_fixed \
        # {qr_mux_4t1_0 qr_mux_4t1_1}
    

#########################################

puts "Info: Useful skew = $::env(useful_skew)"

if { $::env(useful_skew) } {
  setOptMode -usefulSkew       true
  setOptMode -usefulSkewPreCTS true
} else {
  setOptMode -usefulSkew      false
}


