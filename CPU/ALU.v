module ALU(  
    input [2:0] ALUopcode,  
    input [15:0] rega,  
    input [15:0] regb,  
    output reg [15:0] result,  
    output zero,  
    output sign  
);  

	assign zero = (result==0)?1:0;  
	assign sign = result[15];  
	
	always @( ALUopcode or rega or regb ) begin  
		case (ALUopcode)  
			3'b000 : result = rega + regb;  
			3'b001 : result = rega - regb;  
			3'b010 : result = regb << rega;  
			3'b011 : result = rega | regb;  
			3'b100 : result = rega & regb;  
			3'b101 : result = (rega < regb)?1:0;   
			3'b110 : begin  
				if (rega<regb &&(( rega[15] == 0 && regb[15]==0) ||  
				(rega[15] == 1 && regb[15]==1))) result = 1;  
				else if (rega[15] == 0 && regb[15]==1) result = 0;  
				else if ( rega[15] == 1 && regb[15]==0) result = 1;  
				else result = 0;  
			end  
			3'b111 : result = regb;  
		endcase  
	end 
	 
endmodule  
