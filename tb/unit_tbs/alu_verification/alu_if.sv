interface alu_if();
    
    logic [31:0] operand_a;
    logic [31:0] operand_b;
    logic [3:0] alu_opcode;
    logic [31:0] result;
    logic zero_flag;

    modport DUT {
        
        input operand_a, 
        input operand_b,
        input alu_opcode,
        output result, 
        output zero_flag
        
                };
     
    modport TB {

        input result,
        input zero_flag,
        output operand_a,
        output operand_b,
        output alu_opcode

               };

endinterface
