// Level triggered programmable counter
// 
module level_triggered_prog_counter (
    input clk_out,
    input [5:0] div_ratio_half,
    input ref_clk,
    input rst,
    output reg out_star,
    output reg out_star_bar
);

logic [5:0] osc_clk_count;

assign out_star_bar = ~out_star;
assign asyn_reset_div_ratio_half = div_ratio_half + 1'b1;



// 

// To be filled with a small FSM

//  








endmodule