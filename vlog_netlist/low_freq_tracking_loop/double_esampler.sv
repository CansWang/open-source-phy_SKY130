module double_esampler (
    input aux_clk,
    input osc_out_star,
    input rst,
    input accumu_select,

    output hit
    
    );

logic DR; // Rising edge data
logic DF; // Falling edge data
logic osc_out_star_b;
assign osc_out_star_b = ~ osc_out_star;

// The dual edge sampler


always @(posedge osc_out_star) begin
    if (rst) begin
        DR = 0;    
    end else if (hit) begin
        DR = 0;
    end else begin
        DR = aux_clk;
    end
end

always @(posedge osc_out_star_b) begin
    if (rst) begin
        DF = 0;
    end else if (hit) begin
        DF = 0;
    end else begin
        DF = aux_clk;
    end
end

assign hit = DF && (~DR); // Rising Edge Detector


    
endmodule