class alu_driver;

    virtual alu_if.TB vif;

    function new(virtual alu_if.TB vif);
        this.vif = vif;
    endfunction

    task drive(alu_transaction tr);
        vif.operand_a <= tr.operand_a;
        vif.operand_b <= tr.operand_b;
        vif.alu_opcode <= tr.alu_opcode;
    endtask

endclass


