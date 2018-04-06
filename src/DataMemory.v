// Data Memory Module

// Verilog code for Data Memory.

`timescale 1 ps / 100 fs
module DataMemory(Data, Address, WriteData, WriteEnable, MemoryRead, CLK);

	output[31:0] Data;
	input[31:0] Address, WriteData;
	input WriteEnable, MemoryRead, CLK;
	reg[7:0] Datamemory[1023:0];
	reg[31:0] Temp;

	buf
		#1000 buf0(Data[0], Temp[0]),
		buf1(Data[1], Temp[1]),
		buf2(Data[2], Temp[2]),
		buf3(Data[3], Temp[3]),
		buf4(Data[4], Temp[4]),
		buf5(Data[5], Temp[5]),
		buf6(Data[6], Temp[6]),
		buf7(Data[7], Temp[7]),
		buf8(Data[8], Temp[8]),
		buf9(Data[9], Temp[9]),
		buf10(Data[10], Temp[10]),
		buf11(Data[11], Temp[11]),
		buf12(Data[12], Temp[12]),
		buf13(Data[13], Temp[13]),
		buf14(Data[14], Temp[14]),
		buf15(Data[15], Temp[15]),
		buf16(Data[16], Temp[16]),
		buf17(Data[17], Temp[17]),
		buf18(Data[18], Temp[18]),
		buf19(Data[19], Temp[19]),
		buf20(Data[20], Temp[20]),
		buf21(Data[21], Temp[21]),
		buf22(Data[22], Temp[22]),
		buf23(Data[23], Temp[23]),
		buf24(Data[24], Temp[24]),
		buf25(Data[25], Temp[25]),
		buf26(Data[26], Temp[26]),
		buf27(Data[27], Temp[27]),
		buf28(Data[28], Temp[28]),
		buf29(Data[29], Temp[29]),
		buf30(Data[30], Temp[30]),
		buf31(Data[31], Temp[31]);

	always @(posedge CLK)
 		if (WriteEnable)
 			begin
  				Datamemory[Address] = WriteData[31:24];
  				Datamemory[Address + 1] = WriteData[23:16];
  				Datamemory[Address + 2] = WriteData[15:8];
  				Datamemory[Address + 3] = WriteData[7:0];
 			end

	always @(Address or Datamemory[Address] or Datamemory[Address + 1] or Datamemory[Address + 2] or Datamemory[Address + 3])
		begin
			Temp = {Datamemory[Address], Datamemory[Address + 1], Datamemory[Address + 2], Datamemory[Address + 3]};
		end

endmodule