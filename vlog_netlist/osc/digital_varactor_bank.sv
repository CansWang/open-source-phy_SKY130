module digital_varactor_bank (
    input [4:0] delay_con_lsb,
    input [7:0] delay_con_msb,
    input [3:0] con_perb,
    input ref_clk,
    inout var_out,
    output Z

);

wire [4:0] LSB;

//
// Modulate the LSB control using the ref_clk
//
genvar i;
generate
    for (i=0;i<5;i=i+1) begin
        assign LSB[i] = con_perb[i] ? (delay_con_lsb[i] ? ref_clk : 0 ) : delay_con_lsb[i];
    end
endgenerate

//
// Phase adjuster of the ref_clk
// To be continued




//
// LSB Varactor Bank
//

sky130_fd_sc_hs__nand2_1 fc1 (.A(var_out), .B(LSB[0]), .Y(Z));

sky130_fd_sc_hs__nand2_2 fc2 (.A(var_out), .B(LSB[1]), .Y(Z));

sky130_fd_sc_hs__nand2_2 fc3_0 (.A(var_out), .B(LSB[2]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc3_1 (.A(var_out), .B(LSB[2]), .Y(Z));

sky130_fd_sc_hs__nand2_2 fc4_0 (.A(var_out), .B(LSB[3]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc4_1 (.A(var_out), .B(LSB[3]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc4_2 (.A(var_out), .B(LSB[3]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc4_3 (.A(var_out), .B(LSB[3]), .Y(Z));

sky130_fd_sc_hs__nand2_2 fc44_0 (.A(var_out), .B(LSB[4]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc44_1 (.A(var_out), .B(LSB[4]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc44_2 (.A(var_out), .B(LSB[4]), .Y(Z));
sky130_fd_sc_hs__nand2_2 fc44_3 (.A(var_out), .B(LSB[4]), .Y(Z));

//
// delay_con_msb Varactor Bank, Thermometer coded
//

sky130_fd_sc_hs__nand2_4 fc5_0 (.A(var_out), .B(delay_con_msb[0]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc5_1 (.A(var_out), .B(delay_con_msb[0]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc5_2 (.A(var_out), .B(delay_con_msb[0]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc5_3 (.A(var_out), .B(delay_con_msb[0]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc6_0 (.A(var_out), .B(delay_con_msb[1]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc6_1 (.A(var_out), .B(delay_con_msb[1]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc6_2 (.A(var_out), .B(delay_con_msb[1]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc6_3 (.A(var_out), .B(delay_con_msb[1]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc7_0 (.A(var_out), .B(delay_con_msb[2]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc7_1 (.A(var_out), .B(delay_con_msb[2]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc7_2 (.A(var_out), .B(delay_con_msb[2]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc7_3 (.A(var_out), .B(delay_con_msb[2]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc8_0 (.A(var_out), .B(delay_con_msb[3]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc8_1 (.A(var_out), .B(delay_con_msb[3]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc8_2 (.A(var_out), .B(delay_con_msb[3]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc8_3 (.A(var_out), .B(delay_con_msb[3]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc9_0 (.A(var_out), .B(delay_con_msb[4]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc9_1 (.A(var_out), .B(delay_con_msb[4]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc9_2 (.A(var_out), .B(delay_con_msb[4]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc9_3 (.A(var_out), .B(delay_con_msb[4]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc10_0 (.A(var_out), .B(delay_con_msb[5]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc10_1 (.A(var_out), .B(delay_con_msb[5]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc10_2 (.A(var_out), .B(delay_con_msb[5]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc10_3 (.A(var_out), .B(delay_con_msb[5]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc11_0 (.A(var_out), .B(delay_con_msb[6]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc11_1 (.A(var_out), .B(delay_con_msb[6]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc11_2 (.A(var_out), .B(delay_con_msb[6]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc11_3 (.A(var_out), .B(delay_con_msb[6]), .Y(Z));

sky130_fd_sc_hs__nand2_4 fc12_0 (.A(var_out), .B(delay_con_msb[7]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc12_1 (.A(var_out), .B(delay_con_msb[7]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc12_2 (.A(var_out), .B(delay_con_msb[7]), .Y(Z));
sky130_fd_sc_hs__nand2_4 fc12_3 (.A(var_out), .B(delay_con_msb[7]), .Y(Z));




endmodule