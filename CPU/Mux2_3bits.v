module Mux2_3bits(
    input choice,
    input [2:0] in0,
    input [2:0] in1,
    output [2:0] out
    );
    
    assign out = (choice==0) ? in0 : in1;
    
endmodule 