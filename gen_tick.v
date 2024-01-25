//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Joel Maya
// Email: jmaya009@ucr.edu
// 
// Assignment name: ClocksAndTestBenches
// Lab section: 021
// TA: Niyathi Allu
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================


//
//iverilog -o lab01_tb gen_tick.v lab01_tb.v

module gen_tick # ( parameter SRC_FREQ = 5000, parameter TICK_FREQ = 1) (
    input src_clk,
    input enable,
    output tick
);

// Declare registers and wires here
reg [31:0] limit = SRC_FREQ / TICK_FREQ / 2 - 1;
reg [31:0] acc = 0;
reg tick_out = 0;


always @(posedge src_clk) begin
    if (enable) begin
        acc <= acc + 1; //edge triggering(<=), compared to level triggering (=)
        if(acc == limit) begin
            acc <= 0;
            tick_out <= ~tick_out; // tilda is not, or complement
        end
    end
    // put your code for the multiplier here
end

// Change this assign statement to the actual tick value
assign tick = tick_out;

endmodule
