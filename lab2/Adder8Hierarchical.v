//==============================================================================
// 8-bit Hierarchical Adder Module
//==============================================================================

`include "FullAdder.v"

module Adder8Hierarchical(
	input  [7:0] a,  // Operand A
	input  [7:0] b,  // Operand B
	input        ci, // Carry-In
	output [7:0] s,  // Sum
	output       co  // Carry-Out
);

wire one;
wire two;
wire three;
wire four;
wire five;
wire six;
wire seven;

FullAdder fullA0(
	.a(a[0]),
	.b(b[0]),
	.ci(ci),
	.s(s[0]),
	.co(one)
);

FullAdder fullA1(
	.a(a[1]),
	.b(b[1]),
	.ci(one),
	.s(s[1]),
	.co(two)
);

FullAdder fullA2(
	.a(a[2]),
	.b(b[2]),
	.ci(two),
	.s(s[2]),
	.co(three)
);

FullAdder fullA3(
	.a(a[3]),
	.b(b[3]),
	.ci(three),
	.s(s[3]),
	.co(four)
);

FullAdder fullA4(
	.a(a[4]),
	.b(b[4]),
	.ci(four),
	.s(s[4]),
	.co(five)
);

FullAdder fullA5(
	.a(a[5]),
	.b(b[5]),
	.ci(five),
	.s(s[5]),
	.co(six)
);


FullAdder fullA6(
	.a(a[6]),
	.b(b[6]),
	.ci(six),
	.s(s[6]),
	.co(seven)
);

FullAdder fullA7(
	.a(a[7]),
	.b(b[7]),
	.ci(seven),
	.s(s[7]),
	.co(co)
);

endmodule
