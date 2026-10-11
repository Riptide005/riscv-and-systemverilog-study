class alu_monitor;

    virtual alu_if.TB vif;

    function new(virtual alu_if.TB vif);
        this.vif = vif;
    endfunction

    task sample(output alu_transaction tr);
        
        tr = new();
        tr.operand_a = vif.operand_a;
        tr.operand_b = vif.operand_b;
        tr.alu_opcode = vif.alu_opcode;
        tr.result = vif.result;
        tr.zero_flag = vif.zero_flag;

    endtask

endclass

