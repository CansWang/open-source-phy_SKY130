# open-source-phy_SKY130

This repository contains the course project of 2021 Spring EE272B, Stanford Univeristy

About the project, please also refer to
        - Google Doc: https://docs.google.com/document/d/1XlmviEpNJnQxyBGFooT4ouG4fiQuw5VTy6RInX47rTE/edit?ts=602a33a3#
        - Git repo: https://github.com/StanfordVLSI/dragonphy2

---
### Summary

We are targeting at a data rate of 5Gbps, which means we need to meet the timing requirement of 1.25GHz(4-1 mux). In both of our testbench, `test.sv` and `test_prbs.sv`, we have achieved the clock speed of 1.25GHz.

---
### Digital Blocks and Testbench

All digital blocks are located under `vlog/all/` directory. We are using `Icarus Verilog` for compilation.

Because of the way we set up our testbench, the `prbs_generator_syn` block needs to be placed outside the top level module `digital_top` in our testbench script so that the fixed pattern test cases can be run.

Therefore we create two sets of scripts:
- `digital_top.sv` is the top level module (with `prbs_generator_syn` inside) that actually goes to `Openlane` for synthesis with its testbench `test.sv` (1 prbs test case)
  - For compilation, go to `vlog/all/` and run: `iverilog -o test -g2012 -v test.sv digital_top.sv prbs_generator_syn.sv hr_16t4_mux_top.sv qr_4t1_mux_top.sv div_b2.sv inv.sv ff_c_rn.sv ../cpu_models/ff_c.sv hr_4t1_mux_top.sv hr_2t1_mux_top.sv mux.sv tx_inv.sv ../cpu_models/qr_mux_fixed.sv ../prbs/prbs_checker_core.sv`
  - Command for running the testbench: `vvp test -lxt2`
- `digital_top_no_prbs.sv` is the top level module that runs with `test_prbs.sv`, which has the fixed pattern test cases as well (1 prbs test case + 8 fixed pattern test cases)
  - For compilation, go to `vlog/all/` and run: `iverilog -o test_prbs -g2012 -v test_prbs.sv digital_top_no_prbs.sv prbs_generator_syn.sv hr_16t4_mux_top.sv qr_4t1_mux_top.sv div_b2.sv inv.sv ff_c_rn.sv ../cpu_models/ff_c.sv hr_4t1_mux_top.sv hr_2t1_mux_top.sv mux.sv tx_inv.sv ../cpu_models/qr_mux_fixed.sv ../prbs/prbs_checker_core.sv`
  - Command for running the testbench: `vvp test_prbs -lxt2`

---
### Analog Blocks and Testbench

All analog blocks are under folder `spice/pll` directory. There is only one main block file for this part: `invdiff_xc_4stage.spice`.
You can run a quick simulation on this using the command: `ngspice invdiff_xc_4stage.spice` with ngspice.

The simulation will report two results: `invdelay` and `Cycle`, which captures unit cell delay of the oscillator and total cycle time of the oscillation. Thus, it is easy to read and debug the oscillator.

There are 7-bit control words in the spice file:  
        `VFC1 con_fc1 0 DC 0V`
        `VFC2 con_fc2 0 DC 0V`
        `VFC3 con_fc3 0 DC 0V`
        `VFC4 con_fc4 0 DC 0V`
        `VFC5 con_fc5 0 DC 0V`
        `VFC6 con_fc6 0 DC 0V`
        `VFC7 con_fc7 0 DC 1.8V`
        By toggling the 0V/1.8V we can change the oscillation frequency.
        
The simulation results are attached in the `RVCO_sim_results.xslx` under `spice/pll`. To reproduce the figure, please sweep the above mentioned control code to reconstruct the simulation results.

The design target is to cover a `frequency range of +-0.25 GHz` centered at `1.25 GHz`. Assume 125 MHz ref and 10% phase error after accumulation, the resolution needs to be `1ns` for each cell.

Under current setting, we've achieved 1 ns second resolution due to fact that pre-layout schematic is running at a higher frequency intentionally, so `7-bit` are already good enough to achieve such resolution. Two more bits can be enabled by allowing individual control of delay tuning varactor at each stage.  

---
### Setup for mflowgen

Please install the mflowgen on a server that has acess to commercial tools. Installation of mflowgen please follow the step in [here](https://mflowgen.readthedocs.io/en/latest/quick-start.html). Go through the steps until `pip install -e .`.

`.bashrc` file in out repo specify the installation path of the mflowgen, verilog code source folder and mflowgen design folder, change it according to your local path.

Then execute `source .bashrc` in bash shell, you will still stay `(venv)` environment.

DC+Innovus compatible adk is available from [here](https://github.com/CansWang/skywater-130nm-adk.git). Clone it to `$mflowgen+installation+path/adks/`. 













