module PCAddImm(pc_now, imm, pc_output);

	input [15:0] pc_now, imm;
	output [15:0] pc_output;

  assign pc_output = pc_now + (imm<<1);
endmodule 