
`default_nettype none
module output_buffer (
    input wire logic inn,
    input wire logic inp,
    input wire logic [19:0] CTL_N0,
    input wire logic [19:0] CTL_N1,
    input wire logic [19:0] CTL_P0,
    input wire logic [19:0] CTL_P1,

    output wire logic BTP,
    output wire logic BTN
);
    
wire logic [39:0] CTL_N;
wire logic [39:0] CTL_P;

assign CTL_N={CTL_N0,CTL_N1};
assign CTL_P={CTL_P0,CTL_P1};

// buffer to match the fanout
// SET_DONT_TOUCH!!
wire logic inn_buf_0;
wire logic inn_buf_1;
wire logic inp_buf_0;
wire logic inp_buf_1;

sky130_fd_sc_hs__inv_8 predrv_p0_0 (.A(inp), .Y(inp_buf_0));
sky130_fd_sc_hs__inv_8 predrv_p0_1 (.A(inp), .Y(inp_buf_0));
sky130_fd_sc_hs__inv_8 predrv_p1_0 (.A(inp_buf_0), .Y(inp_buf_1));
sky130_fd_sc_hs__inv_8 predrv_p1_1 (.A(inp_buf_0), .Y(inp_buf_1));
sky130_fd_sc_hs__inv_8 predrv_p1_2 (.A(inp_buf_0), .Y(inp_buf_1));
sky130_fd_sc_hs__inv_8 predrv_p1_3 (.A(inp_buf_0), .Y(inp_buf_1));


sky130_fd_sc_hs__inv_8 predrv_n0_0 (.A(inn), .Y(inn_buf_0));
sky130_fd_sc_hs__inv_8 predrv_n0_1 (.A(inn), .Y(inn_buf_0));
sky130_fd_sc_hs__inv_8 predrv_n1_0 (.A(inn_buf_0), .Y(inn_buf_1));
sky130_fd_sc_hs__inv_8 predrv_n1_1 (.A(inn_buf_0), .Y(inn_buf_1));
sky130_fd_sc_hs__inv_8 predrv_n1_2 (.A(inn_buf_0), .Y(inn_buf_1));
sky130_fd_sc_hs__inv_8 predrv_n1_3 (.A(inn_buf_0), .Y(inn_buf_1));

// 



// TRI_STATE_BUT
// SET_DONT_TOUCH!!

genvar i;
generate
    for (i = 0; i<40;i=i+1) begin
        sky130_fd_sc_hs__einvp_2 i_tri_buf_n (
            .A(inn_buf_1),
            .TE(CTL_N[i]),
            .Z(BTN)
        );

        sky130_fd_sc_hs__einvp_2 i_tri_buf_p (
            .A(inp_buf_1),
            .TE(CTL_P[i]),
            .Z(BTP)
        );
    end 

endgenerate

// Instantiate termination resistor
// This should be done in magic!

endmodule

`default_nettype wire