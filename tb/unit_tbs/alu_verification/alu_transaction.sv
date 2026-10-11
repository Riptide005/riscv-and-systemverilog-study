class alu_transaction;

    // Randomizable input stimulus
    rand logic [31:0] operand_a;
    rand logic [31:0] operand_b;
    rand logic [3:0]  alu_opcode;

    // Output responses
    logic [31:0] result;
    logic        zero_flag;

    // Constraint to keep opcodes in range 0-9
    constraint valid_opcode {
        alu_opcode inside {[0:9]};
    }

endclass
    

