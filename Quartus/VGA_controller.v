//Modulo que recibe una señal de clock adecuada
//y se encarga de proprocionar las señales coreespondientes
//para barrer un monitor VGA de una resolucion dada.

module VGA_controller(
  clk,
  display_enable,
  row,
  column,
  h_sync,
  v_sync
);
//Configuro la cantidad de pixels de cada parametro
//para un monitor VGA de 640*480.
//Parametros del barrido horizontal.
parameter H_PIXELS = 640;
parameter H_FRONT_PORSCH = 16;
parameter H_SYNC_PULSE = 96;
parameter H_BACK_PORSCH = 48; 
parameter H_POL=1;
parameter H_PERIOD= H_PIXELS+H_FRONT_PORSCH+H_BACK_PORSCH+H_SYNC_PULSE;
//Parametros del barrido vertical.
parameter V_PIXELS = 480;
parameter V_FRONT_PORSCH = 10;
parameter V_SYNC_PULSE = 2;
parameter V_BACK_PORSCH = 33;
parameter V_POL=1;
parameter V_PERIOD= V_PIXELS+V_FRONT_PORSCH+V_BACK_PORSCH+V_SYNC_PULSE;

input clk;
output reg display_enable;
output reg[15:0] row;
output reg[15:0] column;
output reg h_sync;
output reg v_sync;

reg [15:0] h_count; //Contador de pixels horizontales barridos.
reg [15:0] v_count; //Contador de pixels verticales barridos.

initial begin
  row<=0;
  column<=0;
  h_count<=0;
  v_count<=0;
end

always @(posedge clk) begin
//Actualizo los contadores.
  if (h_count < (H_PERIOD-1)) begin
    h_count <= h_count+1; //No termino de barrer la fila
  end

  else begin //Termino de barrer una fila
    h_count<=0; 
    if (v_count < (V_PERIOD-1)) begin
        v_count <= v_count+1; //No termino de barrer todas las filas.
    end
    else
        v_count<=0; //Termino de barrer todas las filas.
    
  end

  if ( h_count<(H_PIXELS+H_FRONT_PORSCH) || h_count>(H_PIXELS+H_FRONT_PORSCH+H_SYNC_PULSE)) begin
    h_sync <= ~(H_POL); //No estoy en el pulso de sync. 
  end
  else
    h_sync <= H_POL; //Estoy en el pulso de sync.

  //Actualizo la señal de v_sync  
  if ( v_count<(V_PIXELS+V_FRONT_PORSCH) || v_count>=(V_PIXELS+V_FRONT_PORSCH+V_SYNC_PULSE)) begin
   v_sync <= ~(V_POL); //No estoy en el pulso de sync. 
  end
  else
    v_sync <= V_POL; //Estoy en el pulso de sync.

  //Actualizo las coordenadas del pixel a mostrar.
  if(h_count < H_PIXELS)
    column <= h_count;
  if(v_count < V_PIXELS)
    row <= v_count;  

  //Determino si esta barriendo en la zona visible del display
  if (h_count < H_PIXELS && v_count < V_PIXELS) begin
    display_enable <= 1;
  end  
  else
    display_enable <= 0;
    
  
end


endmodule // VGA_controller