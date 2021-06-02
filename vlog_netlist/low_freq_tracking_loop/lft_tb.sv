`timescale 1ps/1ps

module fll_core_tb (
    output [4:0] freq_control,
    output lock_indicator
);

parameter pi_cycle=801e-12;
parameter ref_cycle=8000e-12;
parameter real freq_resolution=50e-12;

logic osc_out;
logic clk_ref;
logic clk_vco;


    initial begin
        force osc_out = 1'b0;
        #((0.00*pi_cycle)*1s);
        forever begin
            force osc_out = 1'b1;
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);
        end
    end

    initial begin
        force clk_ref = 1'b0;
        #((0.23*ref_cycle)*1s);
        forever begin
            force clk_ref = 1'b1;
            #((0.5*ref_cycle)*1s);
            force clk_ref = 1'b0;
            #((0.5*ref_cycle)*1s);
        end
    end

//


logic [5:0] div_ratio;
logic [4:0] avg;
logic reset;


fll_core DUT (
    .clk_out(osc_out),
    .ref_clk(clk_ref),
    .multi(div_ratio),
    .rst(reset),
    .avg_window(avg),
    .lock_flag(lock_indicator),
    .clk_con(freq_control)
);





initial begin
    // $dumpfile("test.shm");
    // $dumpvars(0,fll_core_tb);
    $shm_open("waves.shm");
	$shm_probe(fll_core_tb.DUT,"AC");
    $shm_probe(fll_core_tb,"AC");
    avg=5'b01010;
    div_ratio=6'b001010;
    reset=1'b0;
    #5ns;
    reset=1'b1;
    #5ns;
    reset=1'b0;
    $display("Period of no frequency offset, freq_con should be constant!");
    #100ns;

    




    #10000ns;
    $finish;

end






// );


endmodule