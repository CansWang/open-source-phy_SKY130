`timescale 100ps/1ps   //  unit_time / time precision

`default_nettype none

module qr_4t1_mux_top (
    input wire logic clk_Q,
    input wire logic clk_QB,
    input wire logic clk_I,
    input wire logic clk_IB, // Four phase clock input from PI+MDLL
    input wire logic [3:0] din,
    input wire logic rst,
    output wire logic data
);

// Instantiate the data path for Q clk path, use the Q clock as the reference clock
logic D0DQ;
logic D1MQ;
sky130_fd_sc_hs__dfxtp_2 dff_Q0 (.D(din[3]), .CLK(clk_Q), .Q(D0DQ));

// Instantiate the data path for I clk path
logic D0DI;
logic D1MI;
sky130_fd_sc_hs__dfxtp_2 dff_I0 (.D(din[2]), .CLK(clk_I), .Q(D0DI));

// Instantiate the data path for QB clk path
logic D0DQB;
logic D1DQB;
logic D2MQB;
sky130_fd_sc_hs__dfxtp_2 dff_QB0 (.D(din[1]), .CLK(clk_Q), .Q(D0DQB)); // data captured using Q clk and gradually passed to QB clk.
sky130_fd_sc_hs__dfxtp_2 dff_QB1 (.D(D0DQB), .CLK(clk_QB), .Q(D1DQB));

// Instantiate the data path for QB clk path
logic D0DIB;
logic D1DIB;
logic D2MIB;
sky130_fd_sc_hs__dfxtp_2 dff_IB0 (.D(din[0]), .CLK(clk_I), .Q(D0DIB)); // data captured using Q clk and gradually passed to IB clk.
sky130_fd_sc_hs__dfxtp_2 dff_IB1 (.D(D0DIB), .CLK(clk_IB), .Q(D1DIB));

// Instantiate 4 to 1 mux

// E0, E1
//  0,  0 -> DIN0_BAR
//  1,  0 -> DIN1_BAR
//  0,  1 -> DIN2_BAR
//  1,  1 -> DIN3_BAR

logic mux_out;

qr_mux_fixed mux_4 (
    .DIN0(D0DI),
    .DIN1(D1DQB),
    .DIN2(D0DQ),
    .DIN3(D1DIB),
    .E0(clk_Q),
    .E1(clk_I),
    .DOUT(mux_out)
);

genvar i;
generate
    for (i=0; i<4; i=i+1) begin : i_INVBUF 
        tx_inv inv_buf (
            .DIN(mux_out),
            .DOUT(data)
        );
    end
endgenerate
    
endmodule

`default_nettype wire
