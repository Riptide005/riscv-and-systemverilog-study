class regfile_scoreboard;
    
    logic [31:0] exp_rs1_data, exp_rs2_data;
    logic [31:0] shadow_reg [31:0];
    
    function new();
        foreach(shadow_reg[i]) begin
            shadow_reg[i] = 32'h0;
        end
    endfunction 

    task check(regfile_transaction tr);

        exp_rs1_data = (tr.rs1_addr == 5'h0 ) ? 0 : shadow_reg[tr.rs1_addr];
        exp_rs2_data = (tr.rs2_addr == 5'h0 ) ? 0 : shadow_reg[tr.rs2_addr];
    
        
        if ((tr.rs1_data == exp_rs1_data) && (tr.rs2_data == exp_rs2_data)) begin
            $display("[SCOREBOARD PASS] RS1 = 0x%h, RS2 = 0x%h", tr.rs1_data, tr.rs2_data);
        end 
        
        else begin
            $error("[SCOREBOARD FAIL] RS1 = 0x%h, RS1_Exp = 0x%h, RS2 = 0x%h, RS2_Exp = 0x%h", tr.rs1_data, exp_rs1_data, tr.rs2_data, exp_rs2_data);
        end
        
        if (tr.we && (tr.rd_addr != 5'h0)) begin
            shadow_reg[tr.rd_addr] = tr.rd_data;
        end

    endtask

endclass
