module double_esampler (
    input aux_clk,
    input osc_out_star,
    input osc_out_star_b,

    output hit
    
    );

logic DR; // Rising edge data
logic DF; // Falling edge data


// Instantiate the dual edge sampler

sky130_fd_sc_hs__dfxtp_2 dff_rising (.D(aux_clk), .CLK(osc_out_star), .Q(DR));
sky130_fd_sc_hs__dfxtp_2 dff_falling (.D(aux_clk), .CLK(osc_out_star_b), .Q(DF));


assign hit = (~DF) || DR; // Rising Edge Detector


    
endmodule