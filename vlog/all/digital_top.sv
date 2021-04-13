`timescale 1fs/1fs   //  unit_time / time precision

`default_nettype none

module digital_top (
     input wire logic [15:0] din,
     input wire logic mdll_clk, // Clock from MDLL
     input wire logic ext_clk, // Clock from external source
     input wire logic clk_prbs,

    input wire logic rst, // Global reset for Tx
    input wire logic rst_prbs,
    // input wire logic [31:0] init_vals [16],
    input wire logic inj_error,
    // input wire logic [Npi-1:0] ctl_pi [Nout-1:0],
    // input wire logic clk_async,
    // input wire logic clk_encoder,
    // input wire logic ctl_valid,
    input wire logic [3:0] clk_interp_slice,
    // output buffer control
    // input wire logic [17:0] ctl_buf_n0,
    // input wire logic [17:0] ctl_buf_n1,
    // input wire logic [17:0] ctl_buf_p0,
    // input wire logic [17:0] ctl_buf_p1,

    output wire logic clk_prbsgen,  // Output clock for 16-bit prbs generator
    output wire logic dout_p, // Data output
    output wire logic dout_n
    // tx_debug_intf.tx tx
);

// logic [15:0] prbsdata;

wire [3:0] qr_data_p;  // Output of 16 to 4 mux, positive
wire [3:0] qr_data_n;  // Output of 16 to 4 mux, negative
wire clk_halfrate;  // Input clock for 16 to 4 mux
wire logic clk_halfrate_n;
// wire logic clk_prbsgen;

wire logic mtb_n;  // mux to buffer -
wire logic mtb_p;  // mux to buffer +

wire [15:0] din_reorder;
assign din_reorder[0] = din[15];
assign din_reorder[4] = din[14];
assign din_reorder[8] = din[13];
assign din_reorder[12] = din[12];
assign din_reorder[2] = din[11];
assign din_reorder[6] = din[10];
assign din_reorder[10] = din[9];
assign din_reorder[14] = din[8];
assign din_reorder[1] = din[7];
assign din_reorder[5] = din[6];
assign din_reorder[9] = din[5];
assign din_reorder[13] = din[4];
assign din_reorder[3] = din[3];
assign din_reorder[7] = din[2];
assign din_reorder[11] = din[1];
assign din_reorder[15] = din[0];

assign dout_n = mtb_n;
assign dout_p = mtb_p;

// genvar i;  // Declare the generate variable
// generate
//     for(i=0; i<16; i=i+1) begin
//         prbs_generator_syn #(
//             .n_prbs(32)
//         ) prbs_b (
//             .clk(clk_prbsgen),
//             .rst(rst_prbs),
//             .cke(1'b1),
//             .init_val(init_vals[i]),
//             .eqn(32'h100002),
//             .inj_err(inj_error),
//             .inv_chicken(2'b00),
//             .out(din[i])
//         );
//     end
// endgenerate

// Data + positive
hr_16t4_mux_top hr_mux_16t4_0 (
    .clk_hr(clk_halfrate), // This is a divided (by 2) clock from quarter-rate 4 to 1 mux
    .clk_prbs(clk_prbsgen),
    .din(din_reorder),
    .rst(rst),
    .dout(qr_data_p)
);

//Instantiate quarter-rate 4 to 1 mux top
qr_4t1_mux_top qr_mux_4t1_0 (
    .clk_Q(clk_interp_slice[0]),  // Quarter-rate clock input
    .clk_QB(clk_interp_slice[2]),
    .clk_I(clk_interp_slice[1]),
    .clk_IB(clk_interp_slice[3]),
    .din(qr_data_p), // Quarter-rate data from half-rate 16 to 4 mux
    .rst(rst),
    .data(mtb_p) // Final data output + positive Output driver and termination needs to be added
);

// Data - negative
hr_16t4_mux_top hr_mux_16t4_1 (
    .clk_hr(clk_halfrate), // This is a divided (by 2) clock from quarter-rate 4 to 1 mux
    .clk_prbs(clk_prbsgen),
    .din(~din_reorder), // Inverting the data input for differential output
    .rst(rst),
    .dout(qr_data_n)
);

//Instantiate quarter-rate 4 to 1 mux top
qr_4t1_mux_top qr_mux_4t1_1 (
    .clk_Q(clk_interp_slice[0]),  // Quarter-rate clock input
    .clk_QB(clk_interp_slice[2]),
    .clk_I(clk_interp_slice[1]),
    .clk_IB(clk_interp_slice[3]),
    .din(qr_data_n), // Quarter-rate data from half-rate 16 to 4 mux
    .rst(rst),
    .data(mtb_n) // Final data output - negative Output driver and termination needs to be added
);

div_b2 div0 (.clkin(clk_interp_slice[2]), .rst(rst), .clkout(clk_halfrate));  // 4GHz to 2GHz, output goes to hr_16t4_mux
inv clk_inv(.in(clk_halfrate), .out(clk_halfrate_n));
div_b2 div1 (.clkin(clk_halfrate_n), .rst(rst), .clkout(clk_prbsgen));  // 2GHz to 1GHz, output goes to prbs_gen

// Instantiate the output buf
// output_buf_tx buf1 (
//     .DINN(mtb_n),
//     .DINP(mtb_p),
//     .CTL_SLICE_N0(ctl_buf_n0),
//     .CTL_SLICE_N1(ctl_buf_n1),
//     .CTL_SLICE_P0(ctl_buf_p0),
//     .CTL_SLICE_P1(ctl_buf_p1),
//     .DOUTN(dout_n),
//     .DOUTP(dout_p)
// );

////Test purpose, delete it after test//
//assign dout_n = mtb_n;                //
//assign dout_p = mtb_p;                //
////////////////////////////////////////

endmodule

`default_nettype wire
