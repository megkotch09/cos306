module MemBlock_test;

    reg x, y;
    wire q, nq;

    initial begin
        $dumpfile("MemBlock_test.vcd");
        $dumpvars;
    end

    MemBlock mem (
        .x(x),
        .y(y),
        .q(q),
        .nq(nq)
    );

    initial begin
        x = 0;
        y = 0;

        #1
        y = 1;
        #1
        y = 0;
        #1
        x = 1;
        #1
        x = 0;
        #1
        x = 1;
        #1
        y = 1;
        #1
        x = 0;
        #1
        x = 1;
        #1
        y = 0;
        #1
        y = 1;
        #1
        x = 0;
        y = 0;
        #1

        $finish;
  end
endmodule