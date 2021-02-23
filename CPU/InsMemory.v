module InsMemory(  
    input InsMemRW,  
    input [15:0] address,  
    output reg [15:0] DataOut  
);  

    reg [7:0] mem [0:127]; 
     
    initial begin  
        DataOut = 16'b1111000000000000;
        $readmemb("Instructions.txt", mem);    
    end 
    always@(*) begin 
    //always@(address or InsMemRW) begin  
    /*
        if(InsMemRW == 1) begin    
            DataOut[15:8] <= mem[address];  
            DataOut[7:0] <= mem[address+1];  
        end  
        else begin
			DataOut = 16'b1111000000000000;  
		end
	*/
		DataOut[15:8] <= mem[address];  
        DataOut[7:0] <= mem[address+1];
    end  
endmodule  
