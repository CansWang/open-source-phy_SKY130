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
    // input wire logic clk_interp_slice_0,
    // input wire logic clk_interp_slice_1,
    // input wire logic clk_interp_slice_2,
    // input wire logic clk_interp_slice_3,
    // output buffer control
    input wire logic [5:0] CTL_BUF_N,
    input wire logic [5:0] CTL_BUF_P,
    input wire logic osc_en,
    input wire logic aux_osc_en,
    input wire logic inj_en,
    input wire logic fftl_en,
    input wire logic [3:0] con_perb,
    input wire logic [5:0] div_ratio_half,
    input wire logic [4:0] fine_control_avg_window_select,
    input wire logic [3:0] fine_con_step_size,
    input wire logic [12:0] manual_control_osc,


// Test MUX Select 

    input wire logic [2:0] test_mux_select,

// End

    // output wire logic clk_prbsgen,  // Output clock for 16-bit prbs generator
    output wire logic dout_p, // Data output
    output wire logic dout_n,
    output wire logic test_inj_hold,
    output wire logic test_inj_out
    // tx_debug_intf.tx tx



);

// logic [15:0] prbsdata;

wire [3:0] qr_data_p;  // Output of 16 to 4 mux, positive
wire [3:0] qr_data_n;  // Output of 16 to 4 mux, negative
wire clk_halfrate;  // Input clock for 16 to 4 mux
// wire logic clk_halfrate_n;
wire logic clk_prbsgen;
wire logic din_2_dummy;
wire logic din_3_dummy;
wire logic D1DQB_dummy;
wire logic D1DIB_dummy;
wire logic mux_out_dummy_0;
wire logic mux_out_dummy_1;

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
        prbs_generator_syn prbs_b (
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
    .clk(clk_interp_slice_2), // This is a divided (by 2) clock from quarter-rate 4 to 1 mux
    .clk_prbs(clk_prbsgen),
    .din(din_reorder),
    .rst(rst),
    .dout(qr_data_p)
);

wire logic ck_Q;
wire logic ck_I;
wire logic ck_QB;
wire logic ck_IB;
wire logic pi1;
wire logic pi2;
wire logic pi3;
wire logic pi4;
wire logic pi5;


assign ck_Q= (osc_en) ? pi1:1'bz;
assign ck_I= (osc_en) ? pi3:1'bz;
assign ck_QB= (osc_en) ? (~pi1):1'bz;
assign ck_IB= (osc_en) ? (~pi3):1'bz;


//Instantiate quarter-rate 4 to 1 mux top
qr_4t1_mux_top qr_mux_4t1_0 (
    .clk_Q(ck_Q),  // Quarter-rate clock input
    .clk_QB(ck_I),
    .clk_I(ck_QB),
    .clk_IB(ck_IB),
    .din(qr_data_p), // Quarter-rate data from half-rate 16 to 4 mux
    .rst(rst),
    .din_2_dummy(din_2_dummy),
    .din_3_dummy(din_3_dummy),
    .D1DQB_dummy(D1DQB_dummy),
    .D1DIB_dummy(D1DIB_dummy),
    .mux_out_dummy(mux_out_dummy_0),
    .data(mtb_p) // Final data output + positive Output driver and termination needs to be added
);

// Data - negative
hr_16t4_mux_top hr_mux_16t4_1 (
    .clk(clk_interp_slice_2), // This is a divided (by 2) clock from quarter-rate 4 to 1 mux
    .clk_prbs(clk_prbsgen),
    .din(~din_reorder), // Inverting the data input for differential output
    .rst(rst),
    .dout(qr_data_n)
);

//Instantiate quarter-rate 4 to 1 mux top
qr_4t1_mux_top qr_mux_4t1_1 (
    .clk_Q(ck_Q),  // Quarter-rate clock input
    .clk_QB(ck_I),
    .clk_I(ck_QB),
    .clk_IB(ck_IB),
    .din(qr_data_n), // Quarter-rate data from half-rate 16 to 4 mux
    .rst(rst),
    .din_2_dummy(din_2_dummy),
    .din_3_dummy(din_3_dummy),
    .D1DQB_dummy(D1DQB_dummy),
    .D1DIB_dummy(D1DIB_dummy),
    .mux_out_dummy(mux_out_dummy_1),
    .data(mtb_n) // Final data output - negative Output driver and termination needs to be added
);

// div_b2 div0 (.clkin(clk_interp_slice_2), .rst(rst), .clkout(clk_halfrate));  // 4GHz to 2GHz, output goes to hr_16t4_mux
// inv clk_inv(.in(clk_halfrate), .out(clk_halfrate_n));
// div_b2 div1 (.clkin(clk_halfrate_n), .rst(rst), .clkout(clk_prbsgen));  // 2GHz to 1GHz, output goes to prbs_gen

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
            CTL_N=40'd15;
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
    case (CTL_BUF_P)
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
            CTL_P=40'd15;
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
    .BTN(dout_p),
    .BTP(dout_n)
);







wire logic osc_000;
wire logic osc_036;
wire logic osc_072;
wire logic osc_108;
wire logic osc_144;
wire logic [12:0] osc_con;




// ANALOG TOP Here!

osc_core osc_inst (
.glob_en(osc_en),
.delay_con_lsb(osc_con[4:0]),
.delay_con_msb(osc_con[12:5]),
.con_perb_1(),
.con_perb_2(),
.con_perb_3(),
.con_perb_4(),
.con_perb_5(),
.ref_clk(ref_clk),

// PI control
.pi1_l(),
.pi1_r(),
.pi2_l(),
.pi2_r(),
.pi3_l(),
.pi3_r(),
.pi4_l(),
.pi4_r(),
.pi5_l(),
.pi5_r(),
        

.osc_000(osc_000),
.osc_036(osc_036),
.osc_072(osc_072),
.osc_108(osc_108),
.osc_144(osc_144),

// 
// waiting to integrate the ref_injector
//  

.inj_en(inj_en),
.inj_out(test_inj_out), // 
.osc_hold(test_inj_hold), // 

// 
// buffered output phase, goes to phase blender
// 

.p1(pi1),
.p2(pi2),
.p3(pi3),
.p4(pi4),
.p5(pi5)

);

// Fine tracking loop

fine_freq_track ftl (

.clk_out(pi),
.div_ratio_half(div_ratio_half),
.ref_clk(ref_clk),
.rst(rst),
.aux_osc_en(aux_osc_en),

.fine_control_avg_window_select(fine_control_avg_window_select),
.aux_in(),
.fine_con_step_size(fine_con_step_size),
.out_star(test_out_star),

// output accumu_select, // Decide the current rising edge sample goes into which category
.fftl_en(fftl_en), // This enable controls whether to bypass the loop or not
.manual_control_osc(manual_control_osc),
.osc_fine_con_final(osc_con)

);


// test mux




endmodule

`default_nettype wire
