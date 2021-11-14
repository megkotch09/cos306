module Popcount(
  input [2:0] bitstring,
  output [1:0] popcount
);

  wire a = bitstring[0];
  wire b = bitstring[1];
  wire c = bitstring[2];

  wire y = (!a & b & c) || (a & !b & c) || (a & b & !c) || (a & b & c);
  wire z = (!a & !b & c) || (!a & b & !c) || (a & !b & !c) || (a & b & c);

  assign popcount[0] = z;
  assign popcount[1] = y;

endmodule
