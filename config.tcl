#User config
set ::env(DESIGN_NAME) digital_top

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.sv]

# Fill this
set ::env(CLOCK_PERIOD) "10"
set ::env(CLOCK_PORT) "clk_interp_slice_2"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

set ::env(FP_CORE_UTIL) 70
set ::env(PL_TARGET_DENSITY) 0.80
set ::env(CELL_PAD) 0

