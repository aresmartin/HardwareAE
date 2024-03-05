#line 1 "C:/Users/Usuario/Documents/GitHub/HAE/Practicas/Practica2/P2_a/Practica2.c"

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

int unidades = 1;
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
#line 68 "C:/Users/Usuario/Documents/GitHub/HAE/Practicas/Practica2/P2_a/Practica2.c"
}

}
