`timescale 1ns / 1ps

module carry_lookahead_adder_32bit_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;

    // Outputs
    wire [31:0] Sum;
    wire Cout;

    // Instantiate the 32-bit CLA module
    carry_lookahead_adder_32bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Initialize inputs
        A = 32'b0;
        B = 32'b0;
        Cin = 0;
        #10;

        // Test Case 1
        A = 32'h00000001; B = 32'h00000001; Cin = 0;
        #10;

        // Test Case 2
        A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0;
        #10;

        // Test Case 3
        A = 32'hAAAAAAAA; B = 32'h55555555; Cin = 1;
        #10;

        // Test Case 4
        A = 32'h12345678; B = 32'h87654321; Cin = 0;
        #10;

        // Test Case 5
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 1;
        #10;

        // End simulation
        $finish;
    end

    initial begin
        // Generate the waveform file
        $dumpfile("carry_lookahead_adder_32bit_tb.vcd");
        $dumpvars(0, carry_lookahead_adder_32bit_tb);
    end

endmodule
