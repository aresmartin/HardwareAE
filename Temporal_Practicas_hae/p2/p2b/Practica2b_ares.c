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


//Funcion que dado un numero, va insertando cada digito en una posicion
void leer_digitos(int numero){
     //Meter reset
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
//FIN seleccionar_digitos
}

void mostrar_digitos(int digito, int posicion){

       for(i = 0; i < 4; i++){
           PORTD = posicion;
           PORTC = numbers[digitos[i]];
//for
}
//mostrar_digitos
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

            // si 1000ms en 50 frames (25 + 25) son 40 ms por frames (1000/50).
            // 40ms -> 20ms para unidades y 20 ms para decenas
            for(i = 0; i < 25; i++){
                  mostrar_digitos(digitos[i], i);
                  //PORTD = 0; // encendemos display

                  delay_ms(15);
                  //PORTD = 1; // apagamos display
//bucle for
}
//bucle while
}
}