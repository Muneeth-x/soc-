module FET_DEC_Reg (
    input  logic        clk,
    input  logic        rst,
    input  logic        StallD,
    input  logic        FlushD,

    input  logic [31:0] instrF,
    input  logic [31:0] pcF,
    input  logic [31:0] pc_plus4F,

    output logic [31:0] instrD,
    output logic [31:0] pcD,
    output logic [31:0] pc_plus4D
);

always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
        instrD    <= 32'd0;
        pcD       <= 32'd0;
        pc_plus4D <= 32'd0;
    end
    else if (FlushD) begin
        instrD    <= 32'd0;
        pcD       <= 32'd0;
        pc_plus4D <= 32'd0;
    end
    else if (!StallD) begin
        instrD    <= instrF;
        pcD       <= pcF;
        pc_plus4D <= pc_plus4F;
    end
    // else: retain previous values during stall
end

endmodule
