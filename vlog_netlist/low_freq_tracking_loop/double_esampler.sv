module double_esampler (
    input aux_clk,
    input osc_out_star,

    output hit
    
    );

logic DR; // Rising edge data
logic DF; // Falling edge data
logic osc_out_star_b;
assign osc_out_star_b = ~ osc_out_star;

// The dual edge sampler


always @(posedge osc_out_star) begin
    DR = aux_clk;
end

always @(posedge osc_out_star_b) begin
    DF = aux_clk;
end

assign hit = DF && (~DR); // Rising Edge Detector


    
endmodule