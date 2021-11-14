//==============================================================================
// Stoplight Testbench Module for Lab 4
//==============================================================================
`timescale 1ns/100ps

`include "Stoplight.v"

`define ASSERT_EQ(ONE, TWO, MSG)               \
	begin                                      \
		if ((ONE) !== (TWO)) begin             \
			$display("\t[FAILURE]:%s", (MSG)); \
			errors = errors + 1;               \
		end                                    \
	end #0

module StoplightTest;

	// Local Vars
	reg clk = 1;
	reg rst = 0;
	reg car = 0;
	reg [4:0] errors = 0;
	wire [2:0] lp, lw;

	// Light Colors
	localparam GRN = 3'b100;
	localparam YLW = 3'b010;
	localparam RED = 3'b001;

	// VCD Dump
	initial begin
		$dumpfile("StoplightTest.vcd");
		$dumpvars;
	end

	// Stoplight Module
	Stoplight light(
		.clk        (clk),
		.rst        (rst),
		.car_present(car),
		.light_pros (lp),
		.light_wash (lw)
	);

	// Clock
	always begin
		#2.5 clk = ~clk;
	end

	// Main Test Logic
	initial begin

		#1; 									// t = 1
		rst = 1; 

		@(posedge clk); 						// t = 5

		#1; 									// t = 6
		rst = 0;

		#1;										// t = 7
		if (lw !== GRN || lp !== RED) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk); 						// t = 10

		@(posedge clk); 						// t = 15
		@(posedge clk); 						// t = 20
		@(posedge clk); 						// t = 25
		@(posedge clk); 						// t = 30
		@(posedge clk); 						// t = 35
		@(posedge clk); 						// t = 40

		#1;										// t = 41
		car = 1;

		#1;										// t = 42
		if (lw !== GRN || lp !== RED) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 45
		@(posedge clk);							// t = 50

		#1;										// t = 51
		car = 0;

		#1;										// t = 52
		if (lw !== RED || lp !== GRN) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 55
		@(posedge clk);							// t = 60
		@(posedge clk);							// t = 65

		#1;										// t = 66
		car = 1;

		#1;										// t = 67
		if (lw !== RED || lp !== GRN) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 70
		@(posedge clk);							// t = 75

		#1;										// t = 76
		car = 1;

		#1;										// t = 77
		if (lw !== GRN || lp !== RED) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 80
		@(posedge clk);							// t = 85
		
		#1;										// t = 86
		car = 0;

		#1;										// t = 87
		if (lw !== GRN || lp !== RED) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 90
		@(posedge clk);							// t = 95
		@(posedge clk);							// t = 100
		@(posedge clk);							// t = 105

		#1;										// t = 106
		car = 1;

		#1;										// t = 107
		if (lw !== GRN || lp !== RED) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 110
		@(posedge clk);							// t = 115

		#1;										// t = 116
		car = 0;

		#1;										// t = 117
		if (lw !== RED || lp !== GRN) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 120
		@(posedge clk);							// t = 125
		@(posedge clk);							// t = 130

		#1;										// t = 131
		car = 1;

		#1;										// t = 132
		if (lw !== RED || lp !== GRN) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 135

		#1;										// t = 136
		car = 0;

		#1;										// t = 137
		if (lw !== RED || lp !== YLW) begin
			$display("Error at time %t", $time);
			errors = errors + 1;
		end

		@(posedge clk);							// t = 140

		$finish;
	end

endmodule

