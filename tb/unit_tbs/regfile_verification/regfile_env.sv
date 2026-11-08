class regfile_env;
    
    regfile_driver drv;
    regfile_monitor mon;
    regfile_scoreboard scb;

    regfile_transaction tr;
    regfile_transaction mon_tr;

    function new(virtual regfile_if.TB vif);

        drv = new(vif);
        mon = new(vif);
        scb = new(vif);
        
    endfunction

    task run(int num_tests = 100);

        $display("\n=================================");
        $display("        STARTING TESTBENCH        ");
        $display("=================================\n");

        for (int i = 0; i < num_tests; i++) begin

            tr = new();
            if (tr.randomize() == 0) begin
                $fatal(1, "[ENV] Transaction Randomization Failed!");
            end

            drv.drive(tr);

            mon.sample(mon_tr);
            
            scb.check(mon_tr);

        end

        $display("\n================================");
        $display("     TESTBENCH RUN COMPLETE      ");
        $display("================================\n");

    endtask

endclass
