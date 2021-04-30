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
