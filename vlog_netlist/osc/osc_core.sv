module osc_core (
    input glob_en,
    input [4:0] delay_con_lsb,
    input [7:0] delay_con_msb,
    input [3:0] con_perb_1,
    input [3:0] con_perb_2,
    input [3:0] con_perb_3,
    input [3:0] con_perb_4,
    input [3:0] con_perb_5,
    input ref_clk,

// PI control
    input [3:0] pi1_l,
    input [3:0] pi1_r,
    input [3:0] pi2_l,
    input [3:0] pi2_r,
    input [3:0] pi3_l,
    input [3:0] pi3_r,
    input [3:0] pi4_l,
    input [3:0] pi4_r,
    input [3:0] pi5_l,
    input [3:0] pi5_r,
        

    output osc_000,
    output osc_036,
    output osc_072,
    output osc_108,
    output osc_144,

// 
// waiting to integrate the ref_injector
//  

    input inj_en,
    output inj_out,
    output osc_hold,

    output p1,
    output p2,
    output p3,
    output p4,
    output p5


// 
// buffered output phase, goes to phase blender
// 

);

////////////////////////////
// Explicit Instantiation //
////////////////////////////

// FIVE STAGE SINGLE END RING OSCILLATOR

// 1ST STAGE

delay_cell_osc del1 (
    .in(osc_000),
    .en(glob_en),
    .out(osc_036)
);

phase_interpolator pi1 (
    .l_phase(osc_000),
    .r_phase(osc_036),
    .l_con(pi1_l),
    .r_con(pi1_r),
    .ckout(p1)
);


// 2ND STAGE, inject in this stage

delay_cell_osc del2 (
    .in(osc_036),
    .en(osc_hold),
    .out(osc_072)
);

phase_interpolator pi2 (
    .l_phase(osc_036),
    .r_phase(osc_000),
    .l_con(pi2_l),
    .r_con(pi2_r),
    .ckout(p2)
);

// 3RD STAGE

delay_cell_osc del3 (
    .in(osc_072),
    .en(inj_out),
    .out(osc_108)
);

phase_interpolator pi3 (
    .l_phase(osc_072),
    .r_phase(osc_108),
    .l_con(pi3_l),
    .r_con(pi3_r),
    .ckout(p3)
);

// 4TH STAGE

delay_cell_osc del4 (
    .in(osc_108),
    .en(glob_en),
    .out(osc_144)
);

phase_interpolator pi4 (
    .l_phase(osc_108),
    .r_phase(osc_144),
    .l_con(pi4_l),
    .r_con(pi4_r),
    .ckout(p4)
);

// 5TH STAGE

delay_cell_osc del5 (
    .in(osc_144),
    .en(glob_en),
    .out(osc_000)
);

phase_interpolator pi5 (
    .l_phase(osc_144),
    .r_phase(osc_000),
    .l_con(pi5_l),
    .r_con(pi5_r),
    .ckout(p5)
);

// DIGITAL VARACTOR BANK
// 1ST
digital_varactor_bank capbank1 (
    .delay_con_lsb(delay_con_lsb),
    .delay_con_msb(delay_con_msb),
    .con_perb(con_perb_1),
    .ref_clk(ref_clk),
    .var_out(osc_036)
);
//2ND
digital_varactor_bank capbank2 (
    .delay_con_lsb(delay_con_lsb),
    .delay_con_msb(delay_con_msb),
    .con_perb(con_perb_2),
    .ref_clk(ref_clk),
    .var_out(osc_072)
);
//3RD
digital_varactor_bank capbank3 (
    .delay_con_lsb(delay_con_lsb),
    .delay_con_msb(delay_con_msb),
    .con_perb(con_perb_3),
    .ref_clk(ref_clk),
    .var_out(osc_108)
);
//4TH
digital_varactor_bank capbank4 (
    .delay_con_lsb(delay_con_lsb),
    .delay_con_msb(delay_con_msb),
    .con_perb(con_perb_4),
    .ref_clk(ref_clk),
    .var_out(osc_144)
);
//5TH
digital_varactor_bank capbank5 (
    .delay_con_lsb(delay_con_lsb),
    .delay_con_msb(delay_con_msb),
    .con_perb(con_perb_5),
    .ref_clk(ref_clk),
    .var_out(osc_000)
);

// Edge Injector

logic osc_hold;

edge_injector einj (
    .ref_clk(ref_clk), // ref_clk input
    .inj_en(inj_en), // Enable of the injector
    .inj_out(inj_out), // To injected stage
    .osc_hold(osc_hold) // To stop the oscillation before the injected stage
);



endmodule




