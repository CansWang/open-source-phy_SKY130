module qr_mux_fixed (
    input wire logic DIN0,
    input wire logic DIN1,
    input wire logic DIN2,
    input wire logic DIN3,
    input wire logic E0,
    input wire logic E1,
    output wire DOUT
);

assign DOUT = E1 ? (E0 ? DIN3 : DIN2) : (E0 ? DIN1 : DIN0);

endmodule
