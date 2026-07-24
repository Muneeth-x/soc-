module inst_mem(
    input  logic [31:0] pc_address,
    output logic [31:0] inst
);

logic [31:0] mem [0:255];

initial
    $readmemh("inst_memory.mem",mem);

assign inst = mem[pc_address[31:2]];

endmodule
