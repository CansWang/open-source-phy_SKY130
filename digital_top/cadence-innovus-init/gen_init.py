with open('innovus-foundation-flow/init.tcl', 'w') as f:
    f.write(f'''set init_layout_view ""
set init_abstract_name ""
set init_verilog "./inputs/design.v"
set init_mmmc_file "innovus-foundation-flow/view_definition.tcl"
set init_lef_file "inputs/adk/rtk-tech.lef inputs/adk/stdcells.lef inputs/adk/stdcells.lef inputs/adk/rtk-tech.lef inputs/prbs_generator_syn.lef inputs/hr_16t4_mux_top.lef inputs/qr_4t1_mux_top.lef inputs/osc_core.lef inputs/fine_freq_track.lef"
set init_top_cell "digital_top"
set init_gnd_net "AVSS CVSS DVSS"
set init_pwr_net "AVDD CVDD DVDD"''')
f.close()
