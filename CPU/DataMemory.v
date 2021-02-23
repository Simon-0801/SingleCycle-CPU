module DataMemory(  
    input clk,  
    input [15:0] address,  
    input RD,  
    input WR,  
    input [15:0] DataIn,  
    output [15:0] DataOut  
);  
  
	reg [7:0] ram[0:127];
	  
	integer i;  
	
	initial begin;  
		for(i=0;i<128;i=i+1)  
			ram[i]<=0;  
	end  
	 
	assign DataOut[7:0] = (RD == 0)? ram[address+1]:8'bz;  
	assign DataOut[15:8] = (RD == 0)? ram[address]:8'bz;  
 
	always@(negedge clk) begin  
		if(WR == 0) begin  
			if(address>=0 && address<128) begin  
				ram[address] <= DataIn[15:8];  
				ram[address+1] <= DataIn[7:0];   
			end  
		end  
	end
	  
endmodule  
