//Modulo que recibe la posicion que
//debe mostrarse en el display de la imagen.
//El mismo busca dicha posicion y devuelve 
//el valor RGB a mostrar.
//Por default solo pinta los pixels prendidios de verde.
module ImageSource(
  image,
  enable,
  row,
  column,
  r,
  g,
  b
);

parameter IMAGE_WIDTH = 640;
parameter IMAGE_HEIGHT = 480;
parameter ON = 1;
parameter OFF = 0;

input [((IMAGE_HEIGHT*IMAGE_WIDTH)-1):0] image;
input enable;
input [15:0]row;
input [15:0]column;
output reg r;
output reg g;
output reg b;
initial begin
  r=OFF;
  g=OFF;
  b=OFF;
end
always @(row or column or image) begin
  if (enable) begin
  g<= image[(row*IMAGE_WIDTH)+column];
  end
end

endmodule // ImageSource