module tb_alu_top();

    alu_if vif();

    alu dut (
       
        .operand_a (vif.operand_a),
        .operand_b (vif.operand_b),
        .alu_opcode (vif.alu_opcode),
        .result (vif.result),
        .zero_flag (vif.zero_flag)

            );

    alu_env env;

    initial begin

        env = new(vif.TB);
        env.run(1000);

        $finish;

    end

endmodule



        
