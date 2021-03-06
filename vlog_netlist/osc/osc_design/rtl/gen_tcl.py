import os

# convenience function that creates a nicely formatted TCL list
def tcl_list(vals, indent='    ', nl='\n'):
    retval = f' \\{nl}{indent}'.join(f'{{{val}}}' for val in vals)
    retval = '[list ' + retval + f' \\{nl}]'
    return retval

# shorten variable name for readability
e = os.environ

# determine the search path for include files

# build up a list of source files
file_list = []
file_list += ['/sim/canswang/open-source-phy_SKY130/vlog_netlist/osc/osc_core.sv']
file_list += ['/sim/canswang/open-source-phy_SKY130/vlog_netlist/osc/delay_cell_osc.sv']
file_list += ['/sim/canswang/open-source-phy_SKY130/vlog_netlist/osc/digital_varactor_bank.sv']
file_list += ['/sim/canswang/open-source-phy_SKY130/vlog_netlist/osc/edge_injector.sv']
file_list += ['/sim/canswang/open-source-phy_SKY130/vlog_netlist/osc/phase_interpolator.sv']

print('loaded verilog source file list:', file_list)

# create the text of the TCL script
output = f'''\
set_app_var search_path $search_path

# Read design
set file_list {tcl_list(file_list)}
analyze -format sverilog $file_list

# Elaborate the design target
elaborate osc_core
'''

# write output text
with open('outputs/read_design.tcl', 'w') as f:
    f.write(output)
