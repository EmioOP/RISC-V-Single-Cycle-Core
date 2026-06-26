module Main_Decoder(op_code,zero,RegWrite,MemWrite,PCSrc,ResultSrc,ALUOp,ALUSrc,ImmSrc);
    
    //input and output declaration
    input zero;
    input [6:0] op_code;
    output PCSrc,RegWrite,MemWrite,ResultSrc,ALUSrc;
    output [1:0] ImmSrc,ALUOp;

    //wires
    wire branch;


    assign RegWrite = ((op_code == 7'b0000011) | (op_code == 7'b0110011)) ? 1'b1 : 1'b0;

    assign MemWrite = (op_code == 7'b0100011) ? 1'b1 : 1'b0;

    assign ALUSrc  =  ((op_code == 7'b0000011) | (op_code == 7'b0100011)) ? 1'b1 : 1'b0;

    assign ResultSrc = (op_code == 7'b0000011) ? 1'b1 : 1'b0;
    assign branch = (op_code == 7'b1100011) ? 1'b1 : 1'b0;

    assign ImmSrc = (op_code == 7'b0100011) ? 2'b01 : 
                    (op_code == 7'b1100011) ? 2'b10 : 2'b00 ;

    assign ALUOp =  (op_code == 7'b0110011) ? 2'b10 :
                    (op_code == 7'b1100011) ? 2'b01 : 2'b00 ;

    assign PCSrc = branch & zero;

endmodule