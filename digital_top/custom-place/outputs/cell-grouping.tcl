    #=========================================================================
    # cell-grouping.tcl
    #=========================================================================
    # Author : Can Wang
    # Date   : March 03, 2021

    #-------------------------------------------------------------------------
    # InstGroup #1
    #-------------------------------------------------------------------------
    
    # Create a group and specify its placement region
    createInstGroup MUX_G \
        -region 60 125 90 150 


    # Add instances into the group
    addInstToInstGroup MUX_G \
        {div0 div0 indiv hr_mux_16t4_0 hr_mux_16t4_1 qr_mux_4t1_0 qr_mux_4t1_1 clk_inv} 

