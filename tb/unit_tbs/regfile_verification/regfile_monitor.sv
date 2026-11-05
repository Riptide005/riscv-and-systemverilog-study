class regfile_monitor;

    virtual regfile_if.TB vif;

    function new(virtual regfile_if.TB vif);
        this.vif = vif;
    endfunction

    task sample(output regfile_transaction tr);
    
        @(posedge vif.clk);

        tr = new();
        tr.we = vif.we;
        tr.rd_addr = vif.rd_addr;
        tr.rd_data = vif.rd_data;
        tr.rs1_addr = vif.rs1_addr;
        tr.rs2_addr = vif.rs2_addr;
        tr.rs1_data = vif.rs1_data;
        tr.rs2_data = vif.rs2_data;

    endtask

endclass
