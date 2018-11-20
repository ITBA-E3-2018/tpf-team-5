//Testbench que se encarga de probar el modulo
//PseudoPll

`timescale 1ms / 100us

module PseudoPll_tb;
 wire clk_in;
 wire clk_out;
 clock_gen clk_inst(clk_in);
 PseudoPll inst(clk_in, clk_out);

 initial begin
   #30;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,PseudoPll_tb);
    end

endmodule // PseudoPll_tb