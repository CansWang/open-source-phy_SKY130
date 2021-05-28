with open('innovus-foundation-flow/init.tcl', 'w') as f:
    f.write(f'''set init_layout_view ""
set init_abstract_name ""
set init_verilog "./inputs/design.v"
set init_mmmc_file "innovus-foundation-flow/view_definition.tcl"
set init_lef_file "inputs/adk/rtk-tech.lef inputs/adk/stdcells.lef inputs/adk/stdcells.lef inputs/adk/rtk-tech.lef"
set init_top_cell "fll_core"
set init_gnd_net "DVSS"
set init_pwr_net "DVDD"''')
f.close()
