

# export MFLOWGEN_PATH=`realpath mflowgen`

export MFLOWGEN_PATH=/tmp/canw/mflowgen
export MGLS_LICENSE_FILE=1717@cadlic0.stanford.edu
export VLOG_HOME=/tmp/canw/open-source-phy_SKY130/vlog/
export DESIGN=/tmp/canw/open-source-phy_SKY130/tx_16t1

export design_name=osc_core
export LD_LIBRARY_PATH=/lib64/:$PATH

source /cad/modules/tcl/init/sh
module load base
module load vcs
module load lc
module load dc_shell
module load xcelium
module load genus
module load innovus
module load calibre
module load pts
module load prime
module load magic/latest
module load netgen/latest

