module osc_core (
    input glob_en,
    input [3:0] delay_con_lsb,
    input [6:0] delay_con_msb,
    input [3:0] con_perb,

    output osc_000,
    output osc_036,
    output osc_072,
    output osc_108,
    output osc_144

// 
// waiting to integrate the ref_injector
//  

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
    .out(osc_036)
);

// 2ND STAGE

delay_cell_osc del2 (
    .in(osc_036),
    .out(osc_072)
);

// 3RD STAGE

delay_cell_osc del3 (
    .in(osc_072),
    .out(osc_0108)
);

// 4TH STAGE

delay_cell_osc del4 (
    .in(osc_108),
    .out(osc_144)
);

// 5TH STAGE

delay_cell_osc del4 (
    .in(osc_144),
    .out(osc_000)
);


// DIGITAL VARACTOR BANK
// 1ST








