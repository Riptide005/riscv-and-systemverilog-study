interface regfile_if();

    logic clk, rst_n;
    logic we;
    logic [4:0] rd_addr;
    logic [31:0] rd_data;
    logic [4:0] rs1_addr, rs2_addr;
    logic [31:0] rs1_data, rs2_data;

    modport DUT (

        input clk, rst_n,
        input we,
        input rd_addr,
        input rd_data,
        input rs1_addr, rs2_addr,
        output rs1_data, rs2_data

                );

    modport TB (

        input rs1_data, rs2_data,
        output rs1_addr, rs2_addr,
        output rd_data,
        output rd_addr,
        output we,
        output clk, rst_n

               );

endinterface
