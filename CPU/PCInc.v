module PCInc(pc_input, pc_output);
  
	input wire [15:0] pc_input;
	output wire [15:0] pc_output;
	
	assign pc_output[15:0] = pc_input[15:0] + 2;
endmodule 