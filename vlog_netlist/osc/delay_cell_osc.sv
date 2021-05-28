module delay_cell_osc (
    input in,
    input en,
    output out
);

////////////////////////////
// Explicit Instantiation //
////////////////////////////

// USE THE HD LIB/ REPLACE WITH HS LIB
// 6 stdcells per stage, matching and lower flickr noise

generate
    for (genvar i=0; i<5; i=i+1)
    sky130_fd_sc_hs__nand2_8 inand (
        .A(in),
        .B(en),
        .Y(out)
    );
endgenerate

endmodule
