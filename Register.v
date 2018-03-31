// Register Module

// Verilog code foro Decoder, MUX, D Flip-Flop and 32-bit Register.

`timescale 1 ps / 100 fs
module RegisterFile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, Reset, Clk);
	
	output[31:0] ReadData1, ReadData2;
	input[4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input[31:0] WriteData;
	input RegWrite, Reset, Clk;
	integer i;
	wire[31:0] WriteEn;
	wire[31:0] RegisterArray[0:31];

	// Decoder Block
	decoder Decoder1(WriteEn, RegWrite, WriteRegister);
	register reg0 (RegArray[0], 32'b0, 1'b1, 1'b0, clk);
	register reg1 (RegArray[1], WriteData, WriteEn[1], Reset, Clk);
	register reg2 (RegArray[2], WriteData, WriteEn[2], Reset, Clk);
	register reg3 (RegArray[3], WriteData, WriteEn[3], Reset, Clk);
	register reg4 (RegArray[4], WriteData, WriteEn[4], Reset, Clk);
	register reg5 (RegArray[5], WriteData, WriteEn[5], Reset, Clk);
	register reg6 (RegArray[6], WriteData, WriteEn[6], Reset, Clk);
	register reg7 (RegArray[7], WriteData, WriteEn[7], Reset, Clk);
	register reg8 (RegArray[8], WriteData, WriteEn[8], Reset, Clk);
	register reg9 (RegArray[9], WriteData, WriteEn[9], Reset, Clk);
	register reg10 (RegArray[10], WriteData, WriteEn[10], Reset, Clk);
	register reg11 (RegArray[11], WriteData, WriteEn[11], Reset, Clk);
	register reg12 (RegArray[12], WriteData, WriteEn[12], Reset, Clk);
	register reg13 (RegArray[13], WriteData, WriteEn[13], Reset, Clk);
	register reg14 (RegArray[14], WriteData, WriteEn[14], Reset, Clk);
	register reg15 (RegArray[15], WriteData, WriteEn[15], Reset, Clk);
	register reg16 (RegArray[16], WriteData, WriteEn[16], Reset, Clk);
	register reg17 (RegArray[17], WriteData, WriteEn[17], Reset, Clk);
	register reg18 (RegArray[18], WriteData, WriteEn[18], Reset, Clk);
	register reg19 (RegArray[19], WriteData, WriteEn[19], Reset, Clk);
	register reg20 (RegArray[20], WriteData, WriteEn[20], Reset, Clk);
	register reg21 (RegArray[21], WriteData, WriteEn[21], Reset, Clk);
	register reg22 (RegArray[22], WriteData, WriteEn[22], Reset, Clk);
	register reg23 (RegArray[23], WriteData, WriteEn[23], Reset, Clk);
	register reg24 (RegArray[24], WriteData, WriteEn[24], Reset, Clk);
	register reg25 (RegArray[25], WriteData, WriteEn[25], Reset, Clk);
	register reg26 (RegArray[26], WriteData, WriteEn[26], Reset, Clk);
	register reg27 (RegArray[27], WriteData, WriteEn[27], Reset, Clk);
	register reg28 (RegArray[28], WriteData, WriteEn[28], Reset, Clk);
	register reg29 (RegArray[29], WriteData, WriteEn[29], Reset, Clk);
	register reg30 (RegArray[30], WriteData, WriteEn[30], Reset, Clk);
	register reg31 (RegArray[31], WriteData, WriteEn[31], Reset, Clk); 

	// 32x32to32 Multiplexor1 Block
    mux32x32to32 Mux1(ReadData1, RegArray[0], RegArray[1], RegArray[2], RegArray[3], RegArray[4], RegArray[5], RegArray[6], RegArray[7], RegArray[8], RegArray[9], RegArray[10], RegArray[11], RegArray[12], RegArray[13], RegArray[14], RegArray[15], RegArray[16], RegArray[17], RegArray[18], RegArray[19], RegArray[20], RegArray[21], RegArray[22], RegArray[23], RegArray[24], RegArray[25], RegArray[26], RegArray[27], RegArray[28], RegArray[29], RegArray[30], RegArray[31], ReadRegister1); 
           
 	// 32x32to32 Multiplexor2 Block
 	mux32x32to32 Mux2(ReadData2, RegArray[0], RegArray[1], RegArray[2], RegArray[3], RegArray[4], RegArray[5], RegArray[6], RegArray[7], RegArray[8], RegArray[9], RegArray[10], RegArray[11], RegArray[12], RegArray[13], RegArray[14], RegArray[15], RegArray[16], RegArray[17], RegArray[18], RegArray[19], RegArray[20], RegArray[21], RegArray[22], RegArray[23], RegArray[24], RegArray[25], RegArray[26], RegArray[27], RegArray[28], RegArray[29], RegArray[30], RegArray[31], ReadRegister2);  

endmodule


//	D Flip-Flop Module.
module DFlipFlop(Q, D, Reset, Clk);
	
	output Q;
	input D, Reset, Clk;
	reg Q;							// Indicate that Q is stateholding

	always @(posedge Clk or posedge Reset)
		if (Reset)
			Q = 0;					// On reset, set to 0
		else
			Q = D;					// Otherwise Q = D

endmodule


// 1-bit Register Module.
module RegBit(BitOut, BitData, WriteEn, Reset, Clk);

	output BitOut;						// 1-bit of Register
	input BitData, WriteEn; 
	input Reset, Clk;
	wire d, f1, f2;						// Input of D Flip-Flop
	wire Reset;

	and #(50) U1(f1, BitOut, (~WriteEn));
	and #(50) U2(f2, BitData, WriteEn);
	or  #(50) U3(d, f1, f2);
	DFlipFlop DFF0(BitOut, d, Reset, Clk);

endmodule


// 32-bit Register Module.
module Register(RegOut, RegIn, WriteEn, Reset, Clk);

	output[31:0] RegOut;
	input[31:0] RegIn;
	input WriteEn, Reset, Clk;
	
	RegBit bit31(RegOut[31], RegIn[31], WriteEn, Reset, Clk);
	RegBit bit30(RegOut[30], RegIn[30], WriteEn, Reset, Clk);
	RegBit bit29(RegOut[29], RegIn[29], WriteEn, Reset, Clk);
	RegBit bit28(RegOut[28], RegIn[28], WriteEn, Reset, Clk);
	RegBit bit27(RegOut[27], RegIn[27], WriteEn, Reset, Clk);
	RegBit bit26(RegOut[26], RegIn[26], WriteEn, Reset, Clk);
	RegBit bit25(RegOut[25], RegIn[25], WriteEn, Reset, Clk);
	RegBit bit24(RegOut[24], RegIn[24], WriteEn, Reset, Clk);
	RegBit bit23(RegOut[23], RegIn[23], WriteEn, Reset, Clk);
	RegBit bit22(RegOut[22], RegIn[22], WriteEn, Reset, Clk);
	RegBit bit21(RegOut[21], RegIn[21], WriteEn, Reset, Clk);
	RegBit bit20(RegOut[20], RegIn[20], WriteEn, Reset, Clk);
	RegBit bit19(RegOut[19], RegIn[19], WriteEn, Reset, Clk);
	RegBit bit18(RegOut[18], RegIn[18], WriteEn, Reset, Clk);
	RegBit bit17(RegOut[17], RegIn[17], WriteEn, Reset, Clk);
	RegBit bit16(RegOut[16], RegIn[16], WriteEn, Reset, Clk);
	RegBit bit15(RegOut[15], RegIn[15], WriteEn, Reset, Clk);
	RegBit bit14(RegOut[14], RegIn[14], WriteEn, Reset, Clk);
	RegBit bit13(RegOut[13], RegIn[13], WriteEn, Reset, Clk);
	RegBit bit12(RegOut[12], RegIn[12], WriteEn, Reset, Clk);
	RegBit bit11(RegOut[11], RegIn[11], WriteEn, Reset, Clk);
	RegBit bit10(RegOut[10], RegIn[10], WriteEn, Reset, Clk);
	RegBit bit9 (RegOut[9], RegIn[9], WriteEn, Reset, Clk);
	RegBit bit8 (RegOut[8], RegIn[8], WriteEn, Reset, Clk);
	RegBit bit7 (RegOut[7], RegIn[7], WriteEn, Reset, Clk);
	RegBit bit6 (RegOut[6], RegIn[6], WriteEn, Reset, Clk);
	RegBit bit5 (RegOut[5], RegIn[5], WriteEn, Reset, Clk);
	RegBit bit4 (RegOut[4], RegIn[4], WriteEn, Reset, Clk);
	RegBit bit3 (RegOut[3], RegIn[3], WriteEn, Reset, Clk);
	RegBit bit2 (RegOut[2], RegIn[2], WriteEn, Reset, Clk);
	RegBit bit1 (RegOut[1], RegIn[1], WriteEn, Reset, Clk);
	RegBit bit0 (RegOut[0], RegIn[0], WriteEn, Reset, Clk);

endmodule


// Decoder Module.
module decoder(WriteEn, RegWrite, WriteRegister);

	input RegWrite;
	input[4:0] WriteRegister;
	output[31:0] WriteEn;
	wire[31:0] OE; 							// Output Enable
	dec5to32 dec(OE, WriteRegister);
	assign 
		WriteEn[0] = 0;
	and  #(50) gate1(WriteEn[1],OE[1],RegWrite);
	and  #(50) gate2(WriteEn[2],OE[2],RegWrite);
	and  #(50) gate3(WriteEn[3],OE[3],RegWrite);
	and  #(50) gate4(WriteEn[4],OE[4],RegWrite);
	and  #(50) gate5(WriteEn[5],OE[5],RegWrite);
	and  #(50) gate6(WriteEn[6],OE[6],RegWrite);
	and  #(50) gate7(WriteEn[7],OE[7],RegWrite);
	and  #(50) gate8(WriteEn[8],OE[8],RegWrite);
	and  #(50) gate9(WriteEn[9],OE[9],RegWrite);
	and  #(50) gate10(WriteEn[10],OE[10],RegWrite);
	and  #(50) gate11(WriteEn[11],OE[11],RegWrite);
	and  #(50) gate12(WriteEn[12],OE[12],RegWrite);
	and  #(50) gate13(WriteEn[13],OE[13],RegWrite);
	and  #(50) gate14(WriteEn[14],OE[14],RegWrite);
	and  #(50) gate15(WriteEn[15],OE[15],RegWrite);
	and  #(50) gate16(WriteEn[16],OE[16],RegWrite);
	and  #(50) gate17(WriteEn[17],OE[17],RegWrite);
	and  #(50) gate18(WriteEn[18],OE[18],RegWrite);
	and  #(50) gate19(WriteEn[19],OE[19],RegWrite);
	and  #(50) gate20(WriteEn[20],OE[20],RegWrite);
	and  #(50) gate21(WriteEn[21],OE[21],RegWrite);
	and  #(50) gate22(WriteEn[22],OE[22],RegWrite);
	and  #(50) gate23(WriteEn[23],OE[23],RegWrite);
	and  #(50) gate24(WriteEn[24],OE[24],RegWrite);
	and  #(50) gate25(WriteEn[25],OE[25],RegWrite);
	and  #(50) gate26(WriteEn[26],OE[26],RegWrite);
	and  #(50) gate27(WriteEn[27],OE[27],RegWrite);
	and  #(50) gate28(WriteEn[28],OE[28],RegWrite);
	and  #(50) gate29(WriteEn[29],OE[29],RegWrite);
	and  #(50) gate30(WriteEn[30],OE[30],RegWrite);
	and  #(50) gate31(WriteEn[31],OE[31],RegWrite);

endmodule


module andmore(g, a, b, c, d, e);

	output g;
	input a, b, c, d, e;
	and #(50) and1(f1, a, b, c, d), and2(g, f1, e);

endmodule


module dec5to32(Out, Address);

	output[31:0] Out;
	input[4:0] Address; 					// Address of the Register

	not #(50) inv4(Nota, Address[4]);
	not #(50) inv3(Notb, Address[3]);
	not #(50) inv2(Notc, Address[2]);
	not #(50) inv1(Notd, Address[1]);
	not #(50) inv0(Note, Address[0]);

	andmore a0(Out[0], Nota, Notb, Notc, Notd, Note);
	andmore a1(Out[1], Nota, Notb, Notc, Notd, Address[0]);
	andmore a2(Out[2], Nota, Notb, Notc, Address[1], Note);
	andmore a3(Out[3], Nota, Notb, Notc, Address[1], Address[0]);
	andmore a4(Out[4], Nota, Notb, Address[2], Notd, Note);
	andmore a5(Out[5], Nota, Notb, Address[2], Notd, Address[0]);
	andmore a6(Out[6], Nota, Notb, Address[2], Address[1], Note);
	andmore a7(Out[7], Nota, Notb, Address[2], Address[1], Address[0]);
	andmore a8(Out[8], Nota, Address[3], Notc, Notd, Note);
	andmore a9(Out[9], Nota, Address[3], Notc, Notd, Address[0]);
	andmore a10(Out[10], Nota, Address[3], Notc, Address[1], Note);
	andmore a11(Out[11], Nota, Address[3], Notc, Address[1], Address[0]);
	andmore a12(Out[12], Nota, Address[3], Address[2], Notd, Note);
	andmore a13(Out[13], Nota, Address[3], Address[2], Notd, Address[0]);
	andmore a14(Out[14], Nota, Address[3], Address[2], Address[1], Note);
	andmore a15(Out[15], Nota, Address[3], Address[2], Address[1], Address[0]);
	andmore a16(Out[16], Address[4], Notb, Notc, Notd, Note);
	andmore a17(Out[17], Address[4], Notb, Notc, Notd, Address[0]);
	andmore a18(Out[18], Address[4], Notb, Notc, Address[1], Note);
	andmore a19(Out[19], Address[4], Notb, Notc, Address[1], Address[0]);
	andmore a20(Out[20], Address[4], Notb, Address[2], Notd, Note);
	andmore a21(Out[21], Address[4], Notb, Address[2], Notd, Address[0]);
	andmore a22(Out[22], Address[4], Notb, Address[2], Address[1], Note);
	andmore a23(Out[23], Address[4], Notb, Address[2], Address[1], Address[0]);
	andmore a24(Out[24], Address[4], Address[3], Notc, Notd, Note);
	andmore a25(Out[25], Address[4], Address[3], Notc, Notd, Address[0]);
	andmore a26(Out[26], Address[4], Address[3], Notc, Address[1], Note);
	andmore a27(Out[27], Address[4], Address[3], Notc, Address[1], Address[0]);
	andmore a28(Out[28], Address[4], Address[3], Address[2], Notd, Note);
	andmore a29(Out[29], Address[4], Address[3], Address[2], Notd, Address[0]);
	andmore a30(Out[30], Address[4], Address[3], Address[2], Address[1], Note);
	andmore a31(Out[31], Address[4], Address[3], Address[2], Address[1], Address[0]);

endmodule


// 32-bit MUX Module.
module mux32to1(Out, In, Select);
	
	output Out;
	input[31:0] In; 
	input[4:0] Select; 
	wire[31:0] OE, f; 					// OE = Output Enable

	dec5to32 dec1(OE, Select);

	and  #(50) g0(f[0], OE[0], In[0]);
	and  #(50) g1(f[1], OE[1], In[1]);
	and  #(50) g2(f[2], OE[2], In[2]);
	and  #(50) g3(f[3], OE[3], In[3]);
	and  #(50) g4(f[4], OE[4], In[4]);
	and  #(50) g5(f[5], OE[5], In[5]);
	and  #(50) g6(f[6], OE[6], In[6]);
	and  #(50) g7(f[7], OE[7], In[7]);
	and  #(50) g8(f[8], OE[8], In[8]);
	and  #(50) g9(f[9], OE[9], In[9]);
	and  #(50) g10(f[10], OE[10], In[10]);
	and  #(50) g11(f[11], OE[11], In[11]);
	and  #(50) g12(f[12], OE[12], In[12]);
	and  #(50) g13(f[13], OE[13], In[13]);
	and  #(50) g14(f[14], OE[14], In[14]);
	and  #(50) g15(f[15], OE[15], In[15]);
	and  #(50) g16(f[16], OE[16], In[16]);
	and  #(50) g17(f[17], OE[17], In[17]);
	and  #(50) g18(f[18], OE[18], In[18]);
	and  #(50) g19(f[19], OE[19], In[19]);
	and  #(50) g20(f[20], OE[20], In[20]);
	and  #(50) g21(f[21], OE[21], In[21]);
	and  #(50) g22(f[22], OE[22], In[22]);
	and  #(50) g23(f[23], OE[23], In[23]);
	and  #(50) g24(f[24], OE[24], In[24]);
	and  #(50) g25(f[25], OE[25], In[25]);
	and  #(50) g26(f[26], OE[26], In[26]);
	and  #(50) g27(f[27], OE[27], In[27]);
	and  #(50) g28(f[28], OE[28], In[28]);
	and  #(50) g29(f[29], OE[29], In[29]);
	and  #(50) g30(f[30], OE[30], In[30]);
	and  #(50) g31(f[31], OE[31], In[31]);
	or #(50) gate3(g3, f[0], f[1], f[2], f[3]);
	or #(50) gate4(g4, f[4], f[5], f[6], f[7]);
	or #(50) gate5(g5, f[8], f[9], f[10], f[11]);
	or #(50) gate6(g6, f[12], f[13], f[14], f[15]);
	or #(50) gate7(g7, f[16], f[17], f[18], f[19]);
	or #(50) gate8(g8, f[20], f[21], f[22], f[23]);
	or #(50) gate9(g9, f[24], f[25], f[26], f[27]);
	or #(50) gate10(g10, f[28], f[29], f[30], f[31]);
	or #(50) gate11(g11, g3, g4, g5, g6);
	or #(50) gate12(g12, g7, g8, g9, 10);
	or #(50) gate(Out, g11, g12);

endmodule


module mux32x32to32(ReadData, In0, In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16, In17, In18, In19, In20, In21, In22, In23, In24, In25, In26, In27, In28, In29, In30, In31, ReadRegister);

	output [31:0] ReadData;
	input[31:0] In0, In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16, In17, In18, In19, In20, In21, In22, In23, In24, In25, In26, In27, In28, In29, In30, In31;
	input[4:0] ReadRegister;
	reg[31:0] ArrayReg[0:31];
	integer j;
	
	always @(*)
		begin
			for (j = 0; j <= 31; j = j + 1)
				ArrayReg[j] = {In31[j], In30[j], In29[j], In28[j], In27[j], In26[j], In25[j], In24[j], In23[j], In22[j], In21[j], In20[j], In19[j], In18[j], In17[j], In16[j], In15[j], In14[j], In13[j], In12[j], In11[j], In10[j], In9[j], In8[j], In7[j], In6[j], In5[j], In4[j], In3[j], In2[j], In1[j], In0[j]};
		end
	
	mux32to1  mux0(ReadData[0], ArrayReg[0], ReadRegister);
	mux32to1  mux1(ReadData[1], ArrayReg[1], ReadRegister);
	mux32to1  mux2(ReadData[2], ArrayReg[2], ReadRegister);
	mux32to1  mux3(ReadData[3], ArrayReg[3], ReadRegister);
	mux32to1  mux4(ReadData[4], ArrayReg[4], ReadRegister);
	mux32to1  mux5(ReadData[5], ArrayReg[5], ReadRegister);
	mux32to1  mux6(ReadData[6], ArrayReg[6], ReadRegister);
	mux32to1  mux7(ReadData[7], ArrayReg[7], ReadRegister);
	mux32to1  mux8(ReadData[8], ArrayReg[8], ReadRegister);
	mux32to1  mux9(ReadData[9], ArrayReg[9], ReadRegister);
	mux32to1  mux10(ReadData[10], ArrayReg[10], ReadRegister);
	mux32to1  mux11(ReadData[11], ArrayReg[11], ReadRegister); 
	mux32to1  mux12(ReadData[12], ArrayReg[12], ReadRegister);
	mux32to1  mux13(ReadData[13], ArrayReg[13], ReadRegister);
	mux32to1  mux14(ReadData[14], ArrayReg[14], ReadRegister);
	mux32to1  mux15(ReadData[15], ArrayReg[15], ReadRegister); 
	mux32to1  mux16(ReadData[16], ArrayReg[16], ReadRegister);
	mux32to1  mux17(ReadData[17], ArrayReg[17], ReadRegister);
	mux32to1  mux18(ReadData[18], ArrayReg[18], ReadRegister);
	mux32to1  mux19(ReadData[19], ArrayReg[19], ReadRegister);
	mux32to1  mux20(ReadData[20], ArrayReg[20], ReadRegister);
	mux32to1  mux21(ReadData[21], ArrayReg[21], ReadRegister);
	mux32to1  mux22(ReadData[22], ArrayReg[22], ReadRegister);
	mux32to1  mux23(ReadData[23], ArrayReg[23], ReadRegister);
	mux32to1  mux24(ReadData[24], ArrayReg[24], ReadRegister);
	mux32to1  mux25(ReadData[25], ArrayReg[25], ReadRegister);
	mux32to1  mux26(ReadData[26], ArrayReg[26], ReadRegister);
	mux32to1  mux27(ReadData[27], ArrayReg[27], ReadRegister);
	mux32to1  mux28(ReadData[28], ArrayReg[28], ReadRegister);
	mux32to1  mux29(ReadData[29], ArrayReg[29], ReadRegister);
	mux32to1  mux30(ReadData[30], ArrayReg[30], ReadRegister);
	mux32to1  mux31(ReadData[31], ArrayReg[31], ReadRegister);

endmodule