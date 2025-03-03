#line 1 "C:/Users/marti/Documents/Temporal_Practicas_hae/p1/p1b/p1b.c"
unsigned char numbers[10] =
{
 0b00111111,
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01101111
};
unsigned char valor_puertoB;
unsigned char digitos[4];
int i;


void decimal_a_digitos(unsigned int numero, unsigned char *digitos){

 digitos[0] = numero / 1000;
 numero %= 1000;

 digitos[1] = numero / 100;
 numero %= 100;

 digitos[2] = numero / 10;

 digitos[3] = numero % 10;


}

void mostrar_digito(unsigned char digito, unsigned char posicion){


 switch(posicion){
 case 0: PORTD = 0b00001110; break;
 case 1: PORTD = 0b00001101; break;
 case 2: PORTD = 0b00001011; break;
 case 3: PORTD = 0b00000111; break;

}
 PORTC = numbers[digito];

}

void main() {
 ADCON1 = 0x07;

 TRISB = 1;

 TRISC = 0;
 PORTC = 0;

 TRISD = 0;
 PORTD = 0b00001110;


 while(1)
{




}

}
