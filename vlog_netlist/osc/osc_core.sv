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
    output osc_hold


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
    .en(osc_hold),
    .out(osc_036)
);

// 2ND STAGE, inject in this stage

delay_cell_osc del2 (
    .in(osc_036),
    .en(inj_out),
    .out(osc_072)
);

// 3RD STAGE

delay_cell_osc del3 (
    .in(osc_072),
    .en(glob_en),
    .out(osc_108)
);

// 4TH STAGE

delay_cell_osc del4 (
    .in(osc_108),
    .en(glob_en),
    .out(osc_144)
);

// 5TH STAGE

delay_cell_osc del5 (
    .in(osc_144),
    .en(glob_en),
    .out(osc_000)
);


// DIGITAL VARACTOR BANK
// 1ST
digital_varactor_bank capbank1 (
    .delay_con_lsb(delay_con_lsb_1),
    .delay_con_msb(delay_con_msb_1),
    .con_perb(con_perb_1),
    .ref_clk(ref_clk),
    .var_out(osc_036)
);
//2ND
digital_varactor_bank capbank2 (
    .delay_con_lsb(delay_con_lsb_2),
    .delay_con_msb(delay_con_msb_2),
    .con_perb(con_perb_2),
    .ref_clk(ref_clk),
    .var_out(osc_072)
);
//3RD
digital_varactor_bank capbank3 (
    .delay_con_lsb(delay_con_lsb_3),
    .delay_con_msb(delay_con_msb_3),
    .con_perb(con_perb_3),
    .ref_clk(ref_clk),
    .var_out(osc_108)
);
//4TH
digital_varactor_bank capbank4 (
    .delay_con_lsb(delay_con_lsb_4),
    .delay_con_msb(delay_con_msb_4),
    .con_perb(con_perb_4),
    .ref_clk(ref_clk),
    .var_out(osc_144)
);
//5TH
digital_varactor_bank capbank5 (
    .delay_con_lsb(delay_con_lsb_5),
    .delay_con_msb(delay_con_msb_5),
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




