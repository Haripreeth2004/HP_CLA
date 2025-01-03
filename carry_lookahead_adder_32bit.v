module carry_lookahead_adder_32bit (
    input [31:0] A,    // 32-bit input A
    input [31:0] B,    // 32-bit input B
    input Cin,         // Carry input
    output [31:0] Sum, // 32-bit Sum output
    output Cout        // Carry output
);

    wire [7:0] C;      // Carry outputs from each 4-bit CLA block

    // Instantiate eight 4-bit CLA blocks
    carry_lookahead_adder_4bit CLA0 (
        .A(A[3:0]), 
        .B(B[3:0]), 
        .Cin(Cin), 
        .Sum(Sum[3:0]), 
        .Cout(C[0])
    );

    carry_lookahead_adder_4bit CLA1 (
        .A(A[7:4]), 
        .B(B[7:4]), 
        .Cin(C[0]), 
        .Sum(Sum[7:4]), 
        .Cout(C[1])
    );

    carry_lookahead_adder_4bit CLA2 (
        .A(A[11:8]), 
        .B(B[11:8]), 
        .Cin(C[1]), 
        .Sum(Sum[11:8]), 
        .Cout(C[2])
    );

    carry_lookahead_adder_4bit CLA3 (
        .A(A[15:12]), 
        .B(B[15:12]), 
        .Cin(C[2]), 
        .Sum(Sum[15:12]), 
        .Cout(C[3])
    );

    carry_lookahead_adder_4bit CLA4 (
        .A(A[19:16]), 
        .B(B[19:16]), 
        .Cin(C[3]), 
        .Sum(Sum[19:16]), 
        .Cout(C[4])
    );

    carry_lookahead_adder_4bit CLA5 (
        .A(A[23:20]), 
        .B(B[23:20]), 
        .Cin(C[4]), 
        .Sum(Sum[23:20]), 
        .Cout(C[5])
    );

    carry_lookahead_adder_4bit CLA6 (
        .A(A[27:24]), 
        .B(B[27:24]), 
        .Cin(C[5]), 
        .Sum(Sum[27:24]), 
        .Cout(C[6])
    );

    carry_lookahead_adder_4bit CLA7 (
        .A(A[31:28]), 
        .B(B[31:28]), 
        .Cin(C[6]), 
        .Sum(Sum[31:28]), 
        .Cout(Cout)
    );

endmodule
