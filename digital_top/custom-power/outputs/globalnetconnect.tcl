#=========================================================================
# globalnetconnect.tcl
#=========================================================================
# Author : Christopher Torng
# Date   : January 13, 2020

#-------------------------------------------------------------------------
# Global net connections for PG pins
#-------------------------------------------------------------------------
globalNetConnect DVDD -type pgpin -pin VPWR -inst * -override
globalNetConnect DVSS -type pgpin -pin VGND -inst * -override
globalNetConnect DVDD -type pgpin -pin VPB -inst * -override
globalNetConnect DVSS -type pgpin -pin VNB -inst * -override

globalNetConnect DVDD -type pgpin -pin DVDD -inst genblk1_*__prbs_b -override
globalNetConnect DVSS -type pgpin -pin DVSS -inst genblk1_*__prbs_b -override

globalNetConnect DVDD -type pgpin -pin DVDD -inst qr_mux_4t1_* -override
globalNetConnect DVSS -type pgpin -pin DVSS -inst qr_mux_4t1_* -override

globalNetConnect DVDD -type pgpin -pin DVDD -inst hr_mux_16t4_* -override
globalNetConnect DVSS -type pgpin -pin DVSS -inst hr_mux_16t4_* -override

globalNetConnect DVDD -type pgpin -pin DVDD -inst ftl -override
globalNetConnect DVSS -type pgpin -pin DVSS -inst ftl -override

# AVDD AVSS

globalNetConnect AVDD -type pgpin -pin DVDD -inst osc_inst -override
globalNetConnect AVSS -type pgpin -pin DVSS -inst osc_inst -override



# TODO: are special net connections needed for the MDLL?
#
#globalNetConnect VDD    -type pgpin -pin VDD    -inst * -verbose
#globalNetConnect VSS    -type pgpin -pin VSS    -inst * -verbose

#if { [ lindex [dbGet top.insts.cell.pgterms.name VNW] 0 ] != 0x0 } {
#  globalNetConnect VDD    -type pgpin -pin VNW    -inst * -verbose
#  globalNetConnect VSS    -type pgpin -pin VPW    -inst * -verbose
#}
