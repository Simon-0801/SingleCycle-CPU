module PC(  
    input clk,  
    input [15:0] PCin,  
    input PCWre,  
    input Reset,  
    output reg [15:0] PCout  
);  
	
    initial begin  
        PCout <= 0; 
    end
      
    always@(posedge clk) begin  
        if(Reset == 0) begin  
            PCout <= 0;  
        end  
        else if(PCWre == 0) begin  
            PCout <= PCout;  
        end  
        else begin  
            PCout <= PCin;  
        end  
    end
      
endmodule  
