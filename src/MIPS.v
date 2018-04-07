// MIPS Pipeline Module


// Verilog code for 32-bit 5-stage Pipelined MIPS Processor.
`timescale 1 ps / 100 fs
module MIPSPipeline(CLK, Reset);

	input CLK, Reset;
	wire[31:0] PC, PCInput;
	wire[31:0] PC4, ID_PC4, EX_PC4;
	wire[31:0] PCBNE, PC4BNE, PCJ, PC4BNEJ, PCJR;					// PC signals in MUX
	wire[31:0] Instruction, ID_Instruction, EX_Instruction;			// Output of Instruction Memory
	wire[5:0] OperationCode, Function;

	// Extend
	wire[15:0] Imm16;												// Immediate-type Instruction
	wire[31:0] Im16_Extension, EX_Im16_Extension;
	wire[31:0] SignExtensionOutput, ZeroExtensionOutput;

	// Register File
	wire[4:0] Rs, Rt, Rd, EX_rs, EX_rt, EX_rd, EX_WriteRegister, MEM_WriteRegister, WB_WriteRegister;
	wire[31:0] WB_WriteData, ReadData1, ReadData2, ReadData1Output, ReadData2Output, EX_ReadData1, EX_ReadData2;

	// ALU
	wire[31:0] Bus_A_ALU, Bus_B_ALU, Bus_B_Forwarded;
	wire[31:0] EX_ALUResult, MEM_ALUResult, WB_ALUResult;
	wire ZeroFlag, OverflowFlag, CarryFlag, NegativeFlag, NotZeroFlag;
	wire[31:0] WriteDataOfMemory, MEM_ReadDataOfMemory, WB_ReadDataOfMemory;

	// Control Signals
	wire RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, Jump, SignZero, JRControl;
	wire ID_RegisterDestination, ID_ALUSource, ID_MemoryToRegister, ID_RegisterWrite, ID_MemoryRead, ID_MemoryWrite, ID_Branch, ID_JRControl;
	wire EX_RegisterDestination, EX_ALUSource, EX_MemoryToRegister, EX_RegisterWrite, EX_MemoryRead, EX_MemoryWrite, EX_Branch, EX_JRControl;
	wire MEM_MemoryToRegister, MEM_RegisterWrite, MEM_MemoryRead, MEM_MemoryWrite;
	wire WB_MemoryToRegister, WB_RegisterWrite;
	wire[1:0] ALUOperation, ID_ALUOperation, EX_ALUOperation;
	wire[1:0] ALUControl;
	wire BNEControl, NotBNEControl;
	wire JumpControl, JumpFlush;
	wire[1:0] ForwardA, ForwardB;

	// Flush
	wire IFFlush, IFIDFlush, NotIFIDFlush, StallFlush, Flush;

	// Shift Left
	wire[31:0] ShiftLeft2BNEOutput, ShiftLeft2JumpOutput;

	// PC Write Enable, IF/ID Write Enable
	wire PC_WriteEnable, IFID_WriteEnable;

	// PC Register
	Register reg0(PC, PCInput, PC_WriteEnable, Reset, CLK);
	Adder add0(PC4, PC, {29'b0, 3'b100});			// PC4 = PC + 4

	InstructionMemory im0(Instruction, PC);

	// Register IF/ID
	Register reg1(ID_PC4, PC4, IFID_WriteEnable, Reset, CLK);
	Register reg2(ID_Instruction, Instruction, IFID_WriteEnable, Reset, CLK);
	RegisterBit bit0(IFIDFlush, IFFlush, IFID_WriteEnable, Reset, CLK);

	// ID Stage
	assign OperationCode = ID_Instruction[31:26];
	assign Function = ID_Instruction[5:0];
	assign Rs = ID_Instruction[25:21];
	assign Rt = ID_Instruction[20:16];
	assign Rd = ID_Instruction[15:11];
	assign Imm16 = ID_Instruction[15:0];

	// Main Control
	Control c0(RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, ALUOperation, Jump, SignZero, OperationCode);

	// Register File
	RegisterFile rf0(ReadData1, ReadData2, WB_WriteData, Rs, Rt, WB_WriteRegister, WB_RegisterWrite, Reset, CLK);

	// Forward read data if Read and Write are set at the same time
	WBForward wbf0(ReadData1Output, ReadData1Output, ReadData1, ReadData2, Rs, Rt, WB_WriteRegister, WB_WriteData, WB_RegisterWrite);

	// Extend Sign
	SignExtension se0(SignExtensionOutput, Imm16);

	// Extend Zeroes
	ZeroExtension ze0(ZeroExtensionOutput, Imm16);

	// Immediate Extend: Sign or Zeroes
	MUX2x32to32 mux0(Im16_Extension, SignExtensionOutput, ZeroExtensionOutput, SignZero);

	JRControlUnit jrcu0(JRControl, ALUOperation, Function);

	DiscardInstructions di0(ID_flush, IFFlush, JumpControl, BNEControl, EX_JRControl);

	or #(50) o0(Flush, ID_flush, IFIDFlush, StallFlush);
	FlushBlock fb0(ID_RegisterDestination, ID_ALUSource, ID_MemoryToRegister, ID_RegisterWrite, ID_MemoryRead, ID_MemoryWrite, ID_Branch, ID_ALUOperation, ID_JRControl, Flush, RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, ALUOperation, JRControl);

	// EX Stage
	Register reg3(EX_PC4, ID_PC4, 1'b1, Reset, CLK);
	Register reg4(EX_ReadData1, ReadData1Output, 1'b1, Reset, CLK);
	Register reg5(EX_ReadData2, ReadData1Output, 1'b1, Reset, CLK);
	Register reg6(EX_Im16_Extension, Im16_Extension, 1'b1, Reset, CLK);
	Register reg7(EX_Instruction[31:0], ID_Instruction, 1'b1, Reset, CLK);
	assign EX_rs = EX_Instruction[25:21];
	assign EX_rt = EX_Instruction[20:16];
	assign EX_rd = EX_Instruction[15:11];

	// 9 control signals via ID/EX
	RegisterBit bit1(EX_RegisterDestination, ID_RegisterDestination, 1'b1, Reset, CLK);
	RegisterBit bit2(EX_ALUSource, ID_ALUSource, 1'b1, Reset, CLK);
	RegisterBit bit3(EX_MemoryToRegister, ID_MemoryToRegister, 1'b1, Reset, CLK);
	RegisterBit bit4(EX_RegisterWrite, ID_RegisterWrite, 1'b1, Reset, CLK);
	RegisterBit bit5(EX_MemoryRead, ID_MemoryRead, 1'b1, Reset, CLK);
	RegisterBit bit6(EX_MemoryWrite, ID_MemoryWrite, 1'b1, Reset, CLK);
	RegisterBit bit7(EX_Branch, ID_Branch, 1'b1, Reset, CLK);
	RegisterBit bit8(EX_JRControl, ID_JRControl, 1'b1, Reset, CLK);
	RegisterBit bit9(EX_ALUOperation[1], ID_ALUOperation[1], 1'b1, Reset, CLK);
	RegisterBit bit10(EX_ALUOperation[0], ID_ALUOperation[0], 1'b1, Reset, CLK);

	// Forwarding Unit
	ForwardingUnit fu0(ForwardA, ForwardB, MEM_RegisterWrite, WB_RegisterWrite, MEM_WriteRegister, WB_WriteRegister, EX_rs, EX_rt);

	// Choose source of ALU forwarding.
	MUX3x32to32 mux1(Bus_A_ALU, EX_ReadData1, MEM_ALUResult, WB_WriteData, ForwardA);
	MUX3x32to32 mux2(Bus_B_Forwarded, EX_ReadData2, MEM_ALUResult, WB_WriteData, ForwardB);

	// Select source Bus B of ALU
	MUX2x32to32 mux3(Bus_B_ALU, Bus_B_Forwarded, EX_Im16_Extension, EX_ALUSource);

	// ALU Control
	ALUControlUnit alucu0(ALUControl, EX_ALUOperation, EX_Im16_Extension[5:0]);

	// ALU
	ALU alu0(EX_ALUResult, CarryFlag, ZeroFlag, OverflowFlag, NegativeFlag, Bus_A_ALU, Bus_B_ALU, ALUControl);

	// Choose Shift Register between Rd and Rt
	MUX2x5to5 mux4(EX_WriteRegister, EX_rt, EX_rd, EX_RegisterDestination);

	// MEM Stage
	// Register EX/MEM
	Register reg8(MEM_ALUResult, EX_ALUResult, 1'b1, Reset, CLK);
	Register reg9(WriteDataOfMemory, Bus_B_Forwarded, 1'b1, Reset, CLK);
	RegisterBit bit11(MEM_MemoryToRegister, EX_MemoryToRegister, 1'b1, Reset, CLK);
	RegisterBit bit12(MEM_RegisterWrite, EX_RegisterWrite, 1'b1, Reset, CLK);
	RegisterBit bit13(MEM_MemoryRead, EX_MemoryRead, 1'b1, Reset, CLK);
	RegisterBit bit14(MEM_MemoryWrite, EX_MemoryWrite, 1'b1, Reset, CLK);
	RegisterBit bit15(MEM_WriteRegister[4], EX_WriteRegister[4], 1'b1, Reset, CLK);
	RegisterBit bit16(MEM_WriteRegister[3], EX_WriteRegister[3], 1'b1, Reset, CLK);
	RegisterBit bit17(MEM_WriteRegister[2], EX_WriteRegister[2], 1'b1, Reset, CLK);
	RegisterBit bit18(MEM_WriteRegister[1], EX_WriteRegister[1], 1'b1, Reset, CLK);
	RegisterBit bit19(MEM_WriteRegister[0], EX_WriteRegister[0], 1'b1, Reset, CLK);

	// Data Memory
	DataMemory dm0(MEM_ReadDataOfMemory, MEM_ALUResult, WriteDataOfMemory, MEM_MemoryWrite, MEM_MemoryRead, CLK);

	// Write Back Stage
	// Register MEM/WB
	Register reg10(WB_ReadDataOfMemory, MEM_ReadDataOfMemory, 1'b1, Reset, CLK);
	Register reg11(WB_ALUResult, MEM_ALUResult, 1'b1, Reset, CLK);
	RegisterBit bit20(WB_WriteRegister[4], MEM_WriteRegister[4], 1'b1, Reset, CLK);
	RegisterBit bit21(WB_WriteRegister[3], MEM_WriteRegister[3], 1'b1, Reset, CLK);
	RegisterBit bit22(WB_WriteRegister[2], MEM_WriteRegister[2], 1'b1, Reset, CLK);
	RegisterBit bit23(WB_WriteRegister[1], MEM_WriteRegister[1], 1'b1, Reset, CLK);
	RegisterBit bit24(WB_WriteRegister[0], MEM_WriteRegister[0], 1'b1, Reset, CLK);
	RegisterBit bit25(WB_MemoryToRegister, MEM_MemoryToRegister, 1'b1, Reset, CLK);
	RegisterBit bit26(WB_RegisterWrite, MEM_RegisterWrite, 1'b1, Reset, CLK);

	// Select data to write to register file
	MUX2x32to32 mux5(WB_WriteData, WB_ALUResult, WB_ReadDataOfMemory, WB_MemoryToRegister);

	// Stalling
	StallControl sc0(PC_WriteEnable, IFID_WriteEnable, StallFlush, EX_MemoryRead, EX_rt, Rs, Rt, OperationCode);

	// Jump, BNE, JRs
	ShiftLeft2 sl0(ShiftLeft2BNEOutput, EX_Im16_Extension);
	Adder add1(PCBNE, EX_PC4, ShiftLeft2BNEOutput);
	not #(50) inv0(NotZeroFlag, ZeroFlag);
	and #(50) a0(BNEControl, EX_Branch, NotZeroFlag);
	MUX2x32to32 mux6(PC4BNE, PC4, PCBNE, BNEControl);

	// Jump
	ShiftLeft2 sl1(ShiftLeft2JumpOutput, {6'b0, ID_Instruction[25:0]});
	assign PCJ = {ID_PC4[31:28], ShiftLeft2JumpOutput[27:0]};

	not #(50) inv1(NotIFIDFlush, IFIDFlush);
	and #(50) a1(JumpFlush, Jump, NotIFIDFlush);
	not #(50) inv2(NotBNEControl, BNEControl);
	and #(50) a2(JumpControl, JumpFlush, NotBNEControl);
	MUX2x32to32 mux7(PC4BNEJ, PC4BNE, PCJ, JumpControl);

	// JR: Jump Register
	assign PCJR = Bus_A_ALU;
	MUX2x32to32 mux8(PCInput, PC4BNEJ, PCJR, EX_JRControl);
 
endmodule
