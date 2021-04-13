module tx_inv (
    input wire logic DIN,
    output wire DOUT
);

assign DOUT = ~(DIN);

endmodule
