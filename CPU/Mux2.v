module Mux2(
    input choice,
    input [15:0] in0,
    input [15:0] in1,
    output [15:0] out
    );
    
    assign out = (choice==0) ? in0 : in1;
    
endmodule 