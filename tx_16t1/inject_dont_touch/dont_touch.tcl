# inject don't touch to sdc

#set_dont_touch [get_cells {buf_IB}]
#set_dont_touch [get_cells {buf_QB}]
set_dont_touch [get_cells {dff_Q0_dummy}]
set_dont_touch [get_cells {dff_I0_dummy}]
set_dont_touch [get_cells {mux_4_dummy}]
