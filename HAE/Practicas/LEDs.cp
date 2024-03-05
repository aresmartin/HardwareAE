#line 1 "C:/Users/Usuario/Documents/GitHub/HAE/Practicas/LEDs.c"
void main()
{

 TRISB = 0b00000000;
 PORTB = 0b00000000;


 while(1)
{
 PORTB = 0b00000000;
 Delay_ms(100);
 PORTB = 0b00000001;
 Delay_ms(100);

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
