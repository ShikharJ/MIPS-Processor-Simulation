// MUX Module
// Verilog code for Miscellaneous MUX modules.


// Verilog code for dual-input 32-to-32 Multiplexor module.
`timescale 1 ps / 100 fs
module MUX2x32to32(DataOutput, Data0, Data1, Selector);

	output[31:0] DataOutput;			// Data Output
	input[31:0] Data0, Data1;			// Dual Data Inputs
	input Selector;

	MUX21 mux0(DataOutput[0], Data0[0], Data1[0], Selector);
	MUX21 mux1(DataOutput[1], Data0[1], Data1[1], Selector);
	MUX21 mux2(DataOutput[2], Data0[2], Data1[2], Selector);
	MUX21 mux3(DataOutput[3], Data0[3], Data1[3], Selector);
	MUX21 mux4(DataOutput[4], Data0[4], Data1[4], Selector);
	MUX21 mux5(DataOutput[5], Data0[5], Data1[5], Selector);
	MUX21 mux6(DataOutput[6], Data0[6], Data1[6], Selector);
	MUX21 mux7(DataOutput[7], Data0[7], Data1[7], Selector);
	MUX21 mux8(DataOutput[8], Data0[8], Data1[8], Selector);
	MUX21 mux9(DataOutput[9], Data0[9], Data1[9], Selector);
	MUX21 mux10(DataOutput[10], Data0[10], Data1[10], Selector);
	MUX21 mux11(DataOutput[11], Data0[11], Data1[11], Selector);
	MUX21 mux12(DataOutput[12], Data0[12], Data1[12], Selector);
	MUX21 mux13(DataOutput[13], Data0[13], Data1[13], Selector);
	MUX21 mux14(DataOutput[14], Data0[14], Data1[14], Selector);
	MUX21 mux15(DataOutput[15], Data0[15], Data1[15], Selector);
	MUX21 mux16(DataOutput[16], Data0[16], Data1[16], Selector);
	MUX21 mux17(DataOutput[17], Data0[17], Data1[17], Selector);
	MUX21 mux18(DataOutput[18], Data0[18], Data1[18], Selector);
	MUX21 mux19(DataOutput[19], Data0[19], Data1[19], Selector);
	MUX21 mux20(DataOutput[20], Data0[20], Data1[20], Selector);
	MUX21 mux21(DataOutput[21], Data0[21], Data1[21], Selector);
	MUX21 mux22(DataOutput[22], Data0[22], Data1[22], Selector);
	MUX21 mux23(DataOutput[23], Data0[23], Data1[23], Selector);
	MUX21 mux24(DataOutput[24], Data0[24], Data1[24], Selector);
	MUX21 mux25(DataOutput[25], Data0[25], Data1[25], Selector);
	MUX21 mux26(DataOutput[26], Data0[26], Data1[26], Selector);
	MUX21 mux27(DataOutput[27], Data0[27], Data1[27], Selector);
	MUX21 mux28(DataOutput[28], Data0[28], Data1[28], Selector);
	MUX21 mux29(DataOutput[29], Data0[29], Data1[29], Selector);
	MUX21 mux30(DataOutput[30], Data0[30], Data1[30], Selector);
	MUX21 mux31(DataOutput[31], Data0[31], Data1[31], Selector);

endmodule


// Verilog code for dual-input 5-to-5 Multiplexor module.
`timescale 1 ps / 100 fs
module MUX2x5to5(AdderOutput, Adder0, Adder1, Selector);

	output[4:0] AdderOutput;			// Address Output
	input[4:0] Adder0, Adder1;			// Dual Address Input
	input Selector;

	MUX21 mux0(AdderOutput[0], Adder0[0], Adder1[0], Selector);
	MUX21 mux1(AdderOutput[1], Adder0[1], Adder1[1], Selector);
	MUX21 mux2(AdderOutput[2], Adder0[2], Adder1[2], Selector);
	MUX21 mux3(AdderOutput[3], Adder0[3], Adder1[3], Selector);
	MUX21 mux4(AdderOutput[4], Adder0[4], Adder1[4], Selector);

endmodule


// Verilog code for triple-input 32-to-32 Multiplexor module.
`timescale 1 ps / 100 fs
module MUX3x32to32(DataOutput, A, B, C, Selector);

	output[31:0] DataOutput;
	input[1:0] Selector;
	input[31:0] A, B, C;
	wire[31:0] DataOutput1, DataOutput2;

	MUX2x32to32 muxab(DataOutput1, A, B, Selector[1]);
	MUX2x32to32 muxca(DataOutput2, C, A, Selector[1]);
	MUX2x32to32 muxabc(DataOutput, DataOutput1, DataOutput2, Selector[0]);

endmodule


// Verilog code for 32-to-1 Multiplexor module.
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


// Verilog code for 32x32-to-32 Multiplexor module, iterating over single bit inputs.
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


// Verilog code for 2-input Multiplexor module.
`timescale 1 ps / 100 fs
module MUX21(O, A, B, Selector);

	output O;
	input A, B, Selector;

	not #(50) inv0(NotSelector, Selector);
	and #(50) a0(O1, A, NotSelector);
	and #(50) a1(O2, B, Selector);
	or #(50) o0(O, O1, O2);

endmodule
