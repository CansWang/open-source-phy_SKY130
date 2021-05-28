# Magic PEX Tcl Template, Take GDS as input

# Read the generated gds file from previous stage
# gds read design_merged.gds

# Tricky Step, DONT ALTER order and steps!
def read design.def
lef read rtk-tech.lef
lef read stdcells.lef
def read design.def
###


# Load the top cell
# load $::env(design_name)
# load qr_4t1_mux_top


save $::env(design_name).mag
load $::env(design_name).mag
# flatten qr_4t1_mux_top_flat
# load qr_4t1_mux_top_flat
select top cell
expand

# # Define pin order and make port
# # Make the port follow the same order 
# # of spice simulation testbench's helps 
# # direct-swap in post-layout simulations

#No need for DEF files since it retains the pin order of the design input

# findlabel clk_I
# port make
# findlabel din\[0\]
# port make
# findlabel rst
# port make
# findlabel DVDD
# port make
# findlabel DVSS
# port make


# Standard R-C Extraction Command
# Sources: https://skywater-pdk.slack.com/archives/C016HUV935L/p1619055439178200
# select top cell

extract all
ext2sim labels on
ext2sim
extresist tolerance 10
extresist
ext2spice lvs
ext2spice cthresh 0.01
ext2spice extresist on
ext2spice 
ext2spice -o outputs/pex_design.spice

quit