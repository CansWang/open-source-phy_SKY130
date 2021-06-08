// Level triggered programmable counter
// 
module fine_freq_track_wo_osc (
    input clk_out,
    input [5:0] div_ratio_half,
    input ref_clk,
    input rst,
    input aux_osc_en,
    input [4:0] fine_control_avg_window_select,
    input aux_in,
    input [3:0] fine_con_step_size,
    output reg out_star,
    // output accumu_select, // Decide the current rising edge sample goes into which category
    output reg [7:0] osc_fine_con
    // TODO add FSM for osc_fine_con[7:0]
 
);


logic aux_clk_out;
logic [5:0] osc_clk_count;
logic [5:0] toggle_flag;

// Synchronize the ref_clk with clk_out to avoid metastability

logic accumu_select;
always @(posedge clk_out, posedge rst) begin
    if (rst) begin
        accumu_select = 0;
    end else begin
        accumu_select = ref_clk;
    end
end

// OUT_STAR generation!!!
// rising edge counter of the osc clock
logic out_star_b;
assign out_star_b = ~out_star;
assign toggle_flag = div_ratio_half-1;
logic OS_CNT_RS;
assign OS_CNT_RS = (osc_clk_count==toggle_flag)?1:0;
logic sync_flag;

always @( posedge clk_out) begin
    if (rst) begin
        osc_clk_count = 6'd0;
    end else if (sync_flag & ~OS_CNT_RS) begin
        osc_clk_count = osc_clk_count + 1'b1;
    end else if (OS_CNT_RS) begin
        osc_clk_count = 6'd0; 
    end 
end

//  sync_flag for the osc_clk_count
always @( posedge ref_clk) begin
    if (rst) begin
        sync_flag=1'b0;
    end else begin
        sync_flag=1'b1;
    end
end

always @( posedge clk_out) begin
    if (rst) begin
        out_star = 1'b0;
    end else if (OS_CNT_RS) begin
        out_star = 1'b1;
    end else if (out_star) begin
        out_star = 1'b0;
    end
end

// Instantiate Double Edge Sampler

logic sample_hit;
double_esampler esample (
    .aux_clk(aux_in),
    .osc_out_star(out_star),
    .hit(sample_hit),
    .accumu_select(accumu_select),
    .rst(rst)
);

// hit and accum

// Commit clk for the averaging results, also resets the accumulator.
logic commit_clk;
logic commit_clk_reset_async;
logic commit_clk_flag;
logic [31:0] commit_clk_cnt;
logic commit_clk_overflow_flag;
assign commit_clk_reset_async = commit_clk_flag || rst;

always @( posedge accumu_select, posedge commit_clk_reset_async ) begin
    if (commit_clk_reset_async) begin
        commit_clk_cnt = 32'h00000000;
    end else begin
        commit_clk_cnt = commit_clk_cnt + 1'b1;
    end
end

// Select divide ratio of the commit clk
always @( * ) begin
    case (fine_control_avg_window_select)
        5'd1: begin 
            commit_clk = commit_clk_cnt[1];
            commit_clk_flag = commit_clk_cnt[2]; 
        end 
        5'd2: begin 
            commit_clk = commit_clk_cnt[2];
            commit_clk_flag = commit_clk_cnt[3]; 
        end 
        5'd3: begin 
            commit_clk = commit_clk_cnt[3];
            commit_clk_flag = commit_clk_cnt[4]; 
        end 
        5'd4: begin 
            commit_clk = commit_clk_cnt[4];
            commit_clk_flag = commit_clk_cnt[5]; 
        end 
        5'd5: begin 
            commit_clk = commit_clk_cnt[5];
            commit_clk_flag = commit_clk_cnt[6]; 
        end 
        5'd6: begin 
            commit_clk = commit_clk_cnt[6];
            commit_clk_flag = commit_clk_cnt[7]; 
        end 
        5'd7: begin 
            commit_clk = commit_clk_cnt[7];
            commit_clk_flag = commit_clk_cnt[8]; 
        end 
        5'd8: begin 
            commit_clk = commit_clk_cnt[8];
            commit_clk_flag = commit_clk_cnt[9]; 
        end 
        5'd9: begin 
            commit_clk = commit_clk_cnt[9];
            commit_clk_flag = commit_clk_cnt[10]; 
        end 
        5'd10: begin 
            commit_clk = commit_clk_cnt[10];
            commit_clk_flag = commit_clk_cnt[11]; 
        end 
        5'd11: begin 
            commit_clk = commit_clk_cnt[11];
            commit_clk_flag = commit_clk_cnt[12]; 
        end 
        5'd12: begin 
            commit_clk = commit_clk_cnt[12];
            commit_clk_flag = commit_clk_cnt[13]; 
        end 
        5'd13: begin 
            commit_clk = commit_clk_cnt[13];
            commit_clk_flag = commit_clk_cnt[14]; 
        end 
        5'd14: begin 
            commit_clk = commit_clk_cnt[14];
            commit_clk_flag = commit_clk_cnt[15]; 
        end 
        5'd15: begin 
            commit_clk = commit_clk_cnt[15];
            commit_clk_flag = commit_clk_cnt[16]; 
        end 
        5'd16: begin 
            commit_clk = commit_clk_cnt[16];
            commit_clk_flag = commit_clk_cnt[17]; 
        end 
        5'd17: begin 
            commit_clk = commit_clk_cnt[17];
            commit_clk_flag = commit_clk_cnt[18]; 
        end 
        5'd18: begin 
            commit_clk = commit_clk_cnt[18];
            commit_clk_flag = commit_clk_cnt[19]; 
        end 
        5'd19: begin 
            commit_clk = commit_clk_cnt[19];
            commit_clk_flag = commit_clk_cnt[20]; 
        end 
        5'd20: begin 
            commit_clk = commit_clk_cnt[20];
            commit_clk_flag = commit_clk_cnt[21]; 
        end 
        5'd21: begin 
            commit_clk = commit_clk_cnt[21];
            commit_clk_flag = commit_clk_cnt[22]; 
        end 
        5'd22: begin 
            commit_clk = commit_clk_cnt[22];
            commit_clk_flag = commit_clk_cnt[23]; 
        end 
        5'd23: begin 
            commit_clk = commit_clk_cnt[23];
            commit_clk_flag = commit_clk_cnt[24]; 
        end 
        5'd24: begin 
            commit_clk = commit_clk_cnt[24];
            commit_clk_flag = commit_clk_cnt[25]; 
        end 
        5'd25: begin 
            commit_clk = commit_clk_cnt[25];
            commit_clk_flag = commit_clk_cnt[26]; 
        end 
        5'd26: begin 
            commit_clk = commit_clk_cnt[26];
            commit_clk_flag = commit_clk_cnt[27]; 
        end 
        5'd27: begin 
            commit_clk = commit_clk_cnt[27];
            commit_clk_flag = commit_clk_cnt[28]; 
        end 
        5'd28: begin 
            commit_clk = commit_clk_cnt[28];
            commit_clk_flag = commit_clk_cnt[29]; 
        end 
        5'd29: begin 
            commit_clk = commit_clk_cnt[29];
            commit_clk_flag = commit_clk_cnt[30]; 
        end 
        5'd30: begin 
            commit_clk = commit_clk_cnt[30];
            commit_clk_flag = commit_clk_cnt[31]; 
        end 
        5'd31: begin 
            commit_clk = commit_clk_cnt[30];
            commit_clk_flag = commit_clk_cnt[31]; 
        end 
        default: begin 
            commit_clk = commit_clk_cnt[24];
            commit_clk_flag = commit_clk_cnt[25]; 
        end 
    endcase
end

// The hit will be sampled by accumu_select, for positive transition of
// accumu_select, the results should be recorded as free_running error
// for negative transition, it should be counted as the less error accumulated
// clean cycle.

logic [24:0] stat_error;
logic [24:0] stat_clean;

// Async 
logic accumu_reset_async;
assign accumu_reset_async = commit_clk_flag || rst;

logic error_hit;
logic clean_hit;
assign error_hit= accumu_select & sample_hit;
assign clean_hit= (~accumu_select) & sample_hit;
// ADD RESET!!!!

// Error count accumulator
always @( negedge ref_clk, posedge accumu_reset_async ) begin
    if (accumu_reset_async) begin
        stat_error = 0;
    end else begin
        stat_error = stat_error + error_hit;
    end
end

always @( posedge ref_clk, posedge accumu_reset_async ) begin
    if (accumu_reset_async) begin
        stat_clean = 0;
    end else begin
        stat_clean = stat_clean + clean_hit;
    end
end 
// END

// logic [21:0] ref_clk_count;
// always @(posedge ref_clk) begin
//     if (rst) begin
//         ref_clk_count = fine_control_avg_window;
//     end else if (ref_clk_count > 0) begin
//         ref_clk_count = ref_clk_count - 1;
//     end else if (ref_clk_count == 22'd0) begin
//         ref_clk_count = fine_control_avg_window;
//         // Add reset for accumulator
//         stat_error = 25'd0;
//         stat_clean = 25'd0;
//     end
// end




// Compare the accumulated hit counts
localparam STATE_UP = 3'd0;
localparam STATE_DN = 3'd1;
localparam STATE_UC = 3'd2;
localparam STATE_RS = 3'd3;
reg [2:0] CurrentState;
reg [2:0] NextState;


always @(posedge commit_clk, posedge rst) begin
    if (rst) begin
        NextState = STATE_RS;
    end else if (stat_clean == stat_error) begin
        NextState = STATE_UC;
    end else if (stat_clean < stat_error) begin
        NextState = STATE_DN;
    end else if (stat_clean > stat_error) begin
        NextState = STATE_UP;
    end
end

always @( posedge commit_clk, posedge rst) begin
    if (rst) CurrentState <= STATE_RS;  
    else CurrentState <= NextState;
end

always @( posedge commit_clk, posedge rst ) begin
    case (CurrentState)
        STATE_UP: begin
        osc_fine_con = osc_fine_con - fine_con_step_size;
        end
        STATE_DN: begin
        osc_fine_con = osc_fine_con + fine_con_step_size;
        end
        STATE_UC: begin
        osc_fine_con = osc_fine_con + 1'b0;
        end
        STATE_RS: begin
        osc_fine_con = 8'b10000000;
        end
    endcase
    if (rst) begin
        osc_fine_con = 8'b10000000;
    end
end
// AUX osc


logic [5:0] z0; // Floating nodes


aux_core aux_osc (
    .glob_en(aux_osc_en),
    .osc_000(aux_clk_out),
    .osc_030(z0[0]),
    .osc_060(z0[1]),
    .osc_090(z0[2]),
    .osc_120(z0[3]),
    .osc_150(z0[4]),
    .osc_180(z0[5])

);

// 

endmodule