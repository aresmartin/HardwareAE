#line 1 "C:/Users/Usuario/Documents/GitHub/HAE/Practicas/Practica2/Practica2_a/Practica2aa.c"

unsigned char numbers[] =
{
 0x3F,
 0x06,
 0x5B,
 0x4F,
 0x66,
 0x6D,
 0x6D,
 0x07,
 0x7F,
 0x6F
};

int unidades = 0;
int decenas = 0;
int i;

void main()
{
 ADCON1 = 0x07;



 TRISD = 0;
 TRISA = 0;

 PORTD = 0;
 PORTA.B0 = 0;
 PORTA.B1 = 0;



 while(1)
 {
 for(i = 0; i < 25; i++)
{
 PORTD = numbers[decenas];
 PORTA.B0 = 1;

 delay_ms(20);
 PORTA.B0 = 0;

 PORTD = numbers[unidades];
 PORTA.B1 = 1;

 delay_ms(20);
 PORTA.B1 = 0;

}

 unidades = unidades + 1;

 if( unidades == 10)
{
 unidades = 0;
 decenas = decenas + 1;

}
 if(decenas == 6)
{
 decenas = 0;
 unidades = 0;

}

}

}
