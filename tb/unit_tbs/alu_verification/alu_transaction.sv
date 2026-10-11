
class alu_transaction;
    rand bit [31:0] operand_a;
    rand bit [31:0] operand_b;
    rand bit [3:0] alu_opcode;
    logic [31:0] result;
    logic zero_flag;
        
    constraint valid_op_c { //Constraining to prevent garbage opcodes
        alu_opcode inside {[0:9]};
    }

    constraint operand_const { //Edge Case probability improvement using dist
        operand_a dist {
            32'h0000_0000 := 10,
            32'hFFFF_FFFF := 10,
            [1:50] := 30,
            [51:100] := 50
        };
        operand_b dist {
            32'h0000_0000 := 20,
            32'hFFFF_FFFF := 20,
            [1:50] := 50,
            [51:100] := 10
        };
    }

    function new();
        //Leave empty for now
    endfunction
        
    function void display();
        $display("Time = %0d, A = %h, B = %h, Operation = %h, Result = %h", $time, operand_a, operand_b, alu_opcode, result);
    
    endfunction
    
endclass



initial begin

    alu_transaction tr; //Handle declaration
    tr = new(); //Memory allocation
    if (!tr.randomize()) begin //Randomization check + call
        $error("Randomization failed!");
    end
    tr.display(); //Print the results
end

endmodule
    

