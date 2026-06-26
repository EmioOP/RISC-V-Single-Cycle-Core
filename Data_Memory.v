module Data_Memory (A,WD,clk,rst,WE,RD);

input [31:0] A,WD;
input clk,rst;
input WE;
output [31:0] RD;

reg [31:0] Mem[1023:0];



always @(posedge clk) begin
    if(WE) 
        Mem[A] <= WD;
end

assign RD = (~rst)  ?  32'd0 : Mem[A] ;


initial begin
    Mem[28] = 32'h00000020;
end
    
endmodule