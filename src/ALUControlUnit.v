// ALU Control Unit Module


// Verilog code for ALU Control Unit.
`timescale 1 ps / 100 fs
module ALUControlUnit(ALUControl, ALUOperation, Function);

	output[1:0] ALUControl;
	input[1:0] ALUOperation;
	input[5:0] Function;
	wire[7:0] ALUControlInput;
	reg[1:0] ALUControl;

	assign ALUControlInput = {ALUOperation, Function};
	always @(ALUControlInput)
		casex (ALUControlInput)
			8'b11xxxxxx: ALUControl = 2'b01;
			8'b00xxxxxx: ALUControl = 2'b00;
			8'b01xxxxxx: ALUControl = 2'b10;
			8'b10100000: ALUControl = 2'b00;
			8'b10100010: ALUControl = 2'b10;
			8'b10101010: ALUControl = 2'b11;
			default: ALUControl = 2'b00;
		endcase

endmodule
