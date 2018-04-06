// Register Module

// Verilog code for Decoder, MUX, D Flip-Flop and 32-bit Register.

`timescale 1 ps / 100 fs
module RegisterFile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegisterWrite, Reset, CLK);
	
	output[31:0] ReadData1, ReadData2;
	input[4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input[31:0] WriteData;
	input RegisterWrite, Reset, CLK;
	integer i;
	wire[31:0] WriteEnable;
	wire[31:0] RegisterArray[0:31];

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

    MUX32x32to32 mux0(ReadData1, RegisterArray[0], RegisterArray[1], RegisterArray[2], RegisterArray[3], RegisterArray[4], RegisterArray[5], RegisterArray[6], RegisterArray[7], RegisterArray[8], RegisterArray[9], RegisterArray[10], RegisterArray[11], RegisterArray[12], RegisterArray[13], RegisterArray[14], RegisterArray[15], RegisterArray[16], RegisterArray[17], RegisterArray[18], RegisterArray[19], RegisterArray[20], RegisterArray[21], RegisterArray[22], RegisterArray[23], RegisterArray[24], RegisterArray[25], RegisterArray[26], RegisterArray[27], RegisterArray[28], RegisterArray[29], RegisterArray[30], RegisterArray[31], ReadRegister1);

 	MUX32x32to32 mux1(ReadData2, RegisterArray[0], RegisterArray[1], RegisterArray[2], RegisterArray[3], RegisterArray[4], RegisterArray[5], RegisterArray[6], RegisterArray[7], RegisterArray[8], RegisterArray[9], RegisterArray[10], RegisterArray[11], RegisterArray[12], RegisterArray[13], RegisterArray[14], RegisterArray[15], RegisterArray[16], RegisterArray[17], RegisterArray[18], RegisterArray[19], RegisterArray[20], RegisterArray[21], RegisterArray[22], RegisterArray[23], RegisterArray[24], RegisterArray[25], RegisterArray[26], RegisterArray[27], RegisterArray[28], RegisterArray[29], RegisterArray[30], RegisterArray[31], ReadRegister2);

endmodule


module DFlipFlop(Q, D, Reset, CLK);
	
	output Q;
	input D, Reset, CLK;
	reg Q;

	always @(posedge CLK or posedge Reset)
		if (Reset)
			Q = 0;
		else
			Q = D;

endmodule


module RegisterBit(BitOutput, BitData, WriteEnable, Reset, CLK);

	output BitOutput;
	input BitData, WriteEnable;
	input Reset, CLK;
	wire D, F1, F2;
	wire Reset;

	and #(50) a0(F1, BitOutput, (~WriteEnable));
	and #(50) a1(F2, BitData, WriteEnable);
	or  #(50) o0(D, F1, F2);
	DFlipFlop dff0(BitOutput, D, Reset, CLK);

endmodule


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


module Decoder(WriteEnable, RegisterWrite, WriteRegister);

	output[31:0] WriteEnable;
	input RegisterWrite;
	input[4:0] WriteRegister;
	wire[31:0] OutputEnable;

	Decoder5to32 d5t32(OutputEnable, WriteRegister);

	assign 
		WriteEnable[0] = 0;
		and  #(50) a0(WriteEnable[1], OutputEnable[1], RegisterWrite);
		and  #(50) a1(WriteEnable[2], OutputEnable[2], RegisterWrite);
		and  #(50) a2(WriteEnable[3], OutputEnable[3], RegisterWrite);
		and  #(50) a3(WriteEnable[4], OutputEnable[4], RegisterWrite);
		and  #(50) a4(WriteEnable[5], OutputEnable[5], RegisterWrite);
		and  #(50) a5(WriteEnable[6], OutputEnable[6], RegisterWrite);
		and  #(50) a6(WriteEnable[7], OutputEnable[7], RegisterWrite);
		and  #(50) a7(WriteEnable[8], OutputEnable[8], RegisterWrite);
		and  #(50) a8(WriteEnable[9], OutputEnable[9], RegisterWrite);
		and  #(50) a9(WriteEnable[10], OutputEnable[10], RegisterWrite);
		and  #(50) a10(WriteEnable[11], OutputEnable[11], RegisterWrite);
		and  #(50) a11(WriteEnable[12], OutputEnable[12], RegisterWrite);
		and  #(50) a12(WriteEnable[13], OutputEnable[13], RegisterWrite);
		and  #(50) a13(WriteEnable[14], OutputEnable[14], RegisterWrite);
		and  #(50) a14(WriteEnable[15], OutputEnable[15], RegisterWrite);
		and  #(50) a15(WriteEnable[16], OutputEnable[16], RegisterWrite);
		and  #(50) a16(WriteEnable[17], OutputEnable[17], RegisterWrite);
		and  #(50) a17(WriteEnable[18], OutputEnable[18], RegisterWrite);
		and  #(50) a18(WriteEnable[19], OutputEnable[19], RegisterWrite);
		and  #(50) a19(WriteEnable[20], OutputEnable[20], RegisterWrite);
		and  #(50) a20(WriteEnable[21], OutputEnable[21], RegisterWrite);
		and  #(50) a21(WriteEnable[22], OutputEnable[22], RegisterWrite);
		and  #(50) a22(WriteEnable[23], OutputEnable[23], RegisterWrite);
		and  #(50) a23(WriteEnable[24], OutputEnable[24], RegisterWrite);
		and  #(50) a24(WriteEnable[25], OutputEnable[25], RegisterWrite);
		and  #(50) a25(WriteEnable[26], OutputEnable[26], RegisterWrite);
		and  #(50) a26(WriteEnable[27], OutputEnable[27], RegisterWrite);
		and  #(50) a27(WriteEnable[28], OutputEnable[28], RegisterWrite);
		and  #(50) a28(WriteEnable[29], OutputEnable[29], RegisterWrite);
		and  #(50) a29(WriteEnable[30], OutputEnable[30], RegisterWrite);
		and  #(50) a30(WriteEnable[31], OutputEnable[31], RegisterWrite);

endmodule


module AndMore(G, A, B, C, D, E);

	output G;
	input A, B, C, D, E;
	and #(50) a0(F1, A, B, C, D), a1(G, F1, E);

endmodule


module Decoder5to32(Output, Address);

	output[31:0] Output;
	input[4:0] Address;

	not #(50) inv4(NotA, Address[4]);
	not #(50) inv3(NotB, Address[3]);
	not #(50) inv2(NotC, Address[2]);
	not #(50) inv1(NotD, Address[1]);
	not #(50) inv0(NotE, Address[0]);

	AndMore am0(Output[0], NotA, NotB, NotC, NotD, NotE);
	AndMore am1(Output[1], NotA, NotB, NotC, NotD, Address[0]);
	AndMore am2(Output[2], NotA, NotB, NotC, Address[1], NotE);
	AndMore am3(Output[3], NotA, NotB, NotC, Address[1], Address[0]);
	AndMore am4(Output[4], NotA, NotB, Address[2], NotD, NotE);
	AndMore am5(Output[5], NotA, NotB, Address[2], NotD, Address[0]);
	AndMore am6(Output[6], NotA, NotB, Address[2], Address[1], NotE);
	AndMore am7(Output[7], NotA, NotB, Address[2], Address[1], Address[0]);
	AndMore am8(Output[8], NotA, Address[3], NotC, NotD, NotE);
	AndMore am9(Output[9], NotA, Address[3], NotC, NotD, Address[0]);
	AndMore am10(Output[10], NotA, Address[3], NotC, Address[1], NotE);
	AndMore am11(Output[11], NotA, Address[3], NotC, Address[1], Address[0]);
	AndMore am12(Output[12], NotA, Address[3], Address[2], NotD, NotE);
	AndMore am13(Output[13], NotA, Address[3], Address[2], NotD, Address[0]);
	AndMore am14(Output[14], NotA, Address[3], Address[2], Address[1], NotE);
	AndMore am15(Output[15], NotA, Address[3], Address[2], Address[1], Address[0]);
	AndMore am16(Output[16], Address[4], NotB, NotC, NotD, NotE);
	AndMore am17(Output[17], Address[4], NotB, NotC, NotD, Address[0]);
	AndMore am18(Output[18], Address[4], NotB, NotC, Address[1], NotE);
	AndMore am19(Output[19], Address[4], NotB, NotC, Address[1], Address[0]);
	AndMore am20(Output[20], Address[4], NotB, Address[2], NotD, NotE);
	AndMore am21(Output[21], Address[4], NotB, Address[2], NotD, Address[0]);
	AndMore am22(Output[22], Address[4], NotB, Address[2], Address[1], NotE);
	AndMore am23(Output[23], Address[4], NotB, Address[2], Address[1], Address[0]);
	AndMore am24(Output[24], Address[4], Address[3], NotC, NotD, NotE);
	AndMore am25(Output[25], Address[4], Address[3], NotC, NotD, Address[0]);
	AndMore am26(Output[26], Address[4], Address[3], NotC, Address[1], NotE);
	AndMore am27(Output[27], Address[4], Address[3], NotC, Address[1], Address[0]);
	AndMore am28(Output[28], Address[4], Address[3], Address[2], NotD, NotE);
	AndMore am29(Output[29], Address[4], Address[3], Address[2], NotD, Address[0]);
	AndMore am30(Output[30], Address[4], Address[3], Address[2], Address[1], NotE);
	AndMore am31(Output[31], Address[4], Address[3], Address[2], Address[1], Address[0]);

endmodule


module MUX32to1(Output, Input, Select);
	
	output Output;
	input[31:0] Input;
	input[4:0] Select;
	wire[31:0] OutputEnable, F;

	Decoder5to32 d5t32(OutputEnable, Select);

	and  #(50) a0(F[0], OutputEnable[0], Input[0]);
	and  #(50) a1(F[1], OutputEnable[1], Input[1]);
	and  #(50) a2(F[2], OutputEnable[2], Input[2]);
	and  #(50) a3(F[3], OutputEnable[3], Input[3]);
	and  #(50) a4(F[4], OutputEnable[4], Input[4]);
	and  #(50) a5(F[5], OutputEnable[5], Input[5]);
	and  #(50) a6(F[6], OutputEnable[6], Input[6]);
	and  #(50) a7(F[7], OutputEnable[7], Input[7]);
	and  #(50) a8(F[8], OutputEnable[8], Input[8]);
	and  #(50) a9(F[9], OutputEnable[9], Input[9]);
	and  #(50) a10(F[10], OutputEnable[10], Input[10]);
	and  #(50) a11(F[11], OutputEnable[11], Input[11]);
	and  #(50) a12(F[12], OutputEnable[12], Input[12]);
	and  #(50) a13(F[13], OutputEnable[13], Input[13]);
	and  #(50) a14(F[14], OutputEnable[14], Input[14]);
	and  #(50) a15(F[15], OutputEnable[15], Input[15]);
	and  #(50) a16(F[16], OutputEnable[16], Input[16]);
	and  #(50) a17(F[17], OutputEnable[17], Input[17]);
	and  #(50) a18(F[18], OutputEnable[18], Input[18]);
	and  #(50) a19(F[19], OutputEnable[19], Input[19]);
	and  #(50) a20(F[20], OutputEnable[20], Input[20]);
	and  #(50) a21(F[21], OutputEnable[21], Input[21]);
	and  #(50) a22(F[22], OutputEnable[22], Input[22]);
	and  #(50) a23(F[23], OutputEnable[23], Input[23]);
	and  #(50) a24(F[24], OutputEnable[24], Input[24]);
	and  #(50) a25(F[25], OutputEnable[25], Input[25]);
	and  #(50) a26(F[26], OutputEnable[26], Input[26]);
	and  #(50) a27(F[27], OutputEnable[27], Input[27]);
	and  #(50) a28(F[28], OutputEnable[28], Input[28]);
	and  #(50) a29(F[29], OutputEnable[29], Input[29]);
	and  #(50) a30(F[30], OutputEnable[30], Input[30]);
	and  #(50) a31(F[31], OutputEnable[31], Input[31]);
	or #(50) o0(G3, F[0], F[1], F[2], F[3]);
	or #(50) o1(G4, F[4], F[5], F[6], F[7]);
	or #(50) o2(G5, F[8], F[9], F[10], F[11]);
	or #(50) o3(G6, F[12], F[13], F[14], F[15]);
	or #(50) o4(G7, F[16], F[17], F[18], F[19]);
	or #(50) o5(G8, F[20], F[21], F[22], F[23]);
	or #(50) o6(G9, F[24], F[25], F[26], F[27]);
	or #(50) o7(G10, F[28], F[29], F[30], F[31]);
	or #(50) o8(G11, G3, G4, G5, G6);
	or #(50) o9(G12, G7, G8, G9, 10);
	or #(50) o(Output, G11, G12);

endmodule


module MUX32x32to32(ReadData, Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7, Input8, Input9, Input10, Input11, Input12, Input13, Input14, Input15, Input16, Input17, Input18, Input19, Input20, Input21, Input22, Input23, Input24, Input25, Input26, Input27, Input28, Input29, Input30, Input31, ReadRegister);

	output [31:0] ReadData;
	input[31:0] Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7, Input8, Input9, Input10, Input11, Input12, Input13, Input14, Input15, Input16, Input17, Input18, Input19, Input20, Input21, Input22, Input23, Input24, Input25, Input26, Input27, Input28, Input29, Input30, Input31;
	input[4:0] ReadRegister;
	reg[31:0] ArrayRegister[0:31];
	integer j;

	always @(*)
		begin
			for (j = 0; j <= 31; j = j + 1)
				ArrayRegister[j] = {Input31[j], Input30[j], Input29[j], Input28[j], Input27[j], Input26[j], Input25[j], Input24[j], Input23[j], Input22[j], Input21[j], Input20[j], Input19[j], Input18[j], Input17[j], Input16[j], Input15[j], Input14[j], Input13[j], Input12[j], Input11[j], Input10[j], Input9[j], Input8[j], Input7[j], Input6[j], Input5[j], Input4[j], Input3[j], Input2[j], Input1[j], Input0[j]};
		end

	MUX32to1 mux0(ReadData[0], ArrayRegister[0], ReadRegister);
	MUX32to1 mux1(ReadData[1], ArrayRegister[1], ReadRegister);
	MUX32to1 mux2(ReadData[2], ArrayRegister[2], ReadRegister);
	MUX32to1 mux3(ReadData[3], ArrayRegister[3], ReadRegister);
	MUX32to1 mux4(ReadData[4], ArrayRegister[4], ReadRegister);
	MUX32to1 mux5(ReadData[5], ArrayRegister[5], ReadRegister);
	MUX32to1 mux6(ReadData[6], ArrayRegister[6], ReadRegister);
	MUX32to1 mux7(ReadData[7], ArrayRegister[7], ReadRegister);
	MUX32to1 mux8(ReadData[8], ArrayRegister[8], ReadRegister);
	MUX32to1 mux9(ReadData[9], ArrayRegister[9], ReadRegister);
	MUX32to1 mux10(ReadData[10], ArrayRegister[10], ReadRegister);
	MUX32to1 mux11(ReadData[11], ArrayRegister[11], ReadRegister);
	MUX32to1 mux12(ReadData[12], ArrayRegister[12], ReadRegister);
	MUX32to1 mux13(ReadData[13], ArrayRegister[13], ReadRegister);
	MUX32to1 mux14(ReadData[14], ArrayRegister[14], ReadRegister);
	MUX32to1 mux15(ReadData[15], ArrayRegister[15], ReadRegister);
	MUX32to1 mux16(ReadData[16], ArrayRegister[16], ReadRegister);
	MUX32to1 mux17(ReadData[17], ArrayRegister[17], ReadRegister);
	MUX32to1 mux18(ReadData[18], ArrayRegister[18], ReadRegister);
	MUX32to1 mux19(ReadData[19], ArrayRegister[19], ReadRegister);
	MUX32to1 mux20(ReadData[20], ArrayRegister[20], ReadRegister);
	MUX32to1 mux21(ReadData[21], ArrayRegister[21], ReadRegister);
	MUX32to1 mux22(ReadData[22], ArrayRegister[22], ReadRegister);
	MUX32to1 mux23(ReadData[23], ArrayRegister[23], ReadRegister);
	MUX32to1 mux24(ReadData[24], ArrayRegister[24], ReadRegister);
	MUX32to1 mux25(ReadData[25], ArrayRegister[25], ReadRegister);
	MUX32to1 mux26(ReadData[26], ArrayRegister[26], ReadRegister);
	MUX32to1 mux27(ReadData[27], ArrayRegister[27], ReadRegister);
	MUX32to1 mux28(ReadData[28], ArrayRegister[28], ReadRegister);
	MUX32to1 mux29(ReadData[29], ArrayRegister[29], ReadRegister);
	MUX32to1 mux30(ReadData[30], ArrayRegister[30], ReadRegister);
	MUX32to1 mux31(ReadData[31], ArrayRegister[31], ReadRegister);

endmodule
