module ControlUnit(  
    input [3:0] opcode,  
    input zero,  
    input sign,  
    output reg PCWre,  
    output reg ALUSrcA,  
    output reg ALUSrcB,  
    output reg DBDataSrc,  
    output reg RegWre,  
    output reg InsMemRW,  
    output reg RD,  
    output reg WR,  
    output reg RegDst,  
    output reg ExtSel,  
    output reg [1:0] PCSrc,  
    output reg [2:0] ALUOp  
);  

    initial begin  
        RD = 1;  
        WR = 1;  
        RegWre = 0; 
        PCWre = 0; 
        InsMemRW = 1;  
    end 
     
    always@ (opcode) begin  
        case(opcode)   
            4'b0000:begin // add  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ALUOp = 3'b000;  
            end  
            4'b0001:begin //addi  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 1;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 0;  
                ExtSel = 1;  
                ALUOp = 3'b000;  
            end  
            4'b0010:begin //sub  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ALUOp = 3'b001;  
            end
            4'b0011:begin // or  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ALUOp = 3'b011;  
            end   
            4'b0100:begin // ori  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 1;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 0;  
                ExtSel = 0;  
                ALUOp = 3'b011;  
            end  
            4'b0101:begin //and  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ALUOp = 3'b100;  
            end  
            4'b0110:begin //sll  
                PCWre = 1;  
                ALUSrcA = 1;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ALUOp = 3'b010;  
            end  
            4'b0111:begin //slt  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ALUOp = 3'b110;  
            end
            4'b1000:begin //mov  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 1;  
                ExtSel = 1;  
                ALUOp = 3'b111;  
            end
            4'b1001:begin //movi  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 1;  
                DBDataSrc = 0;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                RegDst = 0;  
                ExtSel = 1;  
                ALUOp = 3'b111;  
            end    
            4'b1010:begin //sw  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 1;  
                RegWre = 0;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 0;  
                ExtSel =1;  
                ALUOp = 3'b000;  
            end  
            4'b1011:begin //lw  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 1;  
                DBDataSrc = 1;  
                RegWre = 1;  
                InsMemRW = 1;  
                RD = 0;  
                WR = 1;  
                RegDst = 0;  
                ExtSel = 1;  
                ALUOp = 3'b000;  
            end 
            4'b1100:begin //beq  
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                RegWre = 0;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                ExtSel = 1;  
                ALUOp = 3'b001;  
            end  
            4'b1101:begin  //bgtz
                PCWre = 1;  
                ALUSrcA = 0;  
                ALUSrcB = 0;  
                RegWre = 0;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                ExtSel = 1;  
                ALUOp = 3'b001;  
            end  
            4'b1110:begin //j  
                PCWre = 1;  
                RegWre = 0;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
                ALUOp = 3'b010;  
            end  
            4'b1111:begin //halt  
                PCWre = 0;  
                RegWre = 0;  
                InsMemRW = 1;  
                RD = 1;  
                WR = 1;  
            end  
            default:begin  
                RD = 1;  
                WR = 1;  
                RegWre = 0;  
                InsMemRW = 0;  
            end  
        endcase  
    end 
     
    always@(opcode or zero or sign) begin  
        if(opcode == 4'b1110) // j  
            PCSrc = 2'b10;  
        else if(opcode == 4'b1100) begin
			if(zero == 1)
				PCSrc = 2'b01;
			else
				PCSrc = 2'b00;
		end
		else if(opcode == 4'b1101) begin
			if(zero == 0 && sign == 0)  
                PCSrc = 2'b01;  
            else  
                PCSrc = 2'b00;
        end  
        else begin  
            PCSrc = 2'b00;  
        end  
    end 
     
endmodule  
