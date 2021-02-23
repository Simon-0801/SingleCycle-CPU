module RegFile(  
    input CLK,  
    input RST,  
    input RegWre,  
    input [2:0] ReadReg1,  
    input [2:0] ReadReg2,  
    input [2:0] WriteReg,  
    input [15:0] WriteData,  
    output [15:0] ReadData1,  
    output [15:0] ReadData2  
);  

    reg [15:0] regFile[0:7];
     
    integer i;  
    
    //assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1]; 
    //assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    assign ReadData1 = regFile[ReadReg1]; 
    assign ReadData2 = regFile[ReadReg2];
      
    always @ (negedge CLK) begin  
        if (RST == 0) begin  
            for(i=0;i<8;i=i+1)  
                regFile[i] <= 0;  
        end  
        else if(RegWre == 1) begin  
            regFile[WriteReg] <= WriteData;  
        end  
    end  
          
endmodule  
