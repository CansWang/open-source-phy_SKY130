module edge_injector (
    input ref_clk,
    input inj_en,
    output inj_out,
    output osc_hold

);


// Input buffer for ref_clk to drive large loads

logic ref_clk_buf;

sky130_fd_sc_hs__inv_4 buf_ref (.A(ref_clk), .Y(ref_clk_buf));

// Input delay 4*FO4 stages

logic d1;
logic d2;
logic d3;
logic del_ref_clk;

sky130_fd_sc_hs__inv_1 del_1 (.A(ref_clk_buf), .Y(d1));
sky130_fd_sc_hs__inv_4 del_4 (.A(d1), .Y(d2));
sky130_fd_sc_hs__inv_16 del_16 (.A(d2), .Y(d3));

sky130_fd_sc_hs__inv_16 del_64_0 (.A(d3), .Y(del_ref_clk));
sky130_fd_sc_hs__inv_16 del_64_1 (.A(d3), .Y(del_ref_clk));
sky130_fd_sc_hs__inv_16 del_64_2 (.A(d3), .Y(del_ref_clk));
sky130_fd_sc_hs__inv_16 del_64_3 (.A(d3), .Y(del_ref_clk));

// Delay and inverting to the injection stage

logic inj1;
logic inj2;
logic inj3;
logic inj4;
logic ref_to_injector;

sky130_fd_sc_hs__inv_1 inj_del_1 (.A(del_ref_clk), .Y(inj1));
sky130_fd_sc_hs__inv_1 inj_del_2 (.A(inj1), .Y(inj2));

sky130_fd_sc_hs__inv_4 inj_del_3 (.A(inj2), .Y(inj3));
sky130_fd_sc_hs__inv_16 inj_del_4 ( .A(inj3), .Y(inj4));

sky130_fd_sc_hs__inv_16 inj_del_5_0 (.A(inj4), .Y(ref_to_injector));
sky130_fd_sc_hs__inv_16 inj_del_5_1 (.A(inj4), .Y(ref_to_injector));
sky130_fd_sc_hs__inv_16 inj_del_5_2 (.A(inj4), .Y(ref_to_injector));
sky130_fd_sc_hs__inv_16 inj_del_5_3 (.A(inj4), .Y(ref_to_injector));

// delay to reset DFF

logic rst1;
logic rst2;
logic rst3;
logic rst4;
logic dff_reset;

sky130_fd_sc_hs__inv_1 dff_del_1 (.A(del_ref_clk), .Y(rst1));
sky130_fd_sc_hs__inv_1 dff_del_2 (.A(rst1), .Y(rst2));

sky130_fd_sc_hs__inv_4 dff_del_3 (.A(rst2), .Y(rst3));
sky130_fd_sc_hs__inv_16 dff_del_4 ( .A(rst3), .Y(rst4));

sky130_fd_sc_hs__inv_16 dff_del_5_0 (.A(rst4), .Y(dff_reset));
sky130_fd_sc_hs__inv_16 dff_del_5_1 (.A(rst4), .Y(dff_reset));
sky130_fd_sc_hs__inv_16 dff_del_5_2 (.A(rst4), .Y(dff_reset));
sky130_fd_sc_hs__inv_16 dff_del_5_3 (.A(rst4), .Y(dff_reset));

// DFF

logic inject_window;

sky130_fd_sc_hs__dfrtp_4 dff_1 (.D(1'b1), .Q(inject_window), .CLK(ref_clk_buf), .RESET_B(dff_reset));
sky130_fd_sc_hs__dfrtp_4 dff_2 (.D(1'b1), .Q(inject_window), .CLK(ref_clk_buf), .RESET_B(dff_reset));

// osc hold signal generation from dff Q, inverting this output

sky130_fd_sc_hs__inv_16 inv_hold (.A(inject_window), .Y(osc_hold));

// Injector, 3-input NAND gate with ENABLE and injection window selection

sky130_fd_sc_hs__nand3_4 inj_0 (.A(ref_to_injector), .B(inject_window), .C(inj_en), .Y(inj_out));
sky130_fd_sc_hs__nand3_4 inj_1 (.A(ref_to_injector), .B(inject_window), .C(inj_en), .Y(inj_out));
 

endmodule