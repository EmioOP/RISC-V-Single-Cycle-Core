module Instruction_Memory(A,rst,RD);

input [31:0] A;
input rst;

output [31:0] RD;


reg [31:0] Mem[1023:0];

assign RD  = (rst == 0)? 32'h00000000 : Mem[A[31:2]];

initial begin
    Mem[0] = 32'hFFC4A303; 
end

endmodule