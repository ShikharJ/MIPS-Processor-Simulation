// 32-bit Decoder Module


// Verilog code for 32-bit Decoder, iterating over single bits.
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


// Verilog code for custom And operation.
module AndMore(G, A, B, C, D, E);

	output G;
	input A, B, C, D, E;
	and #(50) a0(F1, A, B, C, D), a1(G, F1, E);

endmodule


// Verilog code for 5-to-32 bit Decoder module.
module Decoder5to32(Output, Address);

	output[31:0] Output;
	input[4:0] Address;				// Address of the Register

	not #(50) inv4(NotA, Address[4]);
	not #(50) inv3(NotB, Address[3]);
	not #(50) inv2(NotC, Address[2]);
	not #(50) inv1(NotD, Address[1]);
	not #(50) inv0(NotE, Address[0]);

	AndMore am0(Output[0], NotA, NotB, NotC, NotD, NotE);			// 00000
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
	AndMore am31(Output[31], Address[4], Address[3], Address[2], Address[1], Address[0]);	// 11111

endmodule
