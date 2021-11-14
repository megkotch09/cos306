`include "Latch_structural.v"

module MemBlock(
  input x,
  input y,
  output q,
  output nq
);

  wire one;
  wire two;
  wire three;
  wire four = three & x;

  Latch L1 (
    .nr(y),
    .ns(four),
    .nq(one),
    .q(two)
  );

  Latch L2 (
    .nr(x),
    .ns(one),
    .nq(three)
  );

  Latch L3 (
    .ns(three),
    .nr(two),
    .q(q),
    .nq(nq)
  );

endmodule
