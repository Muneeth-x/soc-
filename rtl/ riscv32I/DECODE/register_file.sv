module register_file(clk,A1,A2,A3,WD3,WE3,RD1,RD2);

    input  logic       clk,WE3;
    input  logic [4:0] A1,A2,A3;
    input  logic [31:0] WD3;
    output logic [31:0] RD1,RD2;

    logic [31:0] reg_file [0:31];

    initial
        reg_file[0] = 32'd0;

    always_ff @(negedge clk)
    begin
        if(WE3 && (A3 != 5'd0))
            reg_file[A3] <= WD3;
    end

    assign RD1 = reg_file[A1];
    assign RD2 = reg_file[A2];

endmodule
