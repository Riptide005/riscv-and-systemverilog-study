class regfile_coverage;

    regfile_transaction tr;

    covergroup regfile_cg;

        //Coverpoint 1: RS1 Addresses
        cp_rs1: coverpoint tr.rs1_addr {

            bins zeros = {5'h0};
            bins low = {[5'h1 : 5'hF]};
            bins high = {[5'h10 : 5'h1E]};
            bins max = {5'h1F};

                                       }

        //Coverpoint 2: RS2 Addresses                               
        cp_rs2: coverpoint tr.rs2_addr {

            bins zeros = {5'h0};
            bins low = {[5'h1 : 5'hF]};
            bins high = {[5'h10 : 5'h1E]};
            bins max = {5'h1F};

                                       }
        //Coverpoint 3: x0 Writes
        cp_rd: coverpoint tr.rd_addr {

            bins x0 = {5'h0};
            bins reg_s = {[5'h1 : 5'h1F]};

                                     }

        //Coverpoint 4: Write toggling
        cp_we: coverpoint tr.we {

            bins disabled = {1'b0};
            bins enabled = {1'b1};

                                }

        //Coverpoint 5: Cross coverage
        cross_wr_rd1: cross cp_we, cp_rd, cp_rs1;
        cross_wr_rd2: cross cp_we, cp_rd, cp_rs2;
    
    endgroup

    function new();

        regfile_cg = new();

    endfunction

    function void sample(regfile_transaction t);
        
        this.tr = t;
        regfile_cg.sample();

    endfunction

    function void display_coverage();

        $display("\n===================================");
        $display("    FUNCTIONAL COVERAGE: %0.2f%%    ", regfile_cg.get_inst_coverage());
        $display("===================================\n");

    endfunction

endclass
