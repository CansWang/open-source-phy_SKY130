module ff_c #(
    parameter real td = 15.0e-12,    // nominal delay in sec
    parameter real td_std = 0.0,         // std dev of nominal delay variation in sec
    parameter real rj_rms = 0.0          // rms random jitter in sec
) (
    input D,
    input CP,
    output reg Q
);
    // use precise timing
    timeunit 1fs;
    timeprecision 1fs;

    // implement gate behavior
    always @(posedge CP) begin
        Q <= #((td)*1s) D;
    end
endmodule

