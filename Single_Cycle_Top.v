`include "PC.v"
`include "Instruction_Memory.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"

module Single_Cycle_Top (clk,rst);

    input clk,rst;
    wire [31:0] PC_Top,RD_Instr,RD1_Top,Imm_Ext_Top,ALUResult,ReadData,PCPlus4,RD2_Top,SrcB,Result;
    wire [2:0] ALUControl_Top;
    wire RegWrite,MemWrite,ALUSrc,ResultSrc;
    wire [1:0] ImmSrc;

    PC PC(
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_NEXT(PCPlus4)
    );

    PC_Adder PC_Adder(
        .a(PC_Top),
        .b(32'd4),
        .c(PCPlus4)
    );

    Instruction_Memory Instruction_Memory(
                        .A(PC_Top),
                        .rst(rst),
                        .RD(RD_Instr)
    );

    Register_File Register_File(
                    .A1(RD_Instr[19:15]),
                    .A2(RD_Instr[24:20]),
                    .A3(RD_Instr[11:7]),
                    .clk(clk),
                    .WE3(RegWrite),
                    .rst(rst),
                    .WD3(Result),
                    .RD1(RD1_Top),
                    .RD2(RD2_Top)
    );

    Sign_Extend Sign_Extend(
                .In(RD_Instr[31:0]),
                .Imm_Ext(Imm_Ext_Top),
                .ImmSrc(ImmSrc[0])
    );

    Mux Mux_Reg_to_ALU(
        .a(RD2_Top),
        .b(Imm_Ext_Top),
        .s(ALUSrc),
        .c(SrcB)
    );

    ALU ALU(
        .A(RD1_Top),
        .B(SrcB),
        .ALUControl(ALUControl_Top),
        .Result(ALUResult),
        .Z(),
        .N(),
        .V(),
        .C()
    );


    Control_Unit_Top Control_Unit_Top(
                    .Op(RD_Instr[6:0]),
                    .RegWrite(RegWrite),
                    .MemWrite(MemWrite),
                    .ImmSrc(ImmSrc),
                    .ALUSrc(ALUSrc),
                    .ResultSrc(ResultSrc),
                    .Branch(),
                    .funct3(RD_Instr[14:12]),
                    .funct7(),
                    .ALUControl(ALUControl_Top)
    );

    Data_Memory Data_Memory(
        .A(ALUResult),
        .WD(RD2_Top),
        .clk(clk),
        .rst(rst),
        .WE(MemWrite),
        .RD(ReadData)
    );


    Mux Mux_DataMem_to_RegisterFile(
        .a(ALUResult),
        .b(ReadData),
        .s(ResultSrc),
        .c(Result)
    );



    
endmodule