//Moulo que dibuja la pantalla correspondiente con los
//datos medidios.
module ImageDrawer(
  hours,
  minutes,
  seconds,
  milliseconds,
  image
);
    parameter SCREEN_WIDTH=640;
    parameter SCREEN_HEIGHT=480;
    parameter NUMBER_OF_DIGITS = 8;
    parameter ON=1;
    parameter OFF=0;
    parameter DIGIT_WIDTH= (SCREEN_WIDTH)/(2*NUMBER_OF_DIGITS);
    parameter DIGIT_HEIGHT= 2*DIGIT_WIDTH;

    input wire[3:0] hours;
    input wire[5:0] minutes;
    input wire[5:0] seconds;
    input wire[9:0] milliseconds;
    output reg[((SCREEN_WIDTH*SCREEN_HEIGHT)-1):0] image; //Se guarda la imagen de la pantalla.
    reg[19:0] pos; //Variable auxiliar par ver donde dibujar.
    reg[7:0] i1;

    task Draw2;
      input reg[19:0] pos_i;
      output reg[((SCREEN_WIDTH*SCREEN_HEIGHT)-1):0]matrix;
      reg[7:0] i;
      reg[7:0] j;
      
      for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
        for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
          //Dibuja la arista superior del 2.
          matrix[pos_i+i+(j*SCREEN_WIDTH)]=ON;
          //Dibuja la arista central del 2.
          matrix[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          //Dibuja la arista inferior del 2.
          matrix[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
        end
      end
    
      for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
        for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
          //Dibuja la arista derecha del 2.
          matrix[pos_i+((0.9+i)*SCREEN_WIDTH)+j]=ON;
          //Dibuja la arista izquierda del 2.
          matrix[pos_i+(0.5*DIGIT_HEIGHT+i)*SCREEN_WIDTH+j]=ON;
        end
      end

    endtask


    //La pantalla comienza toda en negro.
    initial begin
      for (i1 = 0; i1< (SCREEN_WIDTH*SCREEN_HEIGHT); i1= i1+1 ) begin
        image[i1] = OFF;
      end
    end

    //Actualizo el digito correspondiente a las horas
    Draw2(pos,image);
    //Actualizo los digitos correspondientes a los minutos

    //Actuallizo los digitos correspondientes a los segundos

    //Actualizo los digitos correspondientes a los milisegundos
endmodule // ImageDrawerhour