module phase_interpolator (
    input l_phase,
    input r_phase,
    input [3:0] l_con,
    input [3:0] r_con,
    output ckout
);
    
logic l_phase_buf;
logic r_phase_buf;
logic phaseout;

// Buffer to avoid load the osc core overly
sky130_fd_sc_hs__inv_4 buf_l (.A(l_phase), .Y(l_phase_buf));
sky130_fd_sc_hs__inv_4 buf_r (.A(r_phase), .Y(r_phase_buf));

// left phase blender cell
sky130_fd_sc_hs__einvp_1 blend_left_0 (.A(l_phase_buf), .TE(l_con[0]), .Z(phaseout)); // TE is positive enable
sky130_fd_sc_hs__einvp_2 blend_left_1 (.A(l_phase_buf), .TE(l_con[1]), .Z(phaseout));
sky130_fd_sc_hs__einvp_4 blend_left_2 (.A(l_phase_buf), .TE(l_con[2]), .Z(phaseout));
sky130_fd_sc_hs__einvp_8 blend_left_3 (.A(l_phase_buf), .TE(l_con[3]), .Z(phaseout));

// right phase blender cell
sky130_fd_sc_hs__einvp_1 blend_right_0 (.A(r_phase_buf), .TE(r_con[0]), .Z(phaseout)); // TE is positive enable
sky130_fd_sc_hs__einvp_2 blend_right_1 (.A(r_phase_buf), .TE(r_con[1]), .Z(phaseout));
sky130_fd_sc_hs__einvp_4 blend_right_2 (.A(r_phase_buf), .TE(r_con[2]), .Z(phaseout));
sky130_fd_sc_hs__einvp_8 blend_right_3 (.A(r_phase_buf), .TE(r_con[3]), .Z(phaseout));

// edge sharpener/ output buffer
sky130_fd_sc_hs__inv_8 out_buf (.A(phaseout), .Y(ckout));



endmodule