class alu_env;

    alu_driver drv;
    alu_monitor mon;
    alu_scoreboard scb;

    alu_transaction tr;
    alu_transaction mon_tr;

    function new(virtual alu_if.TB vif);
        
        drv = new(vif);
        mon = new(vif);
        scb = new();

    endfunction

    task run(int num_tests = 20);

        $display("\n==================================");
        $display("       STARTING TESTBENCH      ");
        $display("==================================\n");

        for (int i = 0; i < num_tests; i++) begin
            
            tr = new();
            if (tr.randomize() == 0) begin
                $fatal(1, "[ENV] Transaction Randomization Failed!");
            end

            drv.drive(tr);
            
            #10;

            mon.sample(mon_tr);

            scb.check(mon_tr);

        end

        $display("\n=================================");
        $display("    TESTBENCH RUN COMPLETE    ");
        $display("=================================\n");

    endtask
    
endclass

