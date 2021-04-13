module tx_inv (
    input wire logic DIN,                // input signal
    output wire logic DOUT               // delayed output signal
);

assign DOUT = ~DIN;

endmodule
