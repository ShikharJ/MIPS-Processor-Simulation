// MIPSStimulus Module

// Verilog Testbench code for 32-bit Pipelined MIPS Processor.

`timescale 1 ps / 100 fs
module MIPSStimulus();

	parameter ClockDelay = 5000;
	reg CLK, Reset;

	MIPSPipeline mips(CLK, Reset);
	initial CLK = 0;
	always #(ClockDelay / 2) CLK = ~CLK;
	initial 
		begin
			Reset = 1;
			#(ClockDelay / 4);
			Reset = 0;
		end

endmodule