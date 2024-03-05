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

void main() {

        ADCON1 = 0x07;
        
        TRISA = 0;
        PORTA.B0 = 1;
        PORTA.B1 = 1;
        
        TRISD = 0;
        PORTD = 0;


       while(1){
            for(i = 0; i < 25; i++){
                  PORTD = numbers[unidades];
                  PORTA.B0 = 0;

                  delay_ms(20);
                  PORTA.B0 = 1;

                  PORTD = numbers[decenas];
                  PORTA.B1 = 0;

                  delay_ms(20);
                  PORTA.B1 = 1;
//bucle for
}
        unidades = unidades + 1;
        if(unidades == 10){
            unidades = 0;
            decenas = decenas + 1;
 
//bucle if unidades
}

        if(decenas == 6){
            decenas = 0;
            unidades = 0;
        
//bucle if decenas
}
//bucle while
}
}