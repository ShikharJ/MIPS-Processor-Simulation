// Stall Control Module


// Verilog code for Stall Control module.
`timescale 1 ps / 100 fs
module StallControl(PC_WriteEnable, IFID_WriteEnable, StallFlush, EX_MemoryRead, EX_rt, ID_rs, ID_rt, ID_Op);

	output PC_WriteEnable, IFID_WriteEnable, StallFlush;
	wire PC_WriteEnable, IFID_WriteEnable, StallFlush;
	input EX_MemoryRead, EX_rt, ID_rs, ID_rt;
	input[5:0] ID_Op;
	wire[4:0] EX_rt, ID_rs, ID_rt, XorRsRt, XorRtRt;
	wire[5:0] XorOpcodeLW, XorOpcodeXorI;
	wire EX_MemoryRead;

	// Structural Model
	xor #(50) x0(XorRsRt[4], EX_rt[4], ID_rs[4]);
	xor #(50) x1(XorRsRt[3], EX_rt[3], ID_rs[3]);
	xor #(50) x2(XorRsRt[2], EX_rt[2], ID_rs[2]);
	xor #(50) x3(XorRsRt[1], EX_rt[1], ID_rs[1]);
	xor #(50) x4(XorRsRt[0], EX_rt[0], ID_rs[0]);
	or #(50) o0(OrRsRt, XorRsRt[4], XorRsRt[3], XorRsRt[2], XorRsRt[1], XorRsRt[0]);
	not #(50) inv0(NotOrRsRt, OrRsRt);				// If EX_rt == ID_rs then NotOrRsRt = 1

	xor #(50) x5(XorRtRt[4], EX_rt[4], ID_rt[4]);
	xor #(50) x6(XorRtRt[3], EX_rt[3], ID_rt[3]);
	xor #(50) x7(XorRtRt[2], EX_rt[2], ID_rt[2]);
	xor #(50) x8(XorRtRt[1], EX_rt[1], ID_rt[1]);
	xor #(50) x9(XorRtRt[0], EX_rt[0], ID_rt[0]);
	or #(50) o1(OrRtRt, XorRtRt[4], XorRtRt[3], XorRtRt[2], XorRtRt[1], XorRtRt[0]);
	not #(50) inv1(NotOrRtRt, OrRtRt);				// If EX_rt == ID_rt then NotOrRtRt = 1

	xor #(50) x10(XorOpcodeLW[5], ID_Op[5], 1'b1);
	xor #(50) x11(XorOpcodeLW[4], ID_Op[4], 1'b0);
	xor #(50) x12(XorOpcodeLW[3], ID_Op[3], 1'b0);
	xor #(50) x13(XorOpcodeLW[2], ID_Op[2], 1'b0);
	xor #(50) x14(XorOpcodeLW[1], ID_Op[1], 1'b1);
	xor #(50) x15(XorOpcodeLW[0], ID_Op[0], 1'b1);
	or #(50) o2(EC1, XorOpcodeLW[5], XorOpcodeLW[4], XorOpcodeLW[3], XorOpcodeLW[2], XorOpcodeLW[1], XorOpcodeLW[0]);

	xor #(50) x16(XorOpcodeXorI[5], ID_Op[5], 1'b0);
	xor #(50) x17(XorOpcodeXorI[4], ID_Op[4], 1'b0);
	xor #(50) x18(XorOpcodeXorI[3], ID_Op[3], 1'b1);
	xor #(50) x19(XorOpcodeXorI[2], ID_Op[2], 1'b1);
	xor #(50) x20(XorOpcodeXorI[1], ID_Op[1], 1'b1);
	xor #(50) x21(XorOpcodeXorI[0], ID_Op[0], 1'b0);
	or #(50) o3(EC2, XorOpcodeXorI[5], XorOpcodeXorI[4], XorOpcodeXorI[3], XorOpcodeXorI[2], XorOpcodeXorI[1], XorOpcodeXorI[0]);

	and #(50) a0(XorOp, EC1, EC2);
	and #(50) a1(XorOpRt, XorOp, NotOrRtRt);
	or #(50) o4(OrOut, NotOrRsRt, XorOpRt);
	and #(50) a2(Condition, EX_MemoryRead, OrOut);		// Condition = 1 when Stall is satisfied

	not #(50) inv2(PC_WriteEnable, Condition);
	not #(50) inv3(IFID_WriteEnable, Condition);
	buf #(50) bufStallflush(StallFlush, Condition);

endmodule
