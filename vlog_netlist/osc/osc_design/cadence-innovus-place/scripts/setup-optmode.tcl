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
    createInstGroup DEL_STAGE_5 \
        -fence 0 16 4 25
    
    
    # Add instances into the group
    addInstToInstGroup DEL_STAGE_5 \
        {del5}


    # Create a group and specify its placement region
    createInstGroup DEL_STAGE_1 \
        -fence 4 16 8 25
    
    
    # Add instances into the group
    addInstToInstGroup DEL_STAGE_1 \
        {del1}


    # Create a group and specify its placement region
    createInstGroup DEL_STAGE_4 \
        -fence 8 16 12 25
    
    
    # Add instances into the group
    addInstToInstGroup DEL_STAGE_4 \
        {del4}
    

    # Create a group and specify its placement region
    createInstGroup DEL_STAGE_2 \
        -fence 12 16 16 25
    
    
    # Add instances into the group
    addInstToInstGroup DEL_STAGE_2 \
        {del2}


    # Create a group and specify its placement region
    createInstGroup DEL_STAGE_3 \
        -fence 16 16 20 25
    
    
    # Add instances into the group
    addInstToInstGroup DEL_STAGE_3 \
        {del3}


#########################################

puts "Info: Useful skew = $::env(useful_skew)"

if { $::env(useful_skew) } {
  setOptMode -usefulSkew       true
  setOptMode -usefulSkewPreCTS true
} else {
  setOptMode -usefulSkew      false
}


