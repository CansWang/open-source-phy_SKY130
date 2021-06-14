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
logic aux_clk;

// random jiter insertion
    timeunit 1fs;
    timeprecision 1fs;

    class Delay; // Inverter delay
        integer seed;    // seed initialized randomly
        real td;         // delay

        function new(input real td_nom, input real td_std);
            seed = $urandom();
            this.td = td_nom + td_std*$dist_normal(seed, 0, 1000)/1000.0;
        endfunction

        function real get_rj(input real rj_rms);
            return rj_rms*$dist_normal(seed, 0, 1000)/1000.0;
        endfunction
    endclass: Delay


    parameter real td_nom = 2684.930e-12;    // 730 MHz nominal delay in sec
    parameter real td_std = 300e-12;         // std dev of nominal delay variation in sec

    Delay dly_obj;
    real td;
    initial begin
        dly_obj = new(td_nom, td_std);
        td = dly_obj.td;
    end


    initial begin
        force osc_out = 1'b0;
        #((0.00*pi_cycle)*1s);            
        force osc_out = 1'b1; // 1
        #((400e-12)*1s);
        force osc_out = 1'b0;
        #((400e-12)*1s);
        forever begin
            // force osc_out = 1'b1; // 1
            // #((0.5*pi_cycle)*1s);
            // force osc_out = 1'b0;
            // #(((0.6265822785)*pi_cycle)*1s);

            force osc_out = 1'b1; // 1
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 2
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);
            
            force osc_out = 1'b1; // 3
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 4
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 5
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 6
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 7
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 8
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 9
            #((0.5*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            // force osc_out = 1'b1; // 10
            // #((0.3765432099*pi_cycle)*1s);
            // force osc_out = 1'b0;
            // #((0.5*pi_cycle)*1s);

            force osc_out = 1'b1; // 10
            #((0.4875156055*pi_cycle)*1s);
            force osc_out = 1'b0;
            #((0.5*pi_cycle)*1s);

            // force osc_out = 1'b1; // 10
            // #((0.5*pi_cycle)*1s);
            // force osc_out = 1'b0;
            // #((0.6265822785*pi_cycle)*1s);

            // force osc_out = 1'b1; // 10
            // #((0.5*pi_cycle)*1s);
            // force osc_out = 1'b0;
            // #((0.5126582278*pi_cycle)*1s);
        end
    end

    initial begin
        force clk_ref = 1'b0;
        #((0.05*ref_cycle)*1s);
        forever begin
            force clk_ref = 1'b1;
            #((0.5*ref_cycle)*1s);
            force clk_ref = 1'b0;
            #((0.5*ref_cycle)*1s);
        end
    end




    initial begin
        force aux_clk = 1'b0;
        #((0.37137*ref_cycle)*1s);
        forever begin
            force aux_clk=1'b1;
            #((0.5*td)*1s);
            force aux_clk=1'b0;
            #((0.5*td)*1s);
        end
    end

//


logic [5:0] div_ratio_half;
logic [4:0] avg;
logic reset;
logic [4:0] window_select;
logic error_clk;
logic [7:0] fine_con;


logic [3:0] step_size;
fine_freq_track DUT (
    .clk_out(osc_out),
    .ref_clk(clk_ref),
    .div_ratio_half(div_ratio_half),
    .rst(reset),
    .aux_osc_en(1'b1),
    .fine_control_avg_window_select(window_select),
    .out_star(error_clk),
    .fine_con_step_size(step_size),
    .osc_fine_con(fine_con),
    .aux_in(aux_clk)
);





initial begin
    // $dumpfile("test.shm");
    // $dumpvars(0,fll_core_tb);
    $shm_open("waves.shm");
	$shm_probe(fll_core_tb.DUT,"AC");
    $shm_probe(fll_core_tb,"AC");
    avg=5'b01010;
    div_ratio_half=6'b000101;
    reset=1'b0;
    #5ns;
    reset=1'b1;
    #5ns;
    reset=1'b0;
    window_select=5'd13;
    step_size=4'd2;
    $display("Period of no frequency offset, freq_con should be constant!");
    #100ns;

    




    #1000000ns;
    $finish;

end






// );


endmodule