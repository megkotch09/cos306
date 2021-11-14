module Popcount(
  input [2:0] bitstring,
  output [1:0] popcount
);
  reg [1:0] popcount;

  reg a;
  reg b;
  reg c;

  reg y;
  reg z;

  always @( * ) begin
    a = bitstring[0];
    b = bitstring[1];
    c = bitstring[2];
    y = (!a & b & c) || (a & !b & c) || (a & b & !c) || (a & b & c);
    z = (!a & !b & c) || (!a & b & !c) || (a & !b & !c) || (a & b & c);
    popcount[0] = z;
    popcount[1] = y;
  end

endmodule
