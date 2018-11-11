//Testbench correspondiente al modulo counter.v
`timescale 1ms / 100us

module counter_tb;
reg start_signal;
reg reset;
wire[3:0] hours;
wire[5:0] minutes;
wire[5:0] seconds;
wire[9:0] milliseconds;
wire clk;
clock_gen clk_gen(clk);
counter inst(clk, start_signal,reset, hours, minutes, seconds, milliseconds);

initial begin
    start_signal=1;
    reset=0;
    #70000
    start_signal=0;
    #5000
    start_signal=1;
    #70000
    reset=1;
    #1
    reset=0;
    #30000
    $finish;
end

reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,counter_tb);
    end


endmodule // counter_tb

