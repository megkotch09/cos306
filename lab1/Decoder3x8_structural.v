module Decoder3x8(
  input [2:0] i,
  output [7:0] d
);

  //im so confused
  assign d = 8'b00000000;
  assign d[0] = 1'b1 ? i : 3'd0;
  assign d[1] = 1'b1 ? i : 3'd1;
  assign d[2] = 1'b1 ? i : 3'd2;
  assign d[3] = 1'b1 ? i : 3'd3;
  assign d[4] = 1'b1 ? i : 3'd4;
  assign d[5] = 1'b1 ? i : 3'd5;
  assign d[6] = 1'b1 ? i : 3'd6;
  assign d[7] = 1'b1 ? i : 3'd7;

endmodule
