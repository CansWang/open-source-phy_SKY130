timescale 1fs/1fs

module fll_core_tb (
    output [4:0] freq_control
);

parameter pi_freq=1.25e9;

logic osc_out;
logic clk_ref;


    initial begin
        force osc_out = 1'b0;
        #((0.00/pi_freq)*1s);
        forever begin
            force osc_out = 1'b1;
            #((0.5/pi_freq)*1s);
            force osc_out = 1'b0;
            #((0.5/pi_freq)*1s);
        end
    end

// fll_core DUT (
//     .clk_out()







// );


endmodule