`timescale 100ps/1ps   //  unit_time / time precision

`default_nettype none

module qr_4t1_mux_top (
    input wire logic clk_Q,
    input wire logic clk_QB,
    input wire logic clk_I,
    input wire logic clk_IB, // Four phase clock input from PI+MDLL
    input wire logic [3:0] din,
    input wire logic rst,
    input wire logic din_2_dummy,
    input wire logic din_3_dummy,
    input wire logic D1DQB_dummy,
    input wire logic D1DIB_dummy,
    output wire logic data,
    output wire logic mux_out_dummy
);




endmodule

`default_nettype wire
