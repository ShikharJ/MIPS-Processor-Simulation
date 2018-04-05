// JR Control Unit Module

// Verilog code for JR Control Unit.

`timescale 1 ps / 100 fs
module JRControlUnit(JRControl, ALUOperation, Function);

	output JRControl;
	input[1:0] ALUOperation;
	input[5:0] Function;
	wire[7:0] Test;
	reg JRControl;

	assign Test = {ALUOperation, Function};
	always @(Test)
		case (Test)
			8'b10001000 : JRControl = 1'b1; 
			default: JRControl = 1'b0;
		endcase

endmodule