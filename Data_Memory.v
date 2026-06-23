module Data_Mem (A,WD,clk,WE,RD);

input [31:0] A,WD;
input clk,rst;
input WE;
output [31:0] RD;

reg [31:0] Mem[1023:0];


assign RD = (WE == 1'b0) ? Mem[A] : 32'h00000000;

always @(posedge clk) begin
    if(WE){
        Mem[A] <= WD;
    }
end
    
endmodule