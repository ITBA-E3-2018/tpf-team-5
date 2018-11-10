// Modulo que se encarga de determinar el estado
//del cronometro dependiendo del input.
`timescale 1ms / 100us

module counter(
  st_signal,
  reset,
  hours,
  minutes,
  seconds,
  milliseconds
);

    input st_signal;
    input reset;
    output reg[3:0] hours;
    output reg[5:0] minutes;
    output reg[5:0] seconds;
    output reg[9:0] milliseconds;

    wire clk;
    clock_gen clk_gen(clk);
    initial begin
      hours=0; //Pongo el contador en su estado inicial
      minutes=0;
      seconds=0;
      milliseconds=0;
    end
    always @(posedge clk)
        begin
          if(reset)
            begin

            hours=0; //Pongo el contador en su estado inicial
            minutes=0;
            seconds=0;
            milliseconds=0;
              
            end

            if(st_signal)
                //Actualizo milisegundos
                if(milliseconds < 999)
                    milliseconds= milliseconds+1;
                else
                    begin
                    milliseconds=0;
                    //Actualizo los segundos
                        if(seconds<60)
                            seconds= seconds+1;
                        else
                            begin
                              seconds=0;
                              //Actualizo los minutos
                              if(minutes<60)
                                begin
                                  minutes= minutes+1;
                                end
                              else
                                begin
                                  minutes=0;
                                  //Actualizo las horas
                                  hours = hours+1;
                                end  
                            end
                    end
            
        end




endmodule // counter