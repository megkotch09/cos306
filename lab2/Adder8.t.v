//==============================================================================
// Test Unit for 8-bit Adders
//==============================================================================

`include "Adder8Hierarchical.v"
`include "Adder8Procedural.v"

// Tester Module
module Adder8Test;

	// IO Vars for Hierarchical Adder
	reg  [7:0] ah, bh;
	reg        cih;
	wire [7:0] sh;
	wire       coh;

	// IO Vars for Procedural Adder
	reg  [7:0] ap, bp;
	reg        cip;
	wire [7:0] sp;
	wire       cop;

	// Number of Errors
	reg [7:0] h_errors = 0;
	reg [7:0] p_errors = 0;

	// VCD Dump
	initial begin
		$dumpfile("Adder8Test.vcd");
		$dumpvars;
	end

	// Hierarchical Adder Module
	Adder8Hierarchical adderh(
		.a (ah),
		.b (bh),
		.ci(cih),
		.s (sh),
		.co(coh)
	);

	// Procedural Adder Module
	Adder8Procedural adderp(
		.a (ap),
		.b (bp),
		.ci(cip),
		.s (sp),
		.co(cop)
	);

	// Main Test Logic
	initial begin
		$display("\nBeginning Tests");
		$display("========================");

		//==================================
		// Test Cases
		//==================================
		// |  a  |  b  |  ci  =>  s  |  co |

		// Test Case 0
		// |  10 |  15 |  1   =>  26 |  0  |
		ah  = 8'd10; ap  = 8'd10;
		bh  = 8'd15; bp  = 8'd15;
		cih = 1'd1;  cip = 1'd1;
		#5;
		if (sh !== 8'd26 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd26, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd26 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd26, 1'd0);
			p_errors = p_errors + 1;
		end

		//--------------------------
		// Add your test cases here
		//--------------------------

		// Test Case 1
		// |    |     |      =>     |     |

		ah  = 8'd1; ap  = 8'd1;
		bh  = 8'd9; bp  = 8'd9;
		cih = 1'b0;  cip = 1'b0;
		#5;
		if (sh !== 8'd10 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd10, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd10 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd10, 1'd0);
			p_errors = p_errors + 1;
		end


		// Test Case 2
		// |    |     |      =>     |     |


		ah  = 8'b11111111; ap  = 8'b11111111;
		bh  = 8'b00000001; bp  = 8'd00000001;
		cih = 1'b0;  cip = 1'b0;
		#5;
		if (sh !== 8'b00000000 || coh !== 1'd1) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'b00000000, 1'd1);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'b00000000 || cop !== 1'd1) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd00000000, 1'd1);
			p_errors = p_errors + 1;
		end

		// Test Case 3
		// |    |     |      =>     |     |

		ah  = 8'b11111111; ap  = 8'b11111111;
		bh  = 8'b11111111; bp  = 8'b11111111;
		cih = 1'b0;  cip = 1'b0;
		#5;
		if (sh !== 8'b11111110 || coh !== 1'd1) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'b11111110, 1'd1);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'b11111110 || cop !== 1'd1) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'b11111110, 1'd1);
			p_errors = p_errors + 1;
		end

		
		// Test Case 4
		// |    |     |      =>     |     |

		ah  = 8'b10101010; ap  = 8'b10101010;
		bh  = 8'b01010101; bp  = 8'b01010101;
		cih = 1'b0;  cip = 1'b0;
		#5;
		if (sh !== 8'b11111111 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'b11111111, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'b11111111 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'b11111111, 1'd0);
			p_errors = p_errors + 1;
		end


		// Test Case 5
		// |    |     |      =>     |     |

		ah  = 8'b11110000; ap  = 8'b11110000;
		bh  = 8'b00001111; bp  = 8'b00001111;
		cih = 1'b1;  cip = 1'b1;
		#5;
		if (sh !== 8'b00000000 || coh !== 1'd1) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'b00000000, 1'd1);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'b00000000 || cop !== 1'd1) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'b00000000, 1'd1);
			p_errors = p_errors + 1;
		end


		//--------------------------
		// Print Final Summary
		//--------------------------
		$display("\nTests Completed. %d Hierarchical Failures, %d Procedural Failures\n",
		         h_errors, p_errors);
		$display("========================");
		$finish;
	end

endmodule


