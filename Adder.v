// 32-bit Adder Module

// Verilog code for 32-bit adder.

`timescale 1 ps / 100 fs
module Add(Z, A, B);

	output[31:0] Z;
	input[31:0] A, B;
	wire[31:0] C;

	Adder1Bit a1b0(Z[0], C[0], A[0], B[0], 1'b0);
	Adder1Bit a1b1(Z[1], C[1], A[1], B[1], C[0]);
	Adder1Bit a1b2(Z[2], C[2], A[2], B[2], C[1]);
	Adder1Bit a1b3(Z[3], C[3], A[3], B[3], C[2]);
	Adder1Bit a1b4(Z[4], C[4], A[4], B[4], C[3]);
	Adder1Bit a1b5(Z[5], C[5], A[5], B[5], C[4]);
	Adder1Bit a1b6(Z[6], C[6], A[6], B[6], C[5]);
	Adder1Bit a1b7(Z[7], C[7], A[7], B[7], C[6]);
	Adder1Bit a1b8(Z[8], C[8], A[8], B[8], C[7]);
	Adder1Bit a1b9(Z[9], C[9], A[9], B[9], C[8]);
	Adder1Bit a1b10(Z[10], C[10], A[10], B[10], C[9]);
	Adder1Bit a1b11(Z[11], C[11], A[11], B[11], C[10]);
	Adder1Bit a1b12(Z[12], C[12], A[12], B[12], C[11]);
	Adder1Bit a1b13(Z[13], C[13], A[13], B[13], C[12]);
	Adder1Bit a1b14(Z[14], C[14], A[14], B[14], C[13]);
	Adder1Bit a1b15(Z[15], C[15], A[15], B[15], C[14]);
	Adder1Bit a1b16(Z[16], C[16], A[16], B[16], C[15]);
	Adder1Bit a1b17(Z[17], C[17], A[17], B[17], C[16]);
	Adder1Bit a1b18(Z[18], C[18], A[18], B[18], C[17]);
	Adder1Bit a1b19(Z[19], C[19], A[19], B[19], C[18]);
	Adder1Bit a1b20(Z[20], C[20], A[20], B[20], C[19]);
	Adder1Bit a1b21(Z[21], C[21], A[21], B[21], C[20]);
	Adder1Bit a1b22(Z[22], C[22], A[22], B[22], C[21]);
	Adder1Bit a1b23(Z[23], C[23], A[23], B[23], C[22]);
	Adder1Bit a1b24(Z[24], C[24], A[24], B[24], C[23]);
	Adder1Bit a1b25(Z[25], C[25], A[25], B[25], C[24]);
	Adder1Bit a1b26(Z[26], C[26], A[26], B[26], C[25]);
	Adder1Bit a1b27(Z[27], C[27], A[27], B[27], C[26]);
	Adder1Bit a1b28(Z[28], C[28], A[28], B[28], C[27]);
	Adder1Bit a1b29(Z[29], C[29], A[29], B[29], C[28]);
	Adder1Bit a1b30(Z[30], C[30], A[30], B[30], C[29]);
	Adder1Bit a1b31(Z[31], C[31], A[31], B[31], C[30]);

endmodule


module Adder1Bit(Sum, Cout, A, B, Cin);

	output Cout, Sum;
	input A, B, Cin;

	xor #(50) (Sum, A, B, Cin);			// Sum = A xor B xor Cin
	and #(50) a1(C1, A, B);				// carry out = (a and b) or (cin and (a or b))
	or #(50) o1(C2, A, B);
	and #(50) a2(C3, C2, Cin);
	or #(50) o2(Cout, C1, C3);

endmodule 