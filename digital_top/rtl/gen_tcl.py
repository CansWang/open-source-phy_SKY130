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
file_list += [e['VLOG_HOME']+'/digital_top/digital_top.sv']
file_list += [e['VLOG_HOME']+'/digital_top/prbs_generator_syn.sv']
file_list += [e['VLOG_HOME']+'/digital_top/qr_4t1_mux_top.sv']
file_list += [e['VLOG_HOME']+'/digital_top/hr_16t4_mux_top.sv']
file_list += [e['VLOG_HOME']+'/digital_top/output_buf.sv']

print('loaded verilog source file list:', file_list)

# create the text of the TCL script
output = f'''\
set_app_var search_path $search_path

# Read design
set file_list {tcl_list(file_list)}
analyze -format sverilog $file_list

# Elaborate the design target
elaborate digital_top
'''

# write output text
with open('outputs/read_design.tcl', 'w') as f:
    f.write(output)
