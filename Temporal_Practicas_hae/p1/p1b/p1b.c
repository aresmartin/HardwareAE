unsigned char numbers[10] =
{
       0b00111111, //0
       0b00000110, //1
       0b01011011, //2
       0b01001111, //3
       0b01100110, //4
       0b01101101, //5
       0b01111101, //6
       0b00000111, //7
       0b01111111, //8
       0b01101111 //9
};
unsigned char valor_puertoB;
unsigned char digitos[4];
int i;

// Función para convertir un número decimal a un array de dígitos
void decimal_a_digitos(unsigned int numero, unsigned char *digitos){

    digitos[0] = numero / 1000;
    numero %= 1000;
    
    digitos[1] = numero / 100;
    numero %= 100;
    
    digitos[2] = numero / 10;

    digitos[3] = numero % 10;

//
}

void mostrar_digito(unsigned char digito, unsigned char posicion){

    //Activar la seleccion del dígito
    switch(posicion){
        case 0: PORTD = 0b00001110; break;
        case 1: PORTD = 0b00001101; break;
        case 2: PORTD = 0b00001011; break;
        case 3: PORTD = 0b00000111; break;
//switch
}
      PORTC = numbers[digito];
//
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



//wail
}

}