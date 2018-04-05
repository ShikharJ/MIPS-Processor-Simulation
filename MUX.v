// MUX Module

// Verilog code for Miscellaneous MUX modules.

`timescale 1 ps / 100 fs
module MUX2x32to32(DataOutput, Data0, Data1, Selector);

	output[31:0] DataOutput;
	input[31:0] Data0, Data1;
	input Selector;

	MUX2_1 mux0(DataOutput[0], Data0[0], Data1[0], Selector);
	MUX2_1 mux1(DataOutput[1], Data0[1], Data1[1], Selector);
	MUX2_1 mux2(DataOutput[2], Data0[2], Data1[2], Selector);
	MUX2_1 mux3(DataOutput[3], Data0[3], Data1[3], Selector);
	MUX2_1 mux4(DataOutput[4], Data0[4], Data1[4], Selector);
	MUX2_1 mux5(DataOutput[5], Data0[5], Data1[5], Selector);
	MUX2_1 mux6(DataOutput[6], Data0[6], Data1[6], Selector);
	MUX2_1 mux7(DataOutput[7], Data0[7], Data1[7], Selector);
	MUX2_1 mux8(DataOutput[8], Data0[8], Data1[8], Selector);
	MUX2_1 mux9(DataOutput[9], Data0[9], Data1[9], Selector);
	MUX2_1 mux10(DataOutput[10], Data0[10], Data1[10], Selector);
	MUX2_1 mux11(DataOutput[11], Data0[11], Data1[11], Selector);
	MUX2_1 mux12(DataOutput[12], Data0[12], Data1[12], Selector);
	MUX2_1 mux13(DataOutput[13], Data0[13], Data1[13], Selector);
	MUX2_1 mux14(DataOutput[14], Data0[14], Data1[14], Selector);
	MUX2_1 mux15(DataOutput[15], Data0[15], Data1[15], Selector);
	MUX2_1 mux16(DataOutput[16], Data0[16], Data1[16], Selector);
	MUX2_1 mux17(DataOutput[17], Data0[17], Data1[17], Selector);
	MUX2_1 mux18(DataOutput[18], Data0[18], Data1[18], Selector);
	MUX2_1 mux19(DataOutput[19], Data0[19], Data1[19], Selector);
	MUX2_1 mux20(DataOutput[20], Data0[20], Data1[20], Selector);
	MUX2_1 mux21(DataOutput[21], Data0[21], Data1[21], Selector);
	MUX2_1 mux22(DataOutput[22], Data0[22], Data1[22], Selector);
	MUX2_1 mux23(DataOutput[23], Data0[23], Data1[23], Selector);
	MUX2_1 mux24(DataOutput[24], Data0[24], Data1[24], Selector);
	MUX2_1 mux25(DataOutput[25], Data0[25], Data1[25], Selector);
	MUX2_1 mux26(DataOutput[26], Data0[26], Data1[26], Selector);
	MUX2_1 mux27(DataOutput[27], Data0[27], Data1[27], Selector);
	MUX2_1 mux28(DataOutput[28], Data0[28], Data1[28], Selector);
	MUX2_1 mux29(DataOutput[29], Data0[29], Data1[29], Selector);
	MUX2_1 mux30(DataOutput[30], Data0[30], Data1[30], Selector);
	MUX2_1 mux31(DataOutput[31], Data0[31], Data1[31], Selector);

endmodule


`timescale 1 ps / 100 fs
module MUX2x5to5(AdderOut, Adder0, Adder1, Selector);

	output[4:0] AdderOut;
	input[4:0] Adder0, Adder1;
	input Selector;

	MUX21 mux0(AdderOut[0], Adder0[0], Adder1[0], Selector);
	MUX21 mux1(AdderOut[1], Adder0[1], Adder1[1], Selector);
	MUX21 mux2(AdderOut[2], Adder0[2], Adder1[2], Selector);
	MUX21 mux3(AdderOut[3], Adder0[3], Adder1[3], Selector);
	MUX21 mux4(AdderOut[4], Adder0[4], Adder1[4], Selector);

endmodule


module MUX2_1(O, A, B, Selector);

	output O;
	input A, B, Selector;

	not #(50) inv0(NotSelector, Selector);
	and #(50) a0(O1, A, NotSelector); 
	and #(50) a1(O2, B, Selector);
	or #(50) o0(O, O1, O2);

endmodule


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