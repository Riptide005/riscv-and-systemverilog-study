class regfile_transaction;
    
    //Randomizable input stimuli
    rand logic we;
    rand logic [4:0] rd_addr;
    rand logic [31:0] rd_data;
    rand logic [4:0] rs1_addr, rs2_addr;
    
    //Output response
    logic [31:0] rs1_data, rs2_data;

    constraint set_distributions {
       
        we dist {
            
            1'b0 := 20,
            1'b1 := 80

                };

        rd_addr dist {

            5'b0_0000 := 10,
            [1:5'bF_FFFF] := 90

                     };

        rs1_addr dist {

            5'b0_0000 := 20,
            [1:5'bF_FFFF] := 80
                
                      };

        rs2_addr dist {

            5'b0_0000 := 15,
            [1:5'bF_FFFF] := 85

                      };

        rd_data dist {

            32'h0000_0000 := 20,
            32'hFFFF_FFFF := 20,
            [1:32'hFFFF_FFFE] := 60

                     };

                                  }

endclass


