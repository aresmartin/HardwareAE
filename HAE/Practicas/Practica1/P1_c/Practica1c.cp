#line 1 "C:/Users/Usuario/Documents/GitHub/HAE/Practicas/Practica1/P1_c/Practica1c.c"







unsigned char values[] = { 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3F, 0x7F, 0xFF, 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC, 0xFE, 0xFF};
int i;
void main()
{


 ADCON1 = 0x07;


 TRISC = 0;
 PORTC = 0;

 TRISB = 1;
 PORTB.B5 = 1;



 while(1)
 {
 if(i == 16) i = 0;
 if(PORTB.B5 == 0){
 i = i + 1;
 PORTC = values[i];

}

 delay_ms(100);
 }
}
