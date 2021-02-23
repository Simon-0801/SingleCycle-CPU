module SaExtend(
    input [2:0] original,
    output reg [15:0] extended
    );
    
    always @(*) begin
        extended[2:0] <= original;
        extended[15:3] <= 0;
    end
    
endmodule 