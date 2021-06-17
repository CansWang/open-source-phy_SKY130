`timescale 1ps/1ps

module osc_tb;

reg [1:0] ctrl;
wire out_a, out_b, out_c, out_d, out_e;
reg inj;

initial begin
    // $dumpfile("waveforms.vcd");
    // $dumpvars();
    $shm_open("waves.shm");
	$shm_probe(osc_tb.dut,"AC");
    $shm_probe(osc_tb,"AC");
    inj=1'b1;
    ctrl[0] = 0;
    ctrl[1] = 0;

    #(5000);
    #(313)
    inj=1'b0;
    #(150);
    inj=1'b1;
    #(400);

    #(8000);

    $finish;
end

osc dut (
    .ctrl(ctrl),
    .inj_out(inj),
    .out_a(out_a),
    .out_b(out_b),
    .out_c(out_c),
    .out_d(out_d),
    .out_e(out_e)
);



endmodule