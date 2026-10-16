class regfile_driver;

    virtual regfile_if.TB vif;

    function new(virtual regfile_if.TB vif);
        this.vif = vif;
    endfunction

    task drive(regfile_transaction tr);
        
        vif.clk <= tr.clk;
        vif.rst_n < tr.rst_n;
        vif.we <= tr.we;
        vif.rd_addr <= tr.rd_addr;
        vif.rd_data <= tr.rd_data;
        vif.rs1_addr <= tr.rs1_addr;
        vif.rs2_addr <= tr.rs2_addr;

    endtask

endclass
