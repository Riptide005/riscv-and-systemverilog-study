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
        ADD: result = a + b;
        SUB: result = a - b;
        SLL: result = a << b[4:0];
        SLT: result = ($signed(a) < $signed(b)) ? 1 : 0;
        SLTU: result = (a < b) ? 1 : 0;
        XOR: result = a ^ b;
        SRL: result = a >> b[4:0];
        SRA: result = $signed(a) >>> $signed(b)[4:0];
        OR: result = a | b;
        AND: result = a & b;
        default: result = 32'b=0;
    endcase
end

assign zero_flag = (result == 32'b0);

endmodule
