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
    parameter MARGIN_SPACE = SCREEN_WIDTH-(DIGIT_WIDTH*9.75);

    input wire[3:0] hours;
    input wire[5:0] minutes;
    input wire[5:0] seconds;
    input wire[9:0] milliseconds;
    output reg[((SCREEN_WIDTH*SCREEN_HEIGHT)-1):0] image; //Se guarda la imagen de la pantalla.
    reg[19:0] pos_i; //Variable auxiliar par ver donde dibujar.
    reg[7:0] i1;
    reg[3:0] minutes_H;
    reg[3:0] minutes_L;
    reg[3:0] seconds_H;
    reg[3:0] seconds_L;
    reg[3:0] milliseconds_H;
    reg[3:0] milliseconds_M;
    reg[3:0] milliseconds_L;

    task Draw0;
      reg[7:0] i;
      reg[7:0] j;
      
      begin
        for (j=0;j<(DIGIT_HEIGHT/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
            //Dibuja la arista superior del 0.
            image[pos_i+i+(j*SCREEN_WIDTH)]=ON;
            //Dibuja la arista inferior del 0.
            image[pos_i+(0.9*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
          end
        end
    
        for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
          for (i = 0; i<(DIGIT_HEIGHT) ; i=i+1) begin
            //Dibuja la arista izquierda del 0.
            image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
            //Dibuja la arista derecha del 0.
            image[pos_i+(i+0.9)*SCREEN_WIDTH+j]=ON;
          end
        end
        pos_i= pos_i+DIGIT_WIDTH;
      end
    endtask

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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
        pos_i= pos_i+DIGIT_WIDTH;
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
              //Dibuja la arista izquierda del 9.
              image[pos_i+(i*SCREEN_WIDTH)+j]=ON;
              //Dibuja la arista derecha del 9.
              image[pos_i+(i+0.9)*SCREEN_WIDTH+j]=ON;
          image[pos_i+(0.45*DIGIT_HEIGHT+j)*SCREEN_WIDTH+i]=ON;
            end
          end
      
          for (j=0;j<(DIGIT_WIDTH/10) ; j=j+1) begin
            for (i = 0; i<(DIGIT_HEIGHT/2) ; i=i+1) begin
                image[pos_i+(0.5*DIGIT_HEIGHT+i+0.9)*SCREEN_WIDTH+j]=ON;
            end
          end
          pos_i= pos_i+DIGIT_WIDTH;
        end
    endtask

    task Clear;
        reg[7:0] i;
        reg[7:0] j;
        begin
          for (j=0;j<(DIGIT_HEIGHT) ; j=j+1) begin
            for (i = 0; i<(DIGIT_WIDTH) ; i=i+1) begin
              image[pos_i+i+(j*SCREEN_WIDTH)]=OFF;
            end
          end
        end
    endtask

    task DrawDots;
        reg[7:0] i;
        reg[7:0] j;
        begin
          for (j=0;j<(DIGIT_HEIGHT/4) ; j=j+1) begin
            for (i = 0; i<(DIGIT_WIDTH/4) ; i=i+1) begin
              image[pos_i+i+(j*SCREEN_WIDTH)]=ON; //Dibuja el punto de arriba.
            end
          end

          for (j=0;j<(DIGIT_HEIGHT/4) ; j=j+1) begin
            for (i = 0; i<(DIGIT_WIDTH/4) ; i=i+1) begin
              image[pos_i+i+((0.75+j)*SCREEN_WIDTH)]=ON; //Dibuja el punto de abajo.
            end
          end
          pos_i= pos_i+(DIGIT_WIDTH/4);

        end
    endtask

    //La pantalla comienza toda en negro.
    initial begin
      for (i1 = 0; i1< (SCREEN_WIDTH*SCREEN_HEIGHT); i1= i1+1 ) begin
        image[i1] = OFF;
      end
      //Inicializo el display con todos ceros.
      pos_i= (SCREEN_HEIGHT/2)*(SCREEN_WIDTH)+MARGIN_SPACE;
      //pongo en 0 las horas.
      Draw0;
      pos_i=pos_i + (DIGIT_WIDTH/10); //dejo un espacio
      DrawDots;
      pos_i=pos_i + (DIGIT_WIDTH/10); //dejo un espacio
      //Pongo en 0 los minutos.
      Draw0;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Draw0;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      DrawDots;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      //Pongo en cero los segundos
      Draw0;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Draw0;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      DrawDots;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      //Pongo en cero los milisegundos.
      Draw0;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Draw0;
      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Draw0;

    end

    //Actualizo el digito correspondiente a las horas
    always @(hours) begin
      pos_i= (SCREEN_HEIGHT/2)*(SCREEN_WIDTH)+MARGIN_SPACE;
      Clear;
      case (hours)
       0 : Draw0;
       1 : Draw1;
       2 : Draw2;
       3 : Draw3;
       4 : Draw4;
       5 : Draw5;
       6 : Draw6;
       7 : Draw7;
       8 : Draw8;
       9 : Draw9; 
      endcase
    end
    //Actualizo los digitos correspondientes a los minutos
    always @(minutes) begin
      pos_i= (SCREEN_HEIGHT/2)*(SCREEN_WIDTH)+MARGIN_SPACE+DIGIT_WIDTH*(1.45);
      minutes_H = minutes/10;
      minutes_L = minutes%10;
      Clear;
      case (minutes_H)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
      endcase

      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Clear;

      case (minutes_L)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
        6 : Draw6;
        7 : Draw7;
        8 : Draw8;
        9 : Draw9;
      endcase
    end
    //Actuallizo los digitos correspondientes a los segundos
    always @(seconds) begin
      pos_i= (SCREEN_HEIGHT/2)*(SCREEN_WIDTH)+MARGIN_SPACE+DIGIT_WIDTH*4;
      seconds_H= seconds/10;
      seconds_L= seconds%10;
      Clear;

      case (seconds_H)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
      endcase

      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Clear;

      case (seconds_L)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
        6 : Draw6;
        7 : Draw7;
        8 : Draw8;
        9 : Draw9;
      endcase
    end
    //Actualizo los digitos correspondientes a los milisegundos
    always @(milliseconds) begin
      pos_i= (SCREEN_HEIGHT/2)*(SCREEN_WIDTH)+MARGIN_SPACE+DIGIT_WIDTH*(6.55);
      milliseconds_H= milliseconds/100;
      milliseconds_M= (milliseconds%100)/10;
      milliseconds_L= milliseconds%10;
      Clear;

      case (milliseconds_H)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
        6 : Draw6;
        7 : Draw7;
        8 : Draw8;
        9 : Draw9;
      endcase

      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Clear;

      case (milliseconds_M)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
        6 : Draw6;
        7 : Draw7;
        8 : Draw8;
        9 : Draw9;
      endcase

      pos_i=pos_i +(DIGIT_WIDTH/10); //dejo un espacio
      Clear;

      case (milliseconds_L)
        0 : Draw0;
        1 : Draw1;
        2 : Draw2;
        3 : Draw3;
        4 : Draw4;
        5 : Draw5;
        6 : Draw6;
        7 : Draw7;
        8 : Draw8;
        9 : Draw9;
      endcase

    end
endmodule // ImageDrawerhour