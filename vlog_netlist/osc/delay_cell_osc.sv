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
genvar i;
generate
    for (i=0; i<2; i++) begin iDEL
    sky130_fd_sc_hd__nand2_8 inand (
        .A(in),
        .B(en),
        .Y(out)
    );
endgenerate

endmodule
