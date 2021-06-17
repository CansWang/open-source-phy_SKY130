lef read rtk-tech-nolicon.lef
lef read inputs/adk/stdcells.lef
lef read inputs/prbs_generator_syn.lef
lef read inputs/osc_core.lef
lef read inputs/qr_4t1_mux_top.lef
lef read inputs/hr_16t4_mux_top.lef
lef read inputs/fine_freq_track.lef

def read design.def

save $::env(design_name).mag
load $::env(design_name).mag

flatten $::env(design_name)_flat
load $::env(design_name)_flat

# Extract for LVS
extract do local
extract no capacitance
extract no coupling
extract no resisitance
extract no adjust
extract unique
extract
ext2spice lvs
ext2spice subcircuit on
ext2spice subcircuit top on
ext2spice -o outputs/design_extracted.spice


feedback save error.log

quit
