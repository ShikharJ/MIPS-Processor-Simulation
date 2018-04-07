// D Flip Flop Module


// Verilog code for D Flip Flop module.
module DFlipFlop(Q, D, Reset, CLK);
	
	output Q;
	input D, Reset, CLK;
	reg Q;					// Indicate whether Q is state-holding

	always @(posedge CLK or posedge Reset)
		if (Reset)
			Q = 0;			// On reset, set to 0
		else
			Q = D;			// Else, output D

endmodule
