void main() 
{
     //Primer 0 = bit7
     TRISB = 0b00000000; //Todos los bits b0, b1,b2 ... van a ser salidas.
     PORTB = 0b00000000; //0 = todos los bits del puerto estarán apagados inicialmente
     
     //Hacer que un led encienda y apague todo el rato
     while(1)
{
              PORTB = 0b00000000;
              Delay_ms(100);
              PORTB = 0b00000001; //El bit que esta a 1 es el RB0 -> encender led
              Delay_ms(100); //Delay al final porque luego salta de nuevo al comienzo del bucle
              
              Delay_ms(100);
              PORTB = 0b00000010;
              Delay_ms(100);
              
              Delay_ms(100);
              PORTB = 0b00000100;
              Delay_ms(100);
              
              Delay_ms(100);
              PORTB = 0b00001000;
              Delay_ms(100);
              
              Delay_ms(100);
              PORTB = 0b00010000;
              Delay_ms(100);
              
              Delay_ms(100);
              PORTB = 0b00100000;
              Delay_ms(100);
              
              Delay_ms(100);
              PORTB = 0b01000000;
              Delay_ms(100);
              
              Delay_ms(100);
              PORTB = 0b10000000;
              Delay_ms(100);


}

     
}