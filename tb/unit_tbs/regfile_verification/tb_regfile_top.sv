module tb_regfile_top();
   
    regfile_if vif();

    regfile dut (

        .clk (vif.clk),
        .rst_n (vif.rst_n),
        .we (vif.we),
        .rd_addr (vif.rd_addr),
        .rd_data (vif.rd_data),
        .rs1_addr (vif.rs1_addr),
        .rs2_addr (vif.rs2_addr),
        .rs1_data (vif.rs1_data),
        .rs2_data (vif.rs2_data)

                );

    regfile_env env;

    //Clock generation
    initial begin
        
        vif.clk = 0;
        forever #5 vif.clk = ~vif.clk;
        
    end

    initial begin
        
        vif.rst_n = 0;
        #20;
        vif.rst_n = 1;
        #10;

        env = new(vif.TB);
        env.run(1000);

        $finish;

    end

endmodule
