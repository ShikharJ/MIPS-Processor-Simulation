// Register Module


// Verilog code for Register File module.
`timescale 1 ps / 100 fs
module RegisterFile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegisterWrite, Reset, CLK);
	
	output[31:0] ReadData1, ReadData2;
	input[4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input[31:0] WriteData;
	input RegisterWrite, Reset, CLK;
	integer i;
	wire[31:0] WriteEnable;
	wire[31:0] RegisterArray[0:31];

	// Decoder Block
	Decoder d0(WriteEnable, RegisterWrite, WriteRegister);
	Register reg0(RegisterArray[0], 32'b0, 1'b1, 1'b0, CLK);
	Register reg1(RegisterArray[1], WriteData, WriteEnable[1], Reset, CLK);
	Register reg2(RegisterArray[2], WriteData, WriteEnable[2], Reset, CLK);
	Register reg3(RegisterArray[3], WriteData, WriteEnable[3], Reset, CLK);
	Register reg4(RegisterArray[4], WriteData, WriteEnable[4], Reset, CLK);
	Register reg5(RegisterArray[5], WriteData, WriteEnable[5], Reset, CLK);
	Register reg6(RegisterArray[6], WriteData, WriteEnable[6], Reset, CLK);
	Register reg7(RegisterArray[7], WriteData, WriteEnable[7], Reset, CLK);
	Register reg8(RegisterArray[8], WriteData, WriteEnable[8], Reset, CLK);
	Register reg9(RegisterArray[9], WriteData, WriteEnable[9], Reset, CLK);
	Register reg10(RegisterArray[10], WriteData, WriteEnable[10], Reset, CLK);
	Register reg11(RegisterArray[11], WriteData, WriteEnable[11], Reset, CLK);
	Register reg12(RegisterArray[12], WriteData, WriteEnable[12], Reset, CLK);
	Register reg13(RegisterArray[13], WriteData, WriteEnable[13], Reset, CLK);
	Register reg14(RegisterArray[14], WriteData, WriteEnable[14], Reset, CLK);
	Register reg15(RegisterArray[15], WriteData, WriteEnable[15], Reset, CLK);
	Register reg16(RegisterArray[16], WriteData, WriteEnable[16], Reset, CLK);
	Register reg17(RegisterArray[17], WriteData, WriteEnable[17], Reset, CLK);
	Register reg18(RegisterArray[18], WriteData, WriteEnable[18], Reset, CLK);
	Register reg19(RegisterArray[19], WriteData, WriteEnable[19], Reset, CLK);
	Register reg20(RegisterArray[20], WriteData, WriteEnable[20], Reset, CLK);
	Register reg21(RegisterArray[21], WriteData, WriteEnable[21], Reset, CLK);
	Register reg22(RegisterArray[22], WriteData, WriteEnable[22], Reset, CLK);
	Register reg23(RegisterArray[23], WriteData, WriteEnable[23], Reset, CLK);
	Register reg24(RegisterArray[24], WriteData, WriteEnable[24], Reset, CLK);
	Register reg25(RegisterArray[25], WriteData, WriteEnable[25], Reset, CLK);
	Register reg26(RegisterArray[26], WriteData, WriteEnable[26], Reset, CLK);
	Register reg27(RegisterArray[27], WriteData, WriteEnable[27], Reset, CLK);
	Register reg28(RegisterArray[28], WriteData, WriteEnable[28], Reset, CLK);
	Register reg29(RegisterArray[29], WriteData, WriteEnable[29], Reset, CLK);
	Register reg30(RegisterArray[30], WriteData, WriteEnable[30], Reset, CLK);
	Register reg31(RegisterArray[31], WriteData, WriteEnable[31], Reset, CLK);

	// 32x32to32 Multiplexor Block
    MUX32x32to32 mux0(ReadData1, RegisterArray[0], RegisterArray[1], RegisterArray[2], RegisterArray[3], RegisterArray[4], RegisterArray[5], RegisterArray[6], RegisterArray[7], RegisterArray[8], RegisterArray[9], RegisterArray[10], RegisterArray[11], RegisterArray[12], RegisterArray[13], RegisterArray[14], RegisterArray[15], RegisterArray[16], RegisterArray[17], RegisterArray[18], RegisterArray[19], RegisterArray[20], RegisterArray[21], RegisterArray[22], RegisterArray[23], RegisterArray[24], RegisterArray[25], RegisterArray[26], RegisterArray[27], RegisterArray[28], RegisterArray[29], RegisterArray[30], RegisterArray[31], ReadRegister1);

    // 32x32to32 Multiplexor Block
 	MUX32x32to32 mux1(ReadData2, RegisterArray[0], RegisterArray[1], RegisterArray[2], RegisterArray[3], RegisterArray[4], RegisterArray[5], RegisterArray[6], RegisterArray[7], RegisterArray[8], RegisterArray[9], RegisterArray[10], RegisterArray[11], RegisterArray[12], RegisterArray[13], RegisterArray[14], RegisterArray[15], RegisterArray[16], RegisterArray[17], RegisterArray[18], RegisterArray[19], RegisterArray[20], RegisterArray[21], RegisterArray[22], RegisterArray[23], RegisterArray[24], RegisterArray[25], RegisterArray[26], RegisterArray[27], RegisterArray[28], RegisterArray[29], RegisterArray[30], RegisterArray[31], ReadRegister2);

endmodule


// Verilog code for single bit Register module.
module RegisterBit(BitOutput, BitData, WriteEnable, Reset, CLK);

	output BitOutput;				// Intended bit
	input BitData, WriteEnable;
	input Reset, CLK;
	wire D, F1, F2;					// Input of D Flip Flop
	wire Reset;

	and #(50) a0(F1, BitOutput, (~WriteEnable));
	and #(50) a1(F2, BitData, WriteEnable);
	or  #(50) o0(D, F1, F2);
	DFlipFlop dff0(BitOutput, D, Reset, CLK);

endmodule


// Verilog code for 32-bit Register module, iterating over single bits.
module Register(RegisterOutput, RegisterInput, WriteEnable, Reset, CLK);

	output[31:0] RegisterOutput;
	input[31:0] RegisterInput;
	input WriteEnable, Reset, CLK;

	RegisterBit bit31(RegisterOutput[31], RegisterInput[31], WriteEnable, Reset, CLK);
	RegisterBit bit30(RegisterOutput[30], RegisterInput[30], WriteEnable, Reset, CLK);
	RegisterBit bit29(RegisterOutput[29], RegisterInput[29], WriteEnable, Reset, CLK);
	RegisterBit bit28(RegisterOutput[28], RegisterInput[28], WriteEnable, Reset, CLK);
	RegisterBit bit27(RegisterOutput[27], RegisterInput[27], WriteEnable, Reset, CLK);
	RegisterBit bit26(RegisterOutput[26], RegisterInput[26], WriteEnable, Reset, CLK);
	RegisterBit bit25(RegisterOutput[25], RegisterInput[25], WriteEnable, Reset, CLK);
	RegisterBit bit24(RegisterOutput[24], RegisterInput[24], WriteEnable, Reset, CLK);
	RegisterBit bit23(RegisterOutput[23], RegisterInput[23], WriteEnable, Reset, CLK);
	RegisterBit bit22(RegisterOutput[22], RegisterInput[22], WriteEnable, Reset, CLK);
	RegisterBit bit21(RegisterOutput[21], RegisterInput[21], WriteEnable, Reset, CLK);
	RegisterBit bit20(RegisterOutput[20], RegisterInput[20], WriteEnable, Reset, CLK);
	RegisterBit bit19(RegisterOutput[19], RegisterInput[19], WriteEnable, Reset, CLK);
	RegisterBit bit18(RegisterOutput[18], RegisterInput[18], WriteEnable, Reset, CLK);
	RegisterBit bit17(RegisterOutput[17], RegisterInput[17], WriteEnable, Reset, CLK);
	RegisterBit bit16(RegisterOutput[16], RegisterInput[16], WriteEnable, Reset, CLK);
	RegisterBit bit15(RegisterOutput[15], RegisterInput[15], WriteEnable, Reset, CLK);
	RegisterBit bit14(RegisterOutput[14], RegisterInput[14], WriteEnable, Reset, CLK);
	RegisterBit bit13(RegisterOutput[13], RegisterInput[13], WriteEnable, Reset, CLK);
	RegisterBit bit12(RegisterOutput[12], RegisterInput[12], WriteEnable, Reset, CLK);
	RegisterBit bit11(RegisterOutput[11], RegisterInput[11], WriteEnable, Reset, CLK);
	RegisterBit bit10(RegisterOutput[10], RegisterInput[10], WriteEnable, Reset, CLK);
	RegisterBit bit9(RegisterOutput[9], RegisterInput[9], WriteEnable, Reset, CLK);
	RegisterBit bit8(RegisterOutput[8], RegisterInput[8], WriteEnable, Reset, CLK);
	RegisterBit bit7(RegisterOutput[7], RegisterInput[7], WriteEnable, Reset, CLK);
	RegisterBit bit6(RegisterOutput[6], RegisterInput[6], WriteEnable, Reset, CLK);
	RegisterBit bit5(RegisterOutput[5], RegisterInput[5], WriteEnable, Reset, CLK);
	RegisterBit bit4(RegisterOutput[4], RegisterInput[4], WriteEnable, Reset, CLK);
	RegisterBit bit3(RegisterOutput[3], RegisterInput[3], WriteEnable, Reset, CLK);
	RegisterBit bit2(RegisterOutput[2], RegisterInput[2], WriteEnable, Reset, CLK);
	RegisterBit bit1(RegisterOutput[1], RegisterInput[1], WriteEnable, Reset, CLK);
	RegisterBit bit0(RegisterOutput[0], RegisterInput[0], WriteEnable, Reset, CLK);

endmodule
