module qr_mux_fixed (
    input wire logic DIN0,
	input wire logic DIN1,
	input wire logic DIN2,
	input wire logic DIN3,
    input wire logic E0,
	input wire logic E1,
    output reg DOUT
);

sky130_fd_sc_hs__mux4_4 mux(.X(DOUT), .A0(DIN0), .A1(DIN1), .A2(DIN2), .A3(DIN3), .S0(E0), .S1(E1));

endmodule
