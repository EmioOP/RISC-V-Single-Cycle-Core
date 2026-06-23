module Instr_Mem(A,rst,RD);

input [31:0] A;
input rst;

output [31:0] RD;


reg [31:0] Mem[1023:0];

assign RD  = (rst == 1)? 32'h00000000 :Mam[A[31:2]];



endmodule