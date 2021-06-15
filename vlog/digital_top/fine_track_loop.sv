// Level triggered programmable counter
// 
module fine_freq_track (
    input clk_out,
    input [5:0] div_ratio_half,
    input ref_clk,
    input rst,
    input aux_osc_en,
    input fftl_en,
    input [4:0] fine_control_avg_window_select,
    input aux_in,
    input [3:0] fine_con_step_size,
    input [12:0] manual_control_osc,
    output reg out_star,
    // output accumu_select, // Decide the current rising edge sample goes into which category
    output reg [12:0] osc_fine_con_final
    // TODO add FSM for osc_fine_con[7:0]
 
);

// 
endmodule