// Flush Control Module

// Verilog code for Flush Control Unit and Discard Instructions Unit.

`timescale 1 ps / 100 fs
module FlushBlock(ID_RegisterDestination, ID_ALUSource, ID_MemoryToRegister, ID_RegisterWrite, ID_MemoryRead, ID_MemoryWrite, ID_Branch, ID_ALUOperation, ID_JRControl, Flush, RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, ALUOperation, JRControl);

	output ID_RegisterDestination, ID_ALUSource, ID_MemoryToRegister, ID_RegisterWrite, ID_MemoryRead, ID_MemoryWrite, ID_Branch, ID_JRControl;
	output[1:0] ID_ALUOperation;
	input Flush, RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, JRControl;
	input[1:0] ALUOperation;

	not #50 (NotFlush, Flush);
	and #50 a0(ID_RegisterDestination, RegisterDestination, NotFlush);
	and #50 a1(ID_ALUSource, ALUSource, NotFlush);
	and #50 a2(ID_MemoryToRegister, MemoryToRegister, NotFlush);
	and #50 a3(ID_RegisterWrite, RegisterWrite, NotFlush);
	and #50 a4(ID_MemoryRead, MemoryRead, NotFlush);
	and #50 a5(ID_MemoryWrite, MemoryWrite, NotFlush);
	and #50 a6(ID_Branch, Branch, NotFlush);
	and #50 a7(ID_JRControl, JRControl, NotFlush);
	and #50 a8(ID_ALUOperation[1], ALUOperation[1], NotFlush);
	and #50 a9(ID_ALUOperation[0], ALUOperation[0], NotFlush);

endmodule


`timescale 1 ps / 100 fs
module DiscardInstructions(IDFlush, IFFlush, Jump, BNE, JR);

	output IDFlush, IFFlush;
	input Jump, BNE, JR;
	or #50 o0(IFFlush, Jump, BNE, JR);
	or #50 o1(IDFlush, BNE, JR);

endmodule