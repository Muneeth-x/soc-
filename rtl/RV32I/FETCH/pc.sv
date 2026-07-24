module pc(
    input  logic        clk,
    input  logic        rst_n,
    input  logic        StallF,
    input  logic [31:0] pc_nxt,
    output logic [31:0] pc_cur
);

always_ff @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        pc_cur <= 32'd0;

    else if(!StallF)
        pc_cur <= pc_nxt;
end

endmodule
