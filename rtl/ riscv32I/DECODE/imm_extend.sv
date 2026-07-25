module imm_extend(imm, immSrc, immExt);

    input  logic [24:0] imm;
    input  logic [1:0]  immSrc;
    output logic [31:0] immExt;

    always_comb begin
        case (immSrc)

            // I-Type Immediate
            // imm[24:13] = instruction[31:20]
            2'd0:
                immExt = {{20{imm[24]}}, imm[24:13]};

            // S-Type Immediate
            // imm[24:18] = instruction[31:25]
            // imm[4:0]   = instruction[11:7]
            2'd1:
                immExt = {{20{imm[24]}}, imm[24:18], imm[4:0]};

            // B-Type Immediate
            // {instruction[31], instruction[7],
            //  instruction[30:25], instruction[11:8], 1'b0}
            2'd2:
                immExt = {{20{imm[24]}}, imm[0], imm[23:18], imm[4:1], 1'b0};

            // J-Type Immediate
            // {instruction[31], instruction[19:12],
            //  instruction[20], instruction[30:21], 1'b0}
            2'd3:
                immExt = {{12{imm[24]}}, imm[12:5], imm[13], imm[23:14], 1'b0};

            default:
                immExt = 32'd0;

        endcase
    end

endmodule
