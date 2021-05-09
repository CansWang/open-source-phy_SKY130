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
file_list += ['/tmp/canw/mflowgen/build/mux/6-rtl/outputs/mux_4t1/ff_c.sv']
file_list += ['/tmp/canw/mflowgen/build/mux/6-rtl/outputs/mux_4t1/qr_4t1_mux_top.sv']
file_list += ['/tmp/canw/mflowgen/build/mux/6-rtl/outputs/mux_4t1/qr_mux_fixed.sv']
file_list += ['/tmp/canw/mflowgen/build/mux/6-rtl/outputs/mux_4t1/tx_inv.sv']

print('loaded verilog source file list:', file_list)

# create the text of the TCL script
output = f'''\
set_app_var search_path $search_path

# Read design
set file_list {tcl_list(file_list)}
analyze -format sverilog $file_list

# Elaborate the design target
elaborate qr_4t1_mux_top
'''

# write output text
with open('outputs/read_design.tcl', 'w') as f:
    f.write(output)
