`include "Main_Decoder.v"
`include "ALU_Decoder.v"


module Control_Unit_Top (Op,RegWrite,MemWrite,ImmSrc,ALUSrc,ResultSrc,Branch,funct3,funct7,ALUControl);


    input [6:0] Op,funct7;
    input [2:0] funct3;
    output RegWrite,MemWrite,ResultSrc,ALUSrc,Branch;
    output [1:0] ImmSrc;
    output [2:0] ALUControl;

    wire [1:0] ALUOp;


    Main_Decoder Main_Decoder (
                .op_code(Op),
                .RegWrite(RegWrite),
                .MemWrite(MemWrite),
                .ResultSrc(ResultSrc),
                .ALUOp(ALUOp),
                .ALUSrc(ALUSrc),
                .ImmSrc(ImmSrc)
    );

    ALU_Decoder ALU_Decoder(
                .ALUOp(ALUOp),
                .funct3(funct3),
                .funct7(funct7[5]), // may need some changes 
                .op5(Op[5]), // may need some changes
                .ALUControl(ALUControl)
    );


     
endmodule