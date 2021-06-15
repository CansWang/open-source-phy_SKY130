module osc_core (
    input glob_en,
    input [4:0] delay_con_lsb,
    input [7:0] delay_con_msb,
    input [3:0] con_perb_1,
    input [3:0] con_perb_2,
    input [3:0] con_perb_3,
    input [3:0] con_perb_4,
    input [3:0] con_perb_5,
    input ref_clk,

// PI control
    input [3:0] pi1_l,
    input [3:0] pi1_r,
    input [3:0] pi2_l,
    input [3:0] pi2_r,
    input [3:0] pi3_l,
    input [3:0] pi3_r,
    input [3:0] pi4_l,
    input [3:0] pi4_r,
    input [3:0] pi5_l,
    input [3:0] pi5_r,
        

    output osc_000,
    output osc_036,
    output osc_072,
    output osc_108,
    output osc_144,

// 
// waiting to integrate the ref_injector
//  

    input inj_en,
    output inj_out,
    output osc_hold,

    output p1,
    output p2,
    output p3,
    output p4,
    output p5

// 
// buffered output phase, goes to phase blender
// 

);



endmodule




