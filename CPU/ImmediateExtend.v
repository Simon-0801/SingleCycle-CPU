module ImmediateExtend(
    input [5:0] original,
    input ExtSel,    // 0: Zero-extend; 1: Sign-extend.
    output reg [15:0] extended
    );
    
    always @(*) begin
        extended[5:0] <= original;    // 低16位保持不变
        if(ExtSel == 0) begin    // Zero-extend 零扩展
            extended[15:6] <= 0;
        end
        else begin    // Sign-extended 符号扩展
            if(original[5] == 0) extended[15:6] <= 0;
            else extended[15:6] <= 10'b1111111111;
        end
    end
    
endmodule 