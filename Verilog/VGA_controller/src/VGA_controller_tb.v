//Testbench correspondiente al modulo
// VGA_controller.
`timescale 1ms / 100us
module VGA_controller_tb;

wire clock;
wire display_enable;
wire [15:0]  row;
wire [15:0]  column;
wire  h_sync;
wire  v_sync;
clock_gen clk_inst(clock);
VGA_controller inst(clock,display_enable,row,column,h_sync,v_sync);
initial begin
  #20
  $finish;
end

reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,VGA_controller_tb);
    end

endmodule // VGA_controller_tb