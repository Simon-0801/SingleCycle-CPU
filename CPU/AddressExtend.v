module AddressExtend(
    input [15:0] pc_inc,
    input [11:0] address,
    output reg [15:0] extended
    );
    
    always @(pc_inc or address) begin
        extended[0] = 0;
        extended[15:13] = pc_inc[15:13];
        extended[12:1] = address;
    end
    
endmodule 