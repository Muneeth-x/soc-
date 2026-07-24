module adder(
    input  logic [31:0] in_a,
    input  logic [31:0] in_b,
    output logic [31:0] out
);

assign out = in_a + in_b;

endmodule
