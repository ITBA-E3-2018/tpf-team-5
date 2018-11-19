`include "ImageDrawer.v"
//Modulo que se encarga de verficar que ImageDrawer dibuja
//exitosamente los simbolos en la pantalla.
module ImageDrawer_tb;

 reg [3:0] hours;
 reg [5:0] minutes;
 reg [5:0] seconds;
 reg [9:0] milliseconds;
 reg enable;
 reg [15:0]row;
 reg [15:0]column;
 //Outputs
 wire r;
 wire g;
 wire b;
 //Variable para visualizar
 reg [0:639] fila;
 ImageDrawer inst(hours,minutes,seconds,milliseconds,enable,row,column,r,g,b);

initial begin
  enable =1;
  hours=6;
  minutes=54;
  seconds=31;
  milliseconds =980;
  for (row =0; row <480; row =row+1) begin
    for ( column = 0; column< 640; column = column+1 ) begin
        #1
        fila[column] = g;
    end
    $display("%b",fila);
  end

  $finish;
end

endmodule // ImageDrawer_tb