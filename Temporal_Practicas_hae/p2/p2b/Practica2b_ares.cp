#line 1 "C:/Users/marti/Documents/Temporal_Practicas_hae/p2/p2b/Practica2b_ares.c"
unsigned char numbers[] =
{
 0x3F,
 0x06,
 0x5B,
 0x4F,
 0x66,
 0x6D,
 0x7D,
 0x07,
 0x7F,
 0x6F
};
int i;
int valor_portB;
static unsigned int digitos[4];



void leer_digitos(int numero){

 int contador = 1000;
 int calculo = 0;
 int separar;

 digitos[0] = numero / contador;
 calculo += digitos[0] * contador;
 separar = numero - calculo;
 contador /= 10;

 digitos[1] = separar / contador;
 calculo += digitos[1] * contador;
 separar = numero - calculo;
 contador /= 10;

 digitos[2] = separar / contador;
 calculo += digitos[2] * contador;
 separar = numero - calculo;
 contador /= 10;

 digitos[3] = separar / contador;

}

void mostrar_digitos(int digito, int posicion){

 for(i = 0; i < 4; i++){
 PORTD = posicion;
 PORTC = numbers[digitos[i]];

}

}

void main() {

 ADCON1 = 0x07;

 TRISB = 1;

 TRISD = 0;
 PORTD = 0;

 TRISC = 0;
 PORTC = 0;

 while(1){

 valor_portB = PORTB;

 leer_digitos(valor_portB);



 for(i = 0; i < 25; i++){
 mostrar_digitos(digitos[i], i);


 delay_ms(15);


}

}
}
