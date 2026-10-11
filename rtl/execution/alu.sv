module alu (

    input logic [31:0] operand_a,
    input logic [31:0] operand_b,
    input logic [3:0] alu_opcode,
    output logic [31:0] result,
    output logic zero_flag

          );

//Operation declaration for ALU

localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam SLL = 4'b0010;
localparam SLT = 4'b0011;
localparam SLTU = 4'b0100;
localparam XOR = 4'b0101;
localparam SRL = 4'b110;
localparam SRA = 4'b111;
localparam OR = 4'b1000;
localparam AND = 4'b1001;

//Combinational block 
always_comb begin

    case(alu_opcode)

        ADD: result = operand_a + operand_b;
        SUB: result = operand_a - operand_b; 
        SLL: result = operand_a << operand_b[4:0];
        SLT: result = ($signed(operand_a) < $signed(operand_b)) ? 1 : 0;
        SLTU: result = (operand_a < operand_b) ? 1 : 0;
        XOR: result = operand_a ^ operand_b;
        SRL: result = operand_a >> operand_b[4:0];
        SRA: result = $signed(operand_a) >>> $signed(operand_b)[4:0];
        OR: result = operand_a | operand_b;
        AND: result = operand_a & operand_b;
        default: result = 32'b=0;
    
    endcase

end

assign zero_flag = (result == 32'b0);

endmodule
