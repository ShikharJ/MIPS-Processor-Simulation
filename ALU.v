// 32-bit ALU Module

// Verilog code for ALU block of the MIPS Processsor.

`timescale 1ps / 100 fs
module ALU(Output, CarryOut, Zero, Overflow, Negative, BusA, BusB, ALUControl);

	output[31:0] Output;
	output CarryOut, Zero, Overflow, Negative;
	input[31:0] BusA, BusB;
	input[1:0] ALUControl;
	wire LessThan;
	wire[31:0] Carryout;

	ALU1bit ALU0(Output[0], Carryout[0], BusA[0], BusB[0], ALUControl[1], LessThan, ALUControl);
	ALU1bit ALU1(Output[1], Carryout[1], BusA[1], BusB[1], Carryout[0], 1'b0, ALUControl);
	ALU1bit ALU2(Output[2], Carryout[2], BusA[2], BusB[2], Carryout[1], 1'b0, ALUControl);
	ALU1bit ALU3(Output[3], Carryout[3], BusA[3], BusB[3], Carryout[2], 1'b0, ALUControl);
	ALU1bit ALU4(Output[4], Carryout[4], BusA[4], BusB[4], Carryout[3], 1'b0, ALUControl);
	ALU1bit ALU5(Output[5], Carryout[5], BusA[5], BusB[5], Carryout[4], 1'b0, ALUControl);
	ALU1bit ALU6(Output[6], Carryout[6], BusA[6], BusB[6], Carryout[5], 1'b0, ALUControl);
	ALU1bit ALU7(Output[7], Carryout[7], BusA[7], BusB[7], Carryout[6], 1'b0, ALUControl);
	ALU1bit ALU8(Output[8], Carryout[8], BusA[8], BusB[8], Carryout[7], 1'b0, ALUControl);
	ALU1bit ALU9(Output[9], Carryout[9], BusA[9], BusB[9], Carryout[8], 1'b0, ALUControl);
	ALU1bit ALU10(Output[10], Carryout[10], BusA[10], BusB[10], Carryout[9], 1'b0, ALUControl);
	ALU1bit ALU11(Output[11], Carryout[11], BusA[11], BusB[11], Carryout[10], 1'b0, ALUControl);
	ALU1bit ALU12(Output[12], Carryout[12], BusA[12], BusB[12], Carryout[11], 1'b0, ALUControl);
	ALU1bit ALU13(Output[13], Carryout[13], BusA[13], BusB[13], Carryout[12], 1'b0, ALUControl);
	ALU1bit ALU14(Output[14], Carryout[14], BusA[14], BusB[14], Carryout[13], 1'b0, ALUControl);
	ALU1bit ALU15(Output[15], Carryout[15], BusA[15], BusB[15], Carryout[14], 1'b0, ALUControl);
	ALU1bit ALU16(Output[16], Carryout[16], BusA[16], BusB[16], Carryout[15], 1'b0, ALUControl);
	ALU1bit ALU17(Output[17], Carryout[17], BusA[17], BusB[17], Carryout[16], 1'b0, ALUControl);
	ALU1bit ALU18(Output[18], Carryout[18], BusA[18], BusB[18], Carryout[17], 1'b0, ALUControl);
	ALU1bit ALU19(Output[19], Carryout[19], BusA[19], BusB[19], Carryout[18], 1'b0, ALUControl);
	ALU1bit ALU20(Output[20], Carryout[20], BusA[20], BusB[20], Carryout[19], 1'b0, ALUControl);
	ALU1bit ALU21(Output[21], Carryout[21], BusA[21], BusB[21], Carryout[20], 1'b0, ALUControl);
	ALU1bit ALU22(Output[22], Carryout[22], BusA[22], BusB[22], Carryout[21], 1'b0, ALUControl);
	ALU1bit ALU23(Output[23], Carryout[23], BusA[23], BusB[23], Carryout[22], 1'b0, ALUControl);
	ALU1bit ALU24(Output[24], Carryout[24], BusA[24], BusB[24], Carryout[23], 1'b0, ALUControl);
	ALU1bit ALU25(Output[25], Carryout[25], BusA[25], BusB[25], Carryout[24], 1'b0, ALUControl);
	ALU1bit ALU26(Output[26], Carryout[26], BusA[26], BusB[26], Carryout[25], 1'b0, ALUControl);
	ALU1bit ALU27(Output[27], Carryout[27], BusA[27], BusB[26], Carryout[26], 1'b0, ALUControl);
	ALU1bit ALU28(Output[28], Carryout[28], BusA[28], BusB[28], Carryout[27], 1'b0, ALUControl);
	ALU1bit ALU29(Output[29], Carryout[29], BusA[29], BusB[29], Carryout[28], 1'b0, ALUControl);
	ALU1bit ALU30(Output[30], Carryout[30], BusA[30], BusB[30], Carryout[29], 1'b0, ALUControl);
	ALU1bit ALU31(Output[31], Carryout[31], BusA[31], BusB[31], Carryout[30], 1'b0, ALUControl);

	not #(50) inv0(NotCarryout31, Carryout[31]);
	MUX21 MUX0(CarryOut, Carryout[31], NotCarryout31, ALUControl[1]);
	xor #(50) x0(Overflow, Carryout[30], Carryout[31]);

	AddSubtract addsub0(AddSubtract31Out, Carryout31, BusA[31], BusB[31], Carryout[30], ALUControl[1]);
	xor #(50) x1(LessThan, Overflow, AddSubtract31Out);
	assign
		Negative = Output[31];
	or #(50) o0(O1, Output[0], Output[1], Output[2], Output[3]);
	or #(50) o1(O2, Output[4], Output[5], Output[6], Output[7]);
	or #(50) o2(O3, Output[8], Output[9], Output[10], Output[11]);
	or #(50) o3(O4, Output[12], Output[13], Output[14], Output[15]);
	or #(50) o4(O5, Output[16], Output[17], Output[18], Output[19]);
	or #(50) o5(O6, Output[20], Output[21], Output[22], Output[23]);
	or #(50) o6(O7, Output[24], Output[25], Output[26], Output[27]);
	or #(50) o7(O8, Output[28], Output[29], Output[30], Output[31]);
	or #(50) o8(O9, O1, O2, O3, O4);
	or #(50) o9(O10, O5, O6, O7, O8);
	nor #(50) n0(Zero, O9, O10);

endmodule


`timescale 1 ps / 100 fs
module ALU1bit(Result, CarryOut, A, B, CarryIn, Less, ALUControl);

	output Result, CarryOut;
	input A, B, CarryIn, Less;
	input[1:0] ALUControl;

	AddSubtract addsub0(AddSubtractOut, CarryOut, A, B, CarryIn, ALUControl[1]);
	xor #(50) x0(XorOut, A, B);
	MUX21 mux0(XorLessOut, XorOut, Less, ALUControl[1]);
	MUX21 mux1(Result, AddSubtractOut, XorLessOut, ALUControl[0]);

endmodule


`timescale 1 ps / 100 fs
module AddSubtract(Output, Cout, A, B, Cin, Selector);

	output Output, Cout;
	input A, B, Cin, Selector;

	not #(50) inv0(NotB, B);
	MUX21 mux0(B1, B, NotB, Selector);
	Adder adder0(Output, Cout, A, B1, Cin);

endmodule


`timescale 1 ps / 100 fs
module Adder(Sum, Cout, A, B, Cin);

	output Cout, Sum;
	input A, B, Cin;

	xor #(50) (Sum, A, B, Cin);
	and #(50) a0(C1, A, B);
	or #(50) o0(C2, A, B);
	and #(50) a1(C3, C2, Cin);
	or #(50) o1(Cout, C1, C3);

endmodule


`timescale 1 ps / 100 fs
module MUX21(O, A, B, Selector);

	output O;
	input A, B, Selector;

	not #(50) inv0(NotSelector, Selector);
	and #(50) a0(O1, A, NotSelector); 
	and #(50) a1(O2, B, Selector);
	or #(50) o0(O, O1, O2);

endmodule