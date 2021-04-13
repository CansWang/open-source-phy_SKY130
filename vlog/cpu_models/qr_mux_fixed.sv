module qr_mux_fixed #(
    ////////////////////////////////////
    // TODO: update this!             //
    parameter real td = 2.3e-11,  //
    ////////////////////////////////////
    parameter real td_std = 0.0,  // std dev of nominal delay variation in sec
    parameter real rj_rms = 0.0   // rms random jitter in sec
) (
    input wire logic DIN0,
	input wire logic DIN1,
	input wire logic DIN2,
	input wire logic DIN3,
    input wire logic E0,
	input wire logic E1,
    output reg DOUT 
);

timeunit 1fs;
timeprecision 1fs;

///////////////////////////
// Model Body
///////////////////////////

always @(*) begin
    case ({E1, E0}) 
        2'b00: DOUT <= #((td)*1s) ~DIN0;
        2'b01: DOUT <= #((td)*1s) ~DIN1;
        2'b10: DOUT <= #((td)*1s) ~DIN2;
        2'b11: DOUT <= #((td)*1s) ~DIN3;
    endcase
end

endmodule