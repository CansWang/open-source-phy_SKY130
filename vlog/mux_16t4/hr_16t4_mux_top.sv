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

wire logic clk_hr_n;
wire logic clk_hr;
// wire logic clk_prbs;

genvar i;
generate  // Instantiate 4 hr_4t1_mux_top to form 16:4 mux
    for (i=1; i<5; i=i+1) begin : iMUX
        hr_4t1_mux_top mux_4t1 (
            .clk_b(clk_hr),
            .din(din[4*i-1:4*(i-1)]),  // Map 16 bits input to 4 half-rate 4 to 1 mux
            .clk_half(clk_prbs),
            .dout(dout[i-1])
        );
    end
endgenerate

div_b2 div0 (.clkin(clk), .rst(rst), .clkout(clk_hr));  // 4GHz to 2GHz, output goes to hr_16t4_mux
inv clk_inv(.in(clk_hr), .out(clk_hr_n));
div_b2 div1 (.clkin(clk_hr_n), .rst(rst), .clkout(clk_prbs));  // 2GHz to 1GHz, output goes to prbs_gen


endmodule

`default_nettype wire
