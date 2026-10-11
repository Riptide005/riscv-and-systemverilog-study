class alu_scoreboard;

    logic [31:0] expected_result;
    logic expected_zero;

    task check(alu_transaction tr);

        case(tr.alu_opcode)

            0: expected_result = tr.operand_a + tr.operand_b; //ADD
            1: expected_result = tr.operand_a - tr.operand_b; //SUB
            2: expected_result = tr.operand_a << tr.operand_b[4:0]; //SLL
            3: expected_result = ($signed(tr.operand_a) < $signed(tr.operand_b)) ? 1 : 0; //SLT
            4: expected_result = (tr.operand_a < tr.operand_b) ? 1 : 0; //SLTU
            5: expected_result = tr.operand_a ^ tr.operand_b; //XOR               
            6: expected_result = tr.operand_a >> tr.operand_b[4:0]; //SRL         
            7: expected_result = $signed(tr.operand_a) >>> tr.operand_b[4:0]; //SRA  
            8: expected_result = tr.operand_a | tr.operand_b; //OR               
            9: expected_result = tr.operand_a & tr.operand_b; //AND                 
            default: expected_result = 32'h0;

        endcase 

        expected_zero = (expected_result == 0) ? 1'b1 : 1'b0;
        
        if ((tr.result === expected_result) && (tr.zero_flag === expected_zero)) begin
            $display("[SCOREBOARD PASS] Opcode = %0d, A = 0x%h, B = 0x%h, Result = 0x%h, Zero = %b", tr.alu_opcode, tr.operand_a, tr.operand_b, tr.result, tr.zero_flag);
        end

        else begin
            $error("[SCOREBOARD FAIL] Opcode = %0d, A = 0x%h, B = 0x%h, Result = 0x%h, Zero = %b", tr.alu_opcode, tr.operand_a, tr.operand_b, tr.result, tr.zero_flag);
        end

    endtask
    
endclass
