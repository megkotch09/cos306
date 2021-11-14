//==============================================================================
// 8-bit Procedural Adder Module
//==============================================================================

module Adder8Procedural(
	input      [7:0] a,  // Operand A
	input      [7:0] b,  // Operand B
	input            ci, // Carry-In
	output reg [7:0] s,  // Sum
	output reg       co  // Carry-Out
);

	reg [8:0] temp;

	always @( * ) begin
		temp[0] = a[0] + b[0] + ci;
		co = ((a[0]&b[0]) | (b[0]&ci)) | (a[0]&ci);

		temp[1] = a[1] + b[1] + co;
		co = ((a[1]&b[1]) | (b[1]&co)) | (a[1]&co);

		temp[2] = a[2] + b[2] + co;
		co = ((a[2]&b[2]) | (b[2]&co)) | (a[2]&co);

		temp[3] = a[3] + b[3] + co;
		co = ((a[3]&b[3]) | (b[3]&co)) | (a[3]&co);

		temp[4] = a[4] + b[4] + co;
		co = ((a[4]&b[4]) | (b[4]&co)) | (a[4]&co);

		temp[5] = a[5] + b[5] + co;
		co = ((a[5]&b[5]) | (b[5]&co)) | (a[5]&co);

		temp[6] = a[6] + b[6] + co;
		co = ((a[6]&b[6]) | (b[6]&co)) | (a[6]&co);

		temp[7] = a[7] + b[7] + co;
		co = ((a[7]&b[7]) | (b[7]&co)) | (a[7]&co);
		
		s = temp[7:0];
	end

endmodule
