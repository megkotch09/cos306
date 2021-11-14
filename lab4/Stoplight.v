//==============================================================================
// Stoplight Module for Lab 4
//
// Note on lights:
// 	Each bit represents the on/off signal for a light.
// 	Bit | Light
// 	------------
// 	0   | Red
// 	1   | Yellow
// 	2   | Green
//==============================================================================

module Stoplight(
	input            clk,         // Clock signal
	input            rst,         // Reset signal for FSM
	input            car_present, // Is there a car on Prospect?
	output reg [2:0] light_pros,  // Prospect Avenue Light
	output reg [2:0] light_wash   // Washington Road Light
);

	// Declare Local Vars Here
	reg [3:0] state;
	reg [3:0] next_state;
	// ...

	// Declare State Names 
	localparam STATE_ZERO  = 4'b0000;
	localparam STATE_ONE   = 4'b0001;
	localparam STATE_TWO   = 4'b0010;
	localparam STATE_THREE = 4'b0011;
	localparam STATE_FOUR  = 4'b0100;
	localparam STATE_FIVE  = 4'b0101;
	localparam STATE_SIX   = 4'b0110;
	localparam STATE_SEVEN = 4'b0111;
	localparam STATE_EIGHT = 4'b1000;
	localparam STATE_NINE  = 4'b1001;

	// Light Colors
	localparam RED = 3'b001;
	localparam YLW = 3'b010;
	localparam GRN = 3'b100;

	// Output Combinational Logic
	always @( * ) begin
		light_pros = GRN;
		light_wash = RED;

		if(state==STATE_NINE) begin light_pros = YLW; end	
		if(state <STATE_FIVE) begin light_pros = RED; end
		
		if(state==STATE_FOUR) begin light_wash = YLW; end
		if(state <STATE_FOUR) begin light_wash = GRN; end

	end

	// Next State Combinational Logic
	always @( * ) begin
		// Write your Next State Logic Here
		if (!car_present && state == STATE_THREE) begin next_state = STATE_THREE; end
		else if (state == STATE_NINE) begin next_state = STATE_ZERO; end
		else begin next_state = state + 1; end
	end

	// State Update Sequential Logic
	always @(posedge clk) begin
		if (rst) begin
			// Update state to reset state
			state <= STATE_ZERO;
		end
		else begin
			// Update state to next state
			state <= next_state;
		end
	end

endmodule
