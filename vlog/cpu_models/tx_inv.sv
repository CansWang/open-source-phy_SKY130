module tx_inv #(
    parameter real td = 15.0e-12,    // nominal delay in sec
    parameter real td_std = 0.0,         // std dev of nominal delay variation in sec
    parameter real rj_rms = 0.0          // rms random jitter in sec
) (
    input wire logic DIN,                // input signal
    output wire logic DOUT               // delayed output signal
);

timeunit 1fs;
timeprecision 1fs;


///////////////////////////
// Model Body
///////////////////////////

// assign to the output using an inertial delay
// ref: http://www-inst.eecs.berkeley.edu/~cs152/fa06/handouts/CummingsHDLCON1999_BehavioralDelays_Rev1_1.pdf
assign #((td)*1s) DOUT = ~DIN;

endmodule