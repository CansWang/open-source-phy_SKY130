// Level triggered programmable counter
// 
module fine_freq_track (
    input clk_out,
    input [5:0] div_ratio_half,
    input ref_clk,
    input rst,
    input aux_osc_en,
    input [21:0] fine_control_avg_window,
    output out_star,
    // output accumu_select, // Decide the current rising edge sample goes into which category
    output [7:0] osc_fine_con
);

logic [5:0] osc_clk_count;
logic [5:0] toggle_flag;
assign toggle_flag = div_ratio_half - 1;

// Synchronize the ref_clk with clk_out to avoid metastability

logic accumu_select;
always @(posedge clk_out, posedge rst) begin
    accumu_select = ref_clk;
end

// rising edge counter of the osc clock

// logic [5:0] osc_clk_count;

always @(posedge clk_out, posedge rst) begin
    if (osc_clk_count < toggle_flag) begin
        osc_clk_count = osc_clk_count + 1;
    end else if (osc_clk_count == toggle_flag) begin
        out_star = 1'b1;
    end
end

// Synchronized ref_clk reset for out star and osc_clk_counter
always @(posedge accumu_select, negedge accumu_select, posedge rst) begin
    osc_clk_count = 6'b000000;
    out_star = 1'b0;
end

// hit and accum
logic sample_hit;

double_esampler esample (
    .aux_clk(aux_clk_xyz),
    .osc_out_star(out_star),
    .hit(sample_hit)
);

// The hit will be sampled by accumu_select, for positive transition of
// accumu_select, the results should be recorded as free_running error
// for negative transition, it should be counted as the less error accumulated
// clean cycle.

logic [24:0] stat_error;
logic [24:0] stat_clean;

// Error count accumulator
always @( posedge accumu_select ) begin
    if (sample_hit) begin
        stat_error = stat_error + 1'b1;
    end
end

always @( negedge accumu_select ) begin
    if (sample_hit) begin
        stat_clean = stat_clean + 1'b1;
    end
end 
// END

// Commit clk for the averaging results, also resets the accumulator.
logic [21:0] ref_clk_count;
always @(posedge ref_clk) begin
    if (rst) begin
        ref_clk_count = fine_control_avg_window;
    end else if (ref_clk_count > 0) begin
        ref_clk_count = ref_clk_count - 1;
    end else if (ref_clk_count == 22'd0) begin
        ref_clk_count = fine_control_avg_window;
        // Add reset for accumulator
        stat_error = 25'd0;
        stat_clean = 25'd0;
    end
end


// Compare the accumulated hit counts
localparam STATE_UP = 3'd0;
localparam STATE_DN = 3'd1;
localparam STATE_UC = 3'd2;
localparam STATE_RS = 3'd3;
reg [2:0] CurrentState;

assign CurrentState = (stat_clean == stat_error)? STATE_UC:(stat_clean < stat_error)? STATE_UP:STATE_DN;

always @( * ) begin
    case (CurrentState)
    STATE_UP: begin
        osc_fine_con = osc_fine_con + 1'b1;
    end
    STATE_DN: begin
        osc_fine_con = osc_fine_con - 1'b1;
    end
    STATE_UC: begin
        osc_fine_con = osc_fine_con + 1'b0;
    end
    STATE_RS: begin
        osc_fine_con = 8'b10000000;
    end
    endcase
end

// AUX osc

logic aux_clk_xyz;

aux_core aux_osc (
    .glob_en(aux_osc_en),
    .osc_000(aux_clk_xyz)
);

// 

endmodule