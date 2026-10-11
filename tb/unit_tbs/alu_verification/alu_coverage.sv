class alu_coverage;

    alu_transaction tr;

    covergroup alu_cg;

        //Coverpoint 1: ALL Opcodes
        cp_opcode: coverpoint tr.alu_opcode {
           
            bins all_opcodes[] = {[0:9]};

                                            }

        //Coverpoint 2: Operand boundary conditions for operand_a
        cp_operand_a: coverpoint tr.operand_a {

            bins zero = {32'h0000_0000};
            bins max_pos = {32'h7FFF_FFFF};
            bins max_neg = {32'h8000_0000};
            bins all_ones = {32'hFFFF_FFFF};

                                              }

        //Coverpoint 3: Operand boundary conditions for operand_b
        cp_operand_b: coverpoint tr.operand_b {

            bins zero = {32'h0000_0000};
            bins max_pos = {32'h7FFF_FFFF};
            bins max_neg = {32'h8000_0000};
            bins all_ones = {32'hFFFF_FFFF};

                                              }
        
        //Coverpoint 4: Cross Coverage - Operand_A zero bins and Opcode
        cross_op_a_zero: cross cp_opcode, cp_operand_a {
            
            ignore_bins non_zero = !binsof(cp_operand_a.zero);
                
                                                       }

        //Coverpoint 5: Cross Coverage - Operand_B zero bins and Opcode
        cross_op_b_zero: cross cp_opcode, cp_operand_b {

            ignore_bins non_zero = !binsof(cp_operand_a.zero);

                                                       }

    endgroup

    function new();

        alu_cg = new();

    endfunction

    function void sample(alu_transaction t); 

        this.tr = t;
        alu_cg.sample();
        
    endfunction
        
    function void display_coverage();
        $display("==================================");
        $display(" FUNCTIONAL COVERAGE: %0.2f%%", alu_cg.get_inst_coverage());
        $display("==================================");
    endfunction

endclass

