module fll_core (
    input clk_out,
    input ref_clk,
    input [5:0] multi,
    input rst,
    input [4:0] avg_window,
    output reg lock_flag,
    output reg [4:0] clk_con
);

localparam STATE_UP = 3'd0;
localparam STATE_DN = 3'd1;
localparam STATE_UC = 3'd2;
localparam STATE_RS = 3'd3;


reg [5:0] multi_clk_count;
reg [4:0] ref_clk_count;
logic [15:0] count_actual;
logic [15:0] count_expect;
// default control word

// Rising Edge Counter

reg [2:0] CurrentState;
reg [2:0] NextState;

always @( posedge clk_out, posedge rst) begin
    if (rst) begin 
        multi_clk_count = 6'b0;
    end else if (ref_clk_count <= avg_window) begin
        multi_clk_count = multi_clk_count + 1'b0; 
    end else if (ref_clk_count > avg_window) begin
        multi_clk_count = 6'b0;
    end
end


always @( posedge ref_clk, posedge rst) begin
    if (rst) begin 
        ref_clk_count = 5'b0;
    end else if (ref_clk_count <= avg_window) begin
        ref_clk_count = ref_clk_count + 1'b1; 
    end else if (ref_clk_count > avg_window) begin
        ref_clk_count = 5'b0;
    end
end

// Calculate the 
assign count_actual = (ref_clk_count == avg_window) ? (multi_clk_count * ref_clk_count) : 16'h0000;
assign count_expect = (ref_clk_count == avg_window) ? (multi * ref_clk_count) : 16'h0000;


always@ ( posedge clk_out ) begin
    if ( rst ) CurrentState <= STATE_UC;
    else CurrentState <= NextState;
end

// UP/DN Decision

// Output 
always @( * ) begin
    clk_con = 5'b10000;
    case (CurrentState)
        STATE_UP: begin
            clk_con = clk_con - 1'b1;

        end
        STATE_DN: begin
            clk_con = clk_con + 1'b1;

        end
        STATE_UC: begin
            clk_con = clk_con + 1'b0;

        end
    endcase    
end

// State Transition
always @( * ) begin
    if (count_actual == count_expect) begin
        NextState = STATE_UC;
    end else if (count_actual < count_expect) begin
        NextState = STATE_UP;
    end else if (count_actual > count_expect) begin
        NextState = STATE_DN;
    end
end


endmodule