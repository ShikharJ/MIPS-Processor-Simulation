// Forwarding Unit Module

// Verilog code for Forwarding Unit.

`timescale 1 ps / 100 fs
module ForwardingUnit(ForwardA, ForwardB, MEM_RegisterWrite, WB_RegisterWrite, MEM_WriteRegister, WB_WriteRegister, EX_rs, EX_rt);

	output[1:0] ForwardA, ForwardB;
	wire[1:0] ForwardA, ForwardB;
	input MEM_RegisterWrite, WB_RegisterWrite;
	input[4:0] MEM_WriteRegister, WB_WriteRegister, EX_rs, EX_rt;

	or #(50) o0(A, MEM_WriteRegister[4], MEM_WriteRegister[3], MEM_WriteRegister[2], MEM_WriteRegister[1], MEM_WriteRegister[0]);
	CompareAddress CompMEM_WriteReg_EXrs(B, MEM_WriteRegister, EX_rs);
	and #(50) a0(X, MEM_RegisterWrite, A, B);

	or #(50) o1(C, WB_WriteRegister[4], WB_WriteRegister[3], WB_WriteRegister[2], WB_WriteRegister[1], WB_WriteRegister[0]);
	CompareAddress CompWB_WriteReg_EXrs(D, WB_WriteRegister, EX_rs);
	and #(50) a1(Y, WB_RegisterWrite, C, D);

	assign ForwardA[1] = X;
	not #(50) inv0(NotX, X);
	and #(50) a2(ForwardA[0], NotX, Y);

	CompareAddress CompMEM_WriteReg_EXrt(B1, MEM_WriteRegister, EX_rt);
	CompareAddress CompWB_WriteReg_EXrt(D1, WB_WriteRegister, EX_rt);
	and #(50) a3(X1, MEM_RegisterWrite, A, B1);
	and #(50) a4(Y1, WB_RegisterWrite, C, D1);

	assign ForwardB[1] = X1;
	not #(50) inv1(NotX1, X1);
	and #(50) a5(ForwardB[0], NotX1, Y1);

endmodule