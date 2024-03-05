unsigned char digitos[4];
int i;

unsigned char numbers[10] =
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

void decimal_a_digitos(unsigned int numero, unsigned char *digitos){
         digitos[0] = numero / 1000;
         numero %= 1000;
         
         digitos[1] = numero / 100;
         numero %= 100
         
         digitos[2] = numero / 10;
         digitos[3] = numero % 10;
//
}

void mostrar_digito(unsigned int digito, unsigned char posicion){
        switch(posicion){
                case 0: digitos[0] = 0b00001110; break;
                case 1: digitos[1] = 0b00001101; break;
                case 2: digitos[2] = 0b00001011; break;
                case 3: digitos[3] = 0b00000111; break;
        
// switch
}
         PORTC = numbers
//
}


void main() {

     ADCON1 = 0x07;
     
     TRISB = 0;
     PORTB = 0;
     
     TRISD = 0;
     PORTD = 0;
     
     TRISC = 0;
     PORTC = 0;
     



}