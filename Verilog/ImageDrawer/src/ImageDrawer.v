//Moulo que dibuja la pantalla correspondiente con los
//datos medidios.
module ImageDrawer(
  hours,
  minutes,
  seconds,
  milliseconds,
  enable,
  row,
  column,
  r,
  g,
  b
);
    parameter SCREEN_WIDTH=640;
    parameter SCREEN_HEIGHT=480;
    parameter NUMBER_OF_DIGITS = 8;
    parameter ON=1;
    parameter OFF=0;
    parameter DIGIT_WIDTH= (SCREEN_WIDTH)/(2*NUMBER_OF_DIGITS);
    parameter DIGIT_HEIGHT= 2*DIGIT_WIDTH;
    parameter MARGIN_SPACE =( (SCREEN_WIDTH-(DIGIT_WIDTH*39)/4)/2 );
    parameter IMAGE_WIDTH = ((9*DIGIT_WIDTH)+(DIGIT_WIDTH/4)*3); //Ancho realmente utilizado para dibujar.
    parameter IMAGE_HEIGHT = DIGIT_HEIGHT;
    //Estados
    parameter DRAWING_0 = 0;
    parameter DRAWING_1 = 1;
    parameter DRAWING_2 = 2;
    parameter DRAWING_3 = 3;
    parameter DRAWING_4 = 4;
    parameter DRAWING_5 = 5;
    parameter DRAWING_6 = 6;
    parameter DRAWING_7 = 7;
    parameter DRAWING_8 = 8;
    parameter DRAWING_9 = 9;
    parameter DRAWING_DOTS = 10;
    parameter DRAWING_BLANK = 11;
	 //Inputs
    input wire[3:0] hours;
    input wire[5:0] minutes;
    input wire[5:0] seconds;
    input wire[9:0] milliseconds;
    input enable;
    input [15:0]row;
    input [15:0]column;
	 //Outputs
	 output reg r;
	 output reg g;
	 output reg b;
	 //Variables utilizadas
	  reg[3:0] state;
    reg[15:0] counter_row; //Registro que guarda en que pixel se esta dibujando.
    reg[15:0] counter_col;
    reg[3:0] minutes_H;
    reg[3:0] minutes_L;
    reg[3:0] seconds_H;
    reg[3:0] seconds_L;
    reg[3:0] milliseconds_H;
    reg[3:0] milliseconds_M;
    reg[3:0] milliseconds_L;

    task Draw0;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 0.
				r <= ON;
				b <= ON;
          end

          else if (counter_row>= ((9*DIGIT_HEIGHT)/10) ) begin
            g <= ON; //Dibuja la arista inferior del 0.
				r <= ON;
				b <= ON;
          end

          else if (counter_col<= (DIGIT_WIDTH/5) ) begin
            g <= ON; //Dibuja la arista izquierda del 0.
				r <= ON;
				b <= ON;
          end

          else if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
            g <= ON; //Dibuja la arista derecha del 0.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
        end
    
    endtask

    task Draw1;
      begin

        if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
          g <= ON; //Dibuja la arista derecha del 1.
			 r <= ON;
			 b <= ON;
        end

        else begin
          g <= OFF;
			 r <= OFF;
			 b <= OFF;
        end
        
        //Actualizo los contadores
        if (counter_col < (DIGIT_WIDTH-1)) begin
          counter_col <= counter_col + 1;
        end
        else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
        end
        
      end
      
    endtask

    task Draw2;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 2.
				r <= ON;
				b <= ON;
          end

          else if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 2.
				r <= ON;
				b <= ON;		
          end

          else if (counter_row>= ((9*DIGIT_HEIGHT)/10) ) begin
            g <= ON; //Dibuja la arista inferior del 2.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col<= (DIGIT_WIDTH/5) )&&(counter_row>= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista izquierda del 2.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col>= ((4*DIGIT_WIDTH)/5)-1)&&(counter_row<= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista derecha del 2.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end

    endtask

    task Draw3;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 3.
				r <= ON;
				b <= ON;
          end

          else if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 3.
				r <= ON;
				b <= ON;
          end

          else if (counter_row>= ((9*DIGIT_HEIGHT)/10) ) begin
            g <= ON; //Dibuja la arista inferior del 3.
				r <= ON;
				b <= ON;
          end

          else if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
            g <= ON; //Dibuja la arista derecha del 3.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end
      
    endtask

    task Draw4;
      begin
          if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 4. 
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col<= (DIGIT_WIDTH/5))&&(counter_row<= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista izquierda del 4.
				r <= ON;
				b <= ON;
          end

          else if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
            g <= ON; //Dibuja la arista derecha del 4.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end

    endtask

    task Draw5;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 5.
				r <= ON;
				b <= ON;
          end

          else if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 5.
			   r <= ON;
				b <= ON;	
          end

          else if (counter_row>= ((9*DIGIT_HEIGHT)/10) ) begin
            g <= ON; //Dibuja la arista inferior del 5.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col<= (DIGIT_WIDTH/5))&&(counter_row<= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista izquierda del 5.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col>= ((4*DIGIT_WIDTH)/5)-1)&&(counter_row>= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista derecha del 5.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end
    endtask

    task Draw6;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 6.
				r <= ON;
				b <= ON;
          end

          else if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 6.
				r <= ON;
				b <= ON;
          end

          else if (counter_row>= ((9*DIGIT_HEIGHT)/10) ) begin
            g <= ON; //Dibuja la arista inferior del 6.
				r <= ON;
				b <= ON;
          end

          else if (counter_col<= (DIGIT_WIDTH/5) ) begin
            g <= ON; //Dibuja la arista izquierda del 6.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col>= ((4*DIGIT_WIDTH)/5)-1)&&(counter_row>= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista derecha del 6.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end
    endtask

    task Draw7;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 7.
				r <= ON;
				b <= ON;
          end

          else if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
            g <= ON; //Dibuja la arista derecha del 7.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end
      
    endtask

    task Draw8;
      begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 8.
				r <= ON;
				b <= ON;
          end

          else if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 8.
				r <= ON;
				b <= ON;
          end

          else if (counter_row>= ((9*DIGIT_HEIGHT)/10) ) begin
            g <= ON; //Dibuja la arista inferior del 8.
				r <= ON;
				b <= ON;
          end

          else if (counter_col<= (DIGIT_WIDTH/5) ) begin
            g <= ON; //Dibuja la arista izquierda del 8.
				r <= ON;
				b <= ON;
          end

          else if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
            g <= ON; //Dibuja la arista derecha del 8.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end
    endtask

    task Draw9;
        begin
          if (counter_row<= (DIGIT_HEIGHT/10) ) begin
            g <= ON; //Dibuja la arista superior del 9.
				r <= ON;
				b <= ON;
          end

          else if ( ( counter_row>= (DIGIT_HEIGHT/2)-DIGIT_HEIGHT/20 )&&( counter_row< (DIGIT_HEIGHT/2)+DIGIT_HEIGHT/20 ) ) begin
            g <= ON; //Dibuja la arista central del 9.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_col<= (DIGIT_WIDTH/5))&&(counter_row<= DIGIT_HEIGHT/2) ) begin
            g <= ON; //Dibuja la arista izquierda del 9.
				r <= ON;
				b <= ON;
          end

          else if (counter_col>= ((4*DIGIT_WIDTH)/5)-1 ) begin
            g <= ON; //Dibuja la arista derecha del 9.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (DIGIT_WIDTH-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
              g <= OFF;
				  r <= OFF;
				  b <= OFF;
          end
          
      end
    endtask

    task DrawDots;
        begin
          if ( (counter_row< (DIGIT_HEIGHT/4))&&( ( counter_col>=(DIGIT_WIDTH/10))&&( counter_col<((7*DIGIT_WIDTH)/20)) ) ) begin
            g <= ON; //Dibuja el punto superior.
				r <= ON;
				b <= ON;
          end

          else if ( (counter_row>= ((3*DIGIT_HEIGHT)/4))&&( ( counter_col>=(DIGIT_WIDTH/10))&&( counter_col<((7*DIGIT_WIDTH)/20)) ) ) begin
            g <= ON; //Dibuja el punto inferior.
				r <= ON;
				b <= ON;
          end

          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end

          //Actualizo los contadores
          if (counter_col < (((9*DIGIT_WIDTH)/20)-1)) begin
            counter_col <= counter_col + 1;
          end
          else begin
            g <= OFF;
				r <= OFF;
				b <= OFF;
          end
          
      end
    endtask

    //La pantalla comienza toda en negro.
    initial begin 
		r=OFF;
	   g=OFF;
	   b=OFF;
    end
	 always @(row or column) begin
	  if (enable) begin
		 if ( ( (row>=200)&&(row<280) )&&((column>=125)&&(column<515) ) ) begin
			//Se esta barriendo la zona de dibujo.

			//switch donde se actualiza el estado actual
			case (column)
			  125:
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= hours; //pixel en el que empiezan las horas.
			  end
				 
			  (125+DIGIT_WIDTH):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= DRAWING_DOTS; //pixel en el que empiezan los primeros puntos.
			  end

			  (125+DIGIT_WIDTH+(9*DIGIT_WIDTH)/20):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= minutes_H; //pixel en el que empieza el primer digito de minutos.
			  end
			  
			  (125+2*DIGIT_WIDTH+((9*DIGIT_WIDTH)/20)+DIGIT_WIDTH/10) :
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= minutes_L; //pixel en el que empieza el segundo digito de minutos.
			  end
			  
			  (125+3*DIGIT_WIDTH+((9*DIGIT_WIDTH)/20)+DIGIT_WIDTH/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= DRAWING_DOTS; //pixel en el que empiezan los segundos puntos.
			  end
				 
			  (125+3*DIGIT_WIDTH+((2*9*DIGIT_WIDTH)/20)+DIGIT_WIDTH/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= seconds_H; //pixel en el que empieza el primer digito de segundos.
			  end
				 
			  (125+4*DIGIT_WIDTH+((2*9*DIGIT_WIDTH)/20)+(2*DIGIT_WIDTH)/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= seconds_L; //pixel en el que empieza el segundo digito de segundos.
			  end
				 
			  (125+5*DIGIT_WIDTH+((2*9*DIGIT_WIDTH)/20)+(2*DIGIT_WIDTH)/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= DRAWING_DOTS; //pixel en el que empiezan los terceros puntos.
			  end
				 
			  (125+5*DIGIT_WIDTH+((3*9*DIGIT_WIDTH)/20)+(2*DIGIT_WIDTH)/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= milliseconds_H; //pixel en el que empieza el primer digito de milisegundos. 
			  end
				 
			  (125+6*DIGIT_WIDTH+((3*9*DIGIT_WIDTH)/20)+(3*DIGIT_WIDTH)/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= milliseconds_M; //pixel en el que empieza el segundo digito de milisegundos.
			  end
				 
			  (125+7*DIGIT_WIDTH+((3*9*DIGIT_WIDTH)/20)+(4*DIGIT_WIDTH)/10):
			  begin
				 counter_row <= (row-200);
				 counter_col <= 0;
				 state <= milliseconds_L; //pixel en el que empieza el tercer digito de milisegundos.

			  end
				 
			  default: state <= state;
	  
			endcase
		 

			case (state) //Switch donde se dibuja el simbolo correspondiente.
			  DRAWING_0 : Draw0;
			  DRAWING_1 : Draw1;
			  DRAWING_2 : Draw2;
			  DRAWING_3 : Draw3;
			  DRAWING_4 : Draw4;
			  DRAWING_5 : Draw5;
			  DRAWING_6 : Draw6;
			  DRAWING_7 : Draw7;
			  DRAWING_8 : Draw8;
			  DRAWING_9 : Draw9;
			  DRAWING_DOTS : DrawDots;
			 
			  default: begin
							g <= g;
							r <= r;
							b <= b;
						  end
			endcase

			
			
			//switch donde se elige que dibujar dependiendo el estado.
		 end
		 else begin
			g<=OFF;
			r <= OFF;
		   b <= OFF;
		 end

	  end
	  else begin
		g <= OFF;
		r <= OFF;
		b <= OFF;
	  end
	 end
    
    //Actualizo los digitos correspondientes a los minutos
    always @(minutes) begin
      minutes_H = minutes/10;
      minutes_L = minutes%10;
    end
    //Actualizo los digitos correspondientes a los segundos
    always @(seconds) begin
      seconds_H= seconds/10;
      seconds_L= seconds%10;
    end
    //Actualizo los digitos correspondientes a los milisegundos
    always @(milliseconds) begin
      milliseconds_H= milliseconds/100;
      milliseconds_M= (milliseconds%100)/10;
      milliseconds_L= milliseconds%10;
    end
endmodule // ImageDrawerhour