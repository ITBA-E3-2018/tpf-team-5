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
    reg[19:0] pos_i; //Variable auxiliar par ver donde dibujar.
    reg[7:0] i1;

    task Draw1;
      reg[7:0] i;
      reg[7:0] j;
      begin
        
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT) ; i=i+1) begin
            //Dibuja la arista derecha del 1.
            image[pos_i+((0.9+i)*SCREEN_WIDTH)+j]=ON;
          end
        end
      end
      
    endtask

    task Draw2;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 2.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista central del 2.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
            //Dibuja la arista inferior del 2.
            image[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
          end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
            //Dibuja la arista derecha del 2.
            image[pos_i+((0.9+i)*SCREEN_WIDTH)+j]=ON;
            //Dibuja la arista izquierda del 2.
            image[pos_i+(0.5*DIGIT_HEIGHT+i)*SCREEN_WIDTH+j]=ON;
          end
        end
      end
      

    endtask


    task Draw3;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 3.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista central del 3.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
            //Dibuja la arista inferior del 3.
            image[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT) ; i=i+1) begin
            //Dibuja la arista derecha del 3.
            image[pos_i+((0.9+i)*SCREEN_WIDTH)+j]=ON;
          end
        end
      end
      

    endtask

    task Draw4;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista central del 4.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT) ; i=i+1) begin
            //Dibuja la arista derecha del 4.
            image[pos_i+((0.9+i)*SCREEN_WIDTH)+j]=ON;
          end
        end

        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
            //Dibuja la arista izquierda del 4.
            image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
          end
        end

      end

    endtask

    task Draw5;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 5.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista central del 5.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
            //Dibuja la arista inferior del 5.
            image[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
            //Dibuja la arista izquierda del 5.
            image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
            //Dibuja la arista derecha del 5.
            image[pos_i+(0.5*DIGIT_HEIGHT+i+0.9)*SCREEN_WIDTH+j]=ON;
          end
        end
      end
    endtask

    task Draw6;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 6.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista central del 6.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
            //Dibuja la arista inferior del 6.
            image[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
            //Dibuja la arista izquierda del 6.
            image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
            image[pos_i+(0.5*DIGIT_HEIGHT+i)*SCREEN_WIDTH+j]=ON;
            //Dibuja la arista derecha del 6.
            image[pos_i+(0.5*DIGIT_HEIGHT+i+0.9)*SCREEN_WIDTH+j]=ON;
            
          end
        end
      end
    endtask

    task Draw7;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 7.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
          end
        end

        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT) ; i=i+1) begin
            //Dibuja la arista derecha del 7.
            image[pos_i+((0.9+i)*SCREEN_WIDTH)+j]=ON;
          end
        end
      end
      
    endtask

    task Draw8;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 8.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista central del 8.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
            //Dibuja la arista inferior del 8.
            image[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT) ; i=i+1) begin
            //Dibuja la arista izquierda del 8.
            image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
            //Dibuja la arista derecha del 8.
            image[pos_i+(i+0.9)*SCREEN_WIDTH+j]=ON;
          end
        end
      end
    endtask

  task Draw9;
      reg[7:0] i;
      reg[7:0] j;
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 9.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista central del 9.
            image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
            //Dibuja la arista izquierda del 9.
            image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
            //Dibuja la arista derecha del 9.
            image[pos_i+(i+0.9)*SCREEN_WIDTH+j]=ON;
            image[pos_i+(0.5*DIGIT_HEIGHT+i+0.9)*SCREEN_WIDTH+j]=ON;
          end
        end
      end
    endtask


    //La pantalla comienza toda en negro.
    initial begin
      for (i1 = 0; i1< (SCREEN_WIDTH*SCREEN_HEIGHT); i1= i1+1 ) begin
        image[i1] = OFF;
      end
      Draw2;
    end

    //Actualizo el digito correspondiente a las horas
    
    //Actualizo los digitos correspondientes a los minutos

    //Actuallizo los digitos correspondientes a los segundos

    //Actualizo los digitos correspondientes a los milisegundos
endmodule // ImageDrawerhour