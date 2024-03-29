module SimpleCircuit2_test;
    reg [3:0] counter;
    wire out;

/*  this is a comment */

    SimpleCircuit circuit_under_test(
        .a(counter[2]),
        .b(counter[1]),
        .c(counter[0]),
        .f(out)
    );

    always @( * ) begin
        if (counter[3]) begin
            $finish;
        end
    end

    initial begin  
        $dumpfile("SimpleCircuit2_test.vcd");
        $dumpvars;

        counter = 4'b0000;

        while (1) begin
            #1
            counter = counter + 3'b001;
        end
    end

endmodule