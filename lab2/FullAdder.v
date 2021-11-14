//==============================================================================
// One-Bit Full Adder Module
//==============================================================================

module FullAdder(
	input  a,  // Operand A
	input  b,  // Operand B
	input  ci, // Carry-In
	output s,  // Sum
	output co  // Carry-Out
);

	wire x, y, z;

	assign x = a & b;
	assign y = b & ci;
	assign z = a & ci;
	assign co = (x | y) | z;
	assign s = (a ^ b) ^ ci;

endmodule
