# MIPS-Processor-Simulation
Verilog-based Pipelined MIPS Processor Simulation.

This project is still in its nascent stage. The simulation works fine for now, but probably can be optimized in many ways.

## Usage
The entire simulation can be tested by simulating the `MIPSStimulus.v` file using `ModelSim`. Currently, the instructions form a testing pipeline and have been converted into binary to work.

## Documentation
Most of the codebase has inline comments added, and follows from the standard 5-stage MIPS pipeline as follows:

![](/images/schematic.png)

## Test Run

![](/images/1.png)
![](/images/2.png)

## Additional
Suggestions and Pull Requests are always welcome, as I'm just a beginner in the field of `Verilog` programming.