`timescale 1us / 100ns
module ImageSource_tb;

    reg [((390*80)-1):0] image;
    reg enable;
    reg [15:0]row;
    reg [15:0]column;
    wire r;
    wire g;
    wire b;
    reg i;
    ImageSource inst(image,enable,row,column,r,g,b);

    initial begin
      enable=1;
      for (i = 0;i<(390*80) ;i=i+1 ) begin
        image[i] = 0; //Apago todo los pixels de la imagen.
      end
      image[0]=1;
      image[10]=1;
      image[390*70]=1;
      #1
      row=0;
      column=0;
      #1
      row=0;
      column=1;
      #1
      row=0;
      column=10;
      #1
      row=70;
      column=1;
      #1
      row=70;
      column=0;
      #1
      $finish;
    end

    reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,ImageSource_tb);
    end

endmodule // ImageSource_tb