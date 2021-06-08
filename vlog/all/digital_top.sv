`timescale 1fs/1fs   //  unit_time / time precision

`default_nettype none

module digital_top (
     // input wire logic [15:0] din,
     // input wire logic mdll_clk, // Clock from MDLL
     // input wire logic ext_clk, // Clock from external source
     // input wire logic clk_prbs,

    input wire logic rst, // Global reset for Tx
    input wire logic rst_prbs,
    // input wire logic [31:0] init_vals [16],
    input wire logic inj_error,
    // input wire logic [Npi-1:0] ctl_pi [Nout-1:0],
    // input wire logic clk_async,
    // input wire logic clk_encoder,
    // input wire logic ctl_valid,
    input wire logic clk_interp_slice_0,
    input wire logic clk_interp_slice_1,
    input wire logic clk_interp_slice_2,
    input wire logic clk_interp_slice_3,
    // output buffer control
    // input wire logic [17:0] ctl_buf_n0,
    // input wire logic [17:0] ctl_buf_n1,
    // input wire logic [17:0] ctl_buf_p0,
    // input wire logic [17:0] ctl_buf_p1,
    input wire logic [5:0] CTL_BUF_N,
    input wire logic [5:0] CTL_BUF_P,

    // output wire logic clk_prbsgen,  // Output clock for 16-bit prbs generator
    output wire logic dout_p, // Data output
    output wire logic dout_n
    // tx_debug_intf.tx tx
);

// logic [15:0] prbsdata;

wire [3:0] qr_data_p;  // Output of 16 to 4 mux, positive
wire [3:0] qr_data_n;  // Output of 16 to 4 mux, negative
wire clk_halfrate;  // Input clock for 16 to 4 mux
// wire logic clk_halfrate_n;
// wire logic clk_prbsgen;

wire logic mtb_n;  // mux to buffer -
wire logic mtb_p;  // mux to buffer +

wire logic [15:0] din;
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

logic [31:0] init_vals [16];
assign init_vals[0]  = 32'h0ffd4066;
assign init_vals[1]  = 32'h38042b00;
assign init_vals[2]  = 32'h001fffff;
assign init_vals[3]  = 32'h39fbfe59;
assign init_vals[4]  = 32'h1ffd40cc;
assign init_vals[5]  = 32'h3e055e6a;
assign init_vals[6]  = 32'h03ff554c;
assign init_vals[7]  = 32'h3e0aa195;
assign init_vals[8]  = 32'h1f02aa60;
assign init_vals[9]  = 32'h31f401f3;
assign init_vals[10] = 32'h00000555;
assign init_vals[11] = 32'h300bab55;
assign init_vals[12] = 32'h1f05559f;
assign init_vals[13] = 32'h3f8afe65;
assign init_vals[14] = 32'h07ff5566;
assign init_vals[15] = 32'h7f8afccf;

assign dout_n = mtb_n;
assign dout_p = mtb_p;

genvar i;  // Declare the generate variable
generate
    for(i=0; i<16; i=i+1) begin
        prbs_generator_syn #(
            .n_prbs(32)
        ) prbs_b (
            .clk(clk_prbsgen),
            .rst(rst_prbs),
            .cke(1'b1),
            .init_val(init_vals[i]),
            .eqn(32'h100002),
            .inj_err(inj_error),
            .inv_chicken(2'b00),
            .out(din[i])
        );
    end
endgenerate

// Data + positive
hr_16t4_mux_top hr_mux_16t4_0 (
    .clk_hr(clk_halfrate), // This is a divided (by 2) clock from quarter-rate 4 to 1 mux
    .din(din_reorder),
    .rst(rst),
    .dout(qr_data_p)
);

//Instantiate quarter-rate 4 to 1 mux top
qr_4t1_mux_top qr_mux_4t1_0 (
    .clk_Q(clk_interp_slice_0),  // Quarter-rate clock input
    .clk_QB(clk_interp_slice_2),
    .clk_I(clk_interp_slice_1),
    .clk_IB(clk_interp_slice_3),
    .din(qr_data_p), // Quarter-rate data from half-rate 16 to 4 mux
    .rst(rst),
    .data(mtb_p) // Final data output + positive Output driver and termination needs to be added
);

// Data - negative
hr_16t4_mux_top hr_mux_16t4_1 (
    .clk_hr(clk_halfrate), // This is a divided (by 2) clock from quarter-rate 4 to 1 mux
    .din(~din_reorder), // Inverting the data input for differential output
    .rst(rst),
    .dout(qr_data_n)
);

//Instantiate quarter-rate 4 to 1 mux top
qr_4t1_mux_top qr_mux_4t1_1 (
    .clk_Q(clk_interp_slice_0),  // Quarter-rate clock input
    .clk_QB(clk_interp_slice_2),
    .clk_I(clk_interp_slice_1),
    .clk_IB(clk_interp_slice_3),
    .din(qr_data_n), // Quarter-rate data from half-rate 16 to 4 mux
    .rst(rst),
    .data(mtb_n) // Final data output - negative Output driver and termination needs to be added
);

div_b2 div0 (.clkin(clk_interp_slice_2), .rst(rst), .clkout(clk_halfrate));  // 4GHz to 2GHz, output goes to hr_16t4_mux
// inv clk_inv(.in(clk_halfrate), .out(clk_halfrate_n));
// div_b2 div1 (.clkin(clk_halfrate_n), .rst(rst), .clkout(clk_prbsgen));  // 2GHz to 1GHz, output goes to prbs_gen


// control decoder for the output buffer
logic [39:0] CTL_N;
logic [39:0] CTL_P;

always @( * ) begin
    case (CTL_BUF_N)
        6'd0: begin
            CTL_N=40'd0;
        end
        6'd1: begin
            CTL_N=40'd1;
        end
        6'd2: begin
            CTL_N=40'd3;
        end
        6'd3: begin
            CTL_N=40'd7;
        end
        6'd4: begin
            CTL_N=40'd15
        end
        6'd5: begin
            CTL_N=40'd31;
        end
        6'd6: begin
            CTL_N=40'd63;
        end
        6'd7: begin
            CTL_N=40'd127;
        end
        6'd8: begin
            CTL_N=40'd255;
        end
        6'd9: begin
            CTL_N=40'd511;
        end
        6'd10: begin
            CTL_N=40'd1023;
        end
        6'd11: begin
            CTL_N=40'd2047;
        end
        6'd12: begin
            CTL_N=40'd4095;
        end
        6'd13: begin
            CTL_N=40'd8191;
        end
        6'd14: begin
            CTL_N=40'd16383;
        end
        6'd15: begin
            CTL_N=40'd32767;
        end
        6'd16: begin
            CTL_N=40'd65535;
        end
        6'd17: begin
            CTL_N=40'd131071;
        end
        6'd18: begin
            CTL_N=40'd262143;
        end
        6'd19: begin
            CTL_N=40'd524287;
        end
        6'd20: begin
            CTL_N=40'd1048575;
        end
        6'd21: begin
            CTL_N=40'd2097151;
        end
        6'd22: begin
            CTL_N=40'd4194303;
        end
        6'd23: begin
            CTL_N=40'd8388607;
        end
        6'd24: begin
            CTL_N=40'd16777215;
        end
        6'd25: begin
            CTL_N=40'd33554431;
        end
        6'd26: begin
            CTL_N=40'd67108863;
        end
        6'd27: begin
            CTL_N=40'd134217727;
        end
        6'd28: begin
            CTL_N=40'd268435455;
        end
        6'd29: begin
            CTL_N=40'd536870911;
        end
        6'd30: begin
            CTL_N=40'd1073741823;
        end
        6'd31: begin
            CTL_N=40'd2147483647;
        end
        6'd32: begin
            CTL_N=40'd4294967295;
        end
        6'd33: begin
            CTL_N=40'd8589934591;
        end
        6'd34: begin
            CTL_N=40'd17179869183;
        end
        6'd35: begin
            CTL_N=40'd34359738367;
        end
        6'd36: begin
            CTL_N=40'd68719476735;
        end
        6'd37: begin
            CTL_N=40'd137438953471;
        end
        6'd38: begin
            CTL_N=40'd274877906943;
        end
        6'd39: begin
            CTL_N=40'd549755813887;
        end   
        6'd40: begin
            CTL_N=40'd1099511627775;
        end
    endcase
end

always @( * ) begin
    case (CTL_BUF_N)
        6'd0: begin
            CTL_P=40'd0;
        end
        6'd1: begin
            CTL_P=40'd1;
        end
        6'd2: begin
            CTL_P=40'd3;
        end
        6'd3: begin
            CTL_P=40'd7;
        end
        6'd4: begin
            CTL_P=40'd15
        end
        6'd5: begin
            CTL_P=40'd31;
        end
        6'd6: begin
            CTL_P=40'd63;
        end
        6'd7: begin
            CTL_P=40'd127;
        end
        6'd8: begin
            CTL_P=40'd255;
        end
        6'd9: begin
            CTL_P=40'd511;
        end
        6'd10: begin
            CTL_P=40'd1023;
        end
        6'd11: begin
            CTL_P=40'd2047;
        end
        6'd12: begin
            CTL_P=40'd4095;
        end
        6'd13: begin
            CTL_P=40'd8191;
        end
        6'd14: begin
            CTL_P=40'd16383;
        end
        6'd15: begin
            CTL_P=40'd32767;
        end
        6'd16: begin
            CTL_P=40'd65535;
        end
        6'd17: begin
            CTL_P=40'd131071;
        end
        6'd18: begin
            CTL_P=40'd262143;
        end
        6'd19: begin
            CTL_P=40'd524287;
        end
        6'd20: begin
            CTL_P=40'd1048575;
        end
        6'd21: begin
            CTL_P=40'd2097151;
        end
        6'd22: begin
            CTL_P=40'd4194303;
        end
        6'd23: begin
            CTL_P=40'd8388607;
        end
        6'd24: begin
            CTL_P=40'd16777215;
        end
        6'd25: begin
            CTL_P=40'd33554431;
        end
        6'd26: begin
            CTL_P=40'd67108863;
        end
        6'd27: begin
            CTL_P=40'd134217727;
        end
        6'd28: begin
            CTL_P=40'd268435455;
        end
        6'd29: begin
            CTL_P=40'd536870911;
        end
        6'd30: begin
            CTL_P=40'd1073741823;
        end
        6'd31: begin
            CTL_P=40'd2147483647;
        end
        6'd32: begin
            CTL_P=40'd4294967295;
        end
        6'd33: begin
            CTL_P=40'd8589934591;
        end
        6'd34: begin
            CTL_P=40'd17179869183;
        end
        6'd35: begin
            CTL_P=40'd34359738367;
        end
        6'd36: begin
            CTL_P=40'd68719476735;
        end
        6'd37: begin
            CTL_P=40'd137438953471;
        end
        6'd38: begin
            CTL_P=40'd274877906943;
        end
        6'd39: begin
            CTL_P=40'd549755813887;
        end   
        6'd40: begin
            CTL_P=40'd1099511627775;
        end
    endcase
end


// Instantiate the output buf

output_buffer ibuf (
    .inn(mtb_n),
    .inp(mtb_p),
    .CTL_N0(CTL_N[19:0]),
    .CTL_N1(CTL_N[39:20]),
    .CTL_P0(CTL_P[19:0]),
    .CTL_P1(CTL_P[39:20]),
    .out_p(dout_p),
    .out_n(dout_n)
);

////Test purpose, delete it after test//
//assign dout_n = mtb_n;                //
//assign dout_p = mtb_p;                //
////////////////////////////////////////

endmodule

`default_nettype wire
