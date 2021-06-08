module output_buffer (
    input inn,
    input inp,
    input [19:0] CTL_N0,
    input [19:0] CTL_N1,
    input [19:0] CTL_P0,
    input [19:0] CTL_P1,

    output out_p,
    output out_n
);
    
logic [39:0] CTL_N;
logic [39:0] CTL_P;

assgin CTL_N={CTL_N0 ,CTL_N1};
assgin CTL_P={CTL_P0 ,CTL_P1};

// buffer to match the fanout
// SET_DONT_TOUCH!!
logic inn_buf;
logic inp_buf;

sky130_fd_sc_hs__inv_8 predrv_p_0 (.A(inp), .Y(inp_buf));
sky130_fd_sc_hs__inv_8 predrv_p_1 (.A(inp), .Y(inp_buf));

sky130_fd_sc_hs__inv_8 predrv_n_0 (.A(inn), .Y(inn_buf));
sky130_fd_sc_hs__inv_8 predrv_n_1 (.A(inn), .Y(inn_buf));
// 



// TRI_STATE_BUT
// SET_DONT_TOUCH!!
logic BTN;
logic BTP;

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

term_res_flat term_p (
    .IN(BTP),
    .out(out_p)
);

term_res_flat term_n (
    .IN(BTN),
    .out(out_n)
);


endmodule