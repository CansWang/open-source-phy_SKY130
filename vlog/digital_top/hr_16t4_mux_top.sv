//This is a half-rate 16:4 mux

`timescale 100ps/1ps   //  Unit_time / Time precision

`default_nettype none

module hr_16t4_mux_top (  // The output data rate should be input clock frequency times two.
    input wire logic clk,     // Half rate clock input
    input wire logic [15:0] din,  // Sixteen-bit input data
    input wire logic rst,
    output wire logic clk_prbs,
    output wire logic [3:0] dout // Four-bit output data
);


endmodule

`default_nettype wire
