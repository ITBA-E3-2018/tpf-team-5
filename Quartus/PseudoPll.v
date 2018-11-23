//Modulo que recibe como entrada un clock de 50KHz
//y devuelve un clock de 1KHz
module PseudoPll(
  clk_in,
  clk_out
);
input wire clk_in;
output reg clk_out;
reg [15:0] counter;
initial begin
  counter<=0;
  clk_out<=0;
end
always @(posedge clk_in) begin
  if (counter < (12588-1)) begin //Aumenta el contador con cada flanco ascendente
    counter <= counter +1;
  end
  else begin
    counter <=0;
    clk_out <= ~clk_out;
  end

end

endmodule // PseudoPll
