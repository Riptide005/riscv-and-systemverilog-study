module regfile(

    input logic clk, rst_n,                //Clock and Active-Low Reset
    input logic we,                        //Write enable 
    input logic [4:0] rd_addr,             //Write Address
    input logic [31:0] rd_data,            //Write Data
    input logic [4:0] rs1_addr, rs2_addr,  //Read Address 1 and 2 
    output logic [31:0] rs1_data, rs2_data // Read Data 1 and 2

               );

    logic [31:0] registers [31:0] ; // Makes 32 of 32-bit registers

    always_ff(posedge clk or negedge rst_n) begin

        if (!rst_n) begin
            for (int i = 0; i < 32; i++) begin
                registers[i] <= 32'h0;
            end
        end
        else begin
            if (we && (rd_addr != 5'h0)) begin
                registers[rd_addr] <= rd_data;
            end
        end
    end

    assign rs1_data = (rs1_addr == 5'h0) ? 32'h0 : registers[rs1_addr];
    assign rs2_data = (rs2_addr == 5'h0) ? 32'h0 : registers[rs2_addr];

endmodule
