module regFile (
    A1,A2,A3,clk,WE3,rst,WD3,RD1,RD2
);

input [31:0] WD3;
input [4:0] A1,A2,A3;
input clk,rst;

reg [31:0] Registers[31:0];


assign RD1 = (!rst) ? 32'h00000000 : Registers[A1];
assign RD2 = (!rst) ? 32'h00000000 : Registers[A2];

always @(posedge clk) begin
    if(WE3)begin
        Registers[A3] <= WD3;
    end
end
    
endmodule