Since this project is pertaining to RV32I, the ALU is naturally a 32-bit ALU
It has 10 possible operations - ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR and finally AND.
This was the first ever module written and tested and so a lot of the core systemverilog practice was done using this module which is helpful because having a simple module like ALU
which performs very simple operations can be debugged easier.
The testing might look a bit overboard but again thats attributed to the fact that I was learning how verification using systemverilog works.
Through testing due to the sheer number of possibilities - 2^32 operands and the lack of directed testing caused the coverage class to report a functional coverage of only 10.20%

