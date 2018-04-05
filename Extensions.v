// Extension Modules

// Verilog code for Zero Extension, Sign Extension and Shift Left 2.

`timescale 1 ps/ 100 fs
module ZeroExtension(ZOutput32, ZInput16);

	output[31:0] ZOutput32;
	input[15:0] ZInput16;
	
	assign ZOutput32 = {{16{1'b0}}, ZInput16};

endmodule


module SignExtension(SOutput32, SInput16);

	output[31:0] SOutput32;
	input[15:0] SInput16;
	
	assign SOutput32 = {{16{SInput16[15]}}, SInput16};

endmodule


module ShiftLeft2(Output32, Input32);

	output[31:0] Output32;
	input[31:0] Input32;

	assign Output32 = {Input32[29:0], 2'b00};

endmodule