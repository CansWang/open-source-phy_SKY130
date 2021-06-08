module aux_core (
    input glob_en,
    output osc_000,
    output osc_030,
    output osc_060,
    output osc_090,
    output osc_120,
    output osc_150,
    output osc_180
);
    




// FIVE STAGE SINGLE END RING OSCILLATOR

// 1ST STAGE

delay_cell_osc del1 (
    .in(osc_000),
    .en(glob_en),
    .out(osc_030)
);

// 2ND STAGE

delay_cell_osc del2 (
    .in(osc_030),
    .en(glob_en),
    .out(osc_060)
);

// 3RD STAGE

delay_cell_osc del3 (
    .in(osc_060),
    .en(glob_en),
    .out(osc_90)
);

// 4TH STAGE

delay_cell_osc del4 (
    .in(osc_90),
    .en(glob_en),
    .out(osc_120)
);

// 5TH STAGE

delay_cell_osc del5 (
    .in(osc_120),
    .en(glob_en),
    .out(osc_150)
);

delay_cell_osc del6 (
    .in(osc_150),
    .en(glob_en),
    .out(osc_180)
);

delay_cell_osc del7 (
    .in(osc_180),
    .en(glob_en),
    .out(osc_000)
);

endmodule