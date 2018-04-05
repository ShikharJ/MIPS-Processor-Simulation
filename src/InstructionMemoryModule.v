// Instruction Memory Module

// This module is used to setup the instruction set for the MIPS processor.
// Change the $readmemb line to have the name of the program you want to load.

`timescale 1 ps / 100 fs
module InstructionMemory(Instruction, Address);

	output[31:0] Instruction;
	input[31:0] Address;
	reg[31:0] Instructionmemory[1023:0];
	reg[31:0] Temp;

	buf 
		#1000 buf0(Instruction[0], Temp[0]),
		buf1(Instruction[1], Temp[1]),
		buf2(Instruction[2], Temp[2]),
		buf3(Instruction[3], Temp[3]),
		buf4(Instruction[4], Temp[4]),
		buf5(Instruction[5], Temp[5]),
		buf6(Instruction[6], Temp[6]),
		buf7(Instruction[7], Temp[7]),
		buf8(Instruction[8], Temp[8]),
		buf9(Instruction[9], Temp[9]),
		buf10(Instruction[10], Temp[10]),
		buf11(Instruction[11], Temp[11]),
		buf12(Instruction[12], Temp[12]),
		buf13(Instruction[13], Temp[13]),
		buf14(Instruction[14], Temp[14]),
		buf15(Instruction[15], Temp[15]),
		buf16(Instruction[16], Temp[16]),
		buf17(Instruction[17], Temp[17]),
		buf18(Instruction[18], Temp[19]),
		buf19(Instruction[19], Temp[19]),
		buf20(Instruction[20], Temp[20]),
		buf21(Instruction[21], Temp[21]),
		buf22(Instruction[22], Temp[22]),
		buf23(Instruction[23], Temp[23]),
		buf24(Instruction[24], Temp[24]),
		buf25(Instruction[25], Temp[25]),
		buf26(Instruction[26], Temp[26]),
		buf27(Instruction[27], Temp[27]),
		buf28(Instruction[28], Temp[28]),
		buf29(Instruction[29], Temp[29]),
		buf30(Instruction[30], Temp[30]),
		buf31(Instruction[31], Temp[31]);

	always @(Address)
		begin
			Temp = Instructionmemory[Address / 4];
		end
	initial
		begin
			$readmemb("/home/shikhar/MIPS-Processor-Simulation/src/instructions.txt", Instructionmemory);
		end

endmodule


module InstructionMemoryStimulus();
	
	reg[31:0] Address;
	wire[31:0] Instruction;
	InstructionMemory im(Instruction, Address);

	initial
		begin
			$monitor("Memory Address = %h Instruction = %b", Address, Instruction);
			Address = 32'd0;
			#10000 Address = 32'd4;
			#10000 Address = 32'd8;
			#10000 Address = 32'd12;
			#10000 Address = 32'd16;
			#10000 Address = 32'd20;
			#10000 Address = 32'd24;
			#10000 Address = 32'd28;
			#10000;
			$finish;
		end

endmodule