module carry_lookahead_adder_4bit (
    input [3:0] A,    // 4-bit input A
    input [3:0] B,    // 4-bit input B
    input Cin,        // Carry input
    output [3:0] Sum, // 4-bit Sum output
    output Cout       // Carry output
);

    wire [3:0] P, G,A1,A2,A3,A4,A5,A6;  // Propagate and Generate
    wire [3:0] C;     // Internal carry

    // Generate and Propagate terms
    assign P = A ^ B; // Propagate: P[i] = A[i] ^ B[i]
    assign G = A & B; // Generate: G[i] = A[i] & B[i]
    assign A1 = G[1] | (P[1] & G[0]);
    assign A2 = P[1] & P[0];
    assign A3 = G[2] | (P[2] & G[1]) | (P[2]&P[1]&G[0]);
    assign A4 = P[2]&P[1]&P[0];
    assign A5 = G[3] | (P[3]&G[2]) | (P[3]&P[3]&G[1]) | (P[3]&P[2]&P[1]&G[0]);
    assign A6 = P[3]&P[2]&P[1]&P[0];

    // Carry terms
    assign C[0] = Cin ;
    assign C[1] = G[0] | (P[0]&C[0]);
    assign C[2] = A1 | (A2 & Cin);
    assign C[3] = A3 | (A4 & Cin);
    assign Cout = A5 | (A6 & Cin);

    // Sum calculation
    assign Sum = P ^ C[3:0]; // Sum[i] = P[i] ^ C[i]

endmodule