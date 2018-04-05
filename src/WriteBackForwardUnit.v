// Write Back Forward Module

// Verilog code for Write Back Forward Unit and Address Comparison Unit.

`timescale 1 ps / 100 fs
module WBForward(ReadData1Output, ReadData2Output, ReadData1, ReadData2, Rs, Rt, WriteRegister, WriteData, RegisterWrite);

	output[31:0] ReadData1Output, ReadData2Output;
	input[31:0] ReadData1, ReadData2, WriteData;
	input[4:0] Rs, Rt, WriteRegister;
	input RegisterWrite;
	wire ReadSourceRs, ReadSourceRt;
	wire CompareOutput1, CompareOutput2;

	or #(50) o0(OrOutput1, WriteRegister[4], WriteRegister[3], WriteRegister[2], WriteRegister[1], WriteRegister[0]);
	CompareAddress Compare1(CompareOutput1, WriteRegister, Rs);
	and #(50) a0(ReadSourceRs, RegisterWrite, OrOutput1, CompareOutput1);

	CompareAddress Compare2(CompareOutput2, WriteRegister, Rt);
	and #(50) a1(ReadSourceRt, RegisterWrite, OrOutput1, CompareOutput2);

	MUX2x32to32 mux0(ReadData1Output, ReadData1, WriteData, ReadSourceRs);
	MUX2x32to32 mux1(ReadData2Output, ReadData2, WriteData, ReadSourceRt);

endmodule


`timescale 1 ps / 100 fs
module CompareAddress(Equal, Address1, Address2);

	output Equal;
	wire Equal;
	input[4:0] Address1, Address2;
	wire[4:0] Address1, Address2, XorAddress;

	xor #(50) x0(XorAddress[4], Address1[4], Address2[4]);
	xor #(50) x1(XorAddress[3], Address1[3], Address2[3]);
	xor #(50) x2(XorAddress[2], Address1[2], Address2[2]);
	xor #(50) x3(XorAddress[1], Address1[1], Address2[1]);
	xor #(50) x4(XorAddress[0], Address1[0], Address2[0]);
	or #(50) o0(OrAddress, XorAddress[4], XorAddress[3], XorAddress[2], XorAddress[1], XorAddress[0]);
	not #(50) inv0(Equal, OrAddress);

endmodule