// Control Unit Module


// Verilog code for Control Unit.
`timescale 1 ps / 100 fs
module Control(RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, ALUOperation, Jump, SignZero, OperationCode);

	output RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, Jump, SignZero;
	output[1:0] ALUOperation;
	input[5:0] OperationCode;
	reg RegisterDestination, ALUSource, MemoryToRegister, RegisterWrite, MemoryRead, MemoryWrite, Branch, Jump, SignZero;
	reg[1:0] ALUOperation;

	always @(*)
		casex (OperationCode)
			6'b000000:								// R => Type
				begin
					RegisterDestination = 1'b1;
					ALUSource = 1'b0;
					MemoryToRegister = 1'b0;
					RegisterWrite = 1'b1;
					MemoryRead = 1'b0;
					MemoryWrite = 1'b0;
					Branch = 1'b0;
					ALUOperation = 2'b10;
					Jump = 1'b0;
					SignZero = 1'b0;
				end
			6'b100011:								// LW => Load Word
				begin
					RegisterDestination = 1'b0;
					ALUSource = 1'b1;
					MemoryToRegister = 1'b1;
					RegisterWrite = 1'b1;
					MemoryRead = 1'b1;
					MemoryWrite = 1'b0;
					Branch = 1'b0;
					ALUOperation = 2'b00;
					Jump = 1'b0;
					SignZero = 1'b0;
				end
			6'b101011:								// SW => Store Word
				begin
					RegisterDestination = 1'bx;
					ALUSource = 1'b1;
					MemoryToRegister = 1'bx;
					RegisterWrite = 1'b0;
					MemoryRead = 1'b0;
					MemoryWrite = 1'b1;
					Branch = 1'b0;
					ALUOperation = 2'b00;
					Jump = 1'b0;
					SignZero = 1'b0;
				end
			6'b000101:								// BNE => Branch Not Equal
				begin
					RegisterDestination = 1'b0;
					ALUSource = 1'b0;
					MemoryToRegister = 1'b0;
					RegisterWrite = 1'b0;
					MemoryRead = 1'b0;
					MemoryWrite = 1'b0;
					Branch = 1'b1;
					ALUOperation = 2'b01;
					Jump = 1'b0;
					SignZero = 1'b0;
				end
			6'b001110:								// XorI => Xor Immediate
				begin
					RegisterDestination = 1'b0;
					ALUSource = 1'b1;
					MemoryToRegister = 1'b0;
					RegisterWrite = 1'b1;
					MemoryRead = 1'b0;
					MemoryWrite = 1'b0;
					Branch = 1'b0;
					ALUOperation = 2'b11;
					Jump = 1'b0;
					SignZero = 1'b1;
				end
			6'b000010:								// J => Jump
				begin
					RegisterDestination = 1'b0;
					ALUSource = 1'b0;
					MemoryToRegister= 1'b0;
					RegisterWrite= 1'b0;
					MemoryRead = 1'b0;
					MemoryWrite= 1'b0;
					Branch = 1'b0;
					ALUOperation = 2'b00;
					Jump = 1'b1;
					SignZero= 1'b0;
				end
			default:
				begin
					RegisterDestination = 1'b0;
					ALUSource = 1'b0;
					MemoryToRegister= 1'b0;
					RegisterWrite= 1'b0;
					MemoryRead = 1'b0;
					MemoryWrite= 1'b0;
					Branch = 1'b0;
					ALUOperation = 2'b10;
					Jump = 1'b0;
					SignZero= 1'b0;
				end
		endcase

endmodule
