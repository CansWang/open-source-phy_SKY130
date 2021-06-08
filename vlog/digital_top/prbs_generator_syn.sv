`default_nettype none

module prbs_generator_syn #(
    parameter integer n_prbs=32
) (
    // basic clock and reset for this block
    input wire logic clk,
    input wire logic rst,

    // clock gating
    input wire logic cke,

    // define the PRBS initialization
    input wire logic [(n_prbs-1):0] init_val,

    // define the PRBS equation
    input wire logic [(n_prbs-1):0] eqn,

    // signal for injecting errors
    input wire logic inj_err,

    // "chicken" bits for flipping the sign of various bits
    input wire logic [1:0] inv_chicken,

    // output
    output wire logic out
);

endmodule

`default_nettype wire
