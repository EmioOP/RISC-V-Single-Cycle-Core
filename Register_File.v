module Register_File (A1,A2,A3,clk,WE3,rst,WD3,RD1,RD2);

input [31:0] WD3;
input [4:0] A1,A2,A3;
input clk,rst,WE3;

output [31:0] RD1,RD2;

reg [31:0] Registers[31:0];

always @(posedge clk) begin
    if(WE3)begin
        Registers[A3] <= WD3;
    end
end


assign RD1 = (~rst) ? 32'd0 : Registers[A1];
assign RD2 = (~rst) ? 32'd0 : Registers[A2];

initial begin
    Registers[5] = 32'h00000006;
    Registers[6] = 32'h0000000A;
end


    
endmodule