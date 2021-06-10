
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

assgin CTL_N={CTL_N0,CTL_N1};
assgin CTL_P={CTL_P0,CTL_P1};

// buffer to match the fanout
// SET_DONT_TOUCH!!
wire logic inn_buf;
wire logic inp_buf;

sky130_fd_sc_hs__inv_8 predrv_p_0 (.A(inp), .Y(inp_buf));
sky130_fd_sc_hs__inv_8 predrv_p_1 (.A(inp), .Y(inp_buf));

sky130_fd_sc_hs__inv_8 predrv_n_0 (.A(inn), .Y(inn_buf));
sky130_fd_sc_hs__inv_8 predrv_n_1 (.A(inn), .Y(inn_buf));
// 



// TRI_STATE_BUT
// SET_DONT_TOUCH!!

genvar i;
generate
    for (i = 0; i<40;i=i+1) begin
        sky130_fd_sc_hs__einvp_2 i_tri_buf_n (
            .A(inn_buf),
            .TE(CTL_N[i]),
            .Z(BTN)
        );

        sky130_fd_sc_hs__einvp_2 i_tri_buf_p (
            .A(inp_buf),
            .TE(CTL_P[i]),
            .Z(BTP)
        );
    end 

endgenerate

// Instantiate termination resistor
// This should be done in magic!

endmodule

`default_nettype wire