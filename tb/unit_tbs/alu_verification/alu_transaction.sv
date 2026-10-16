class alu_transaction;

    // Randomizable input stimuli
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

    constraint c_operand_dist {
       
        operand_a dist {

            32'h0000_0000 := 20,
            32'h7FFF_FFFF := 20,
            32'h8000_0000 := 20,
            32'hFFFF_FFFF := 20,
            [1:32'h7FFF_FFFE] := 20

                        };

        operand_b dist {

            32'h0000_0000 := 20,
            32'h7FFF_FFFF := 20,
            32'h8000_0000 := 20, 
            32'hFFFF_FFFF := 20,
            [1:32'h7FFF_FFFE] := 20

                        };
                            
                               }

endclass
    

