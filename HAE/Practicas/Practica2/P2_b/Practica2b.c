 unsigned char valor_puertoB;
 unsigned char digitos[4];
 unsigned char i;
 
 const unsigned char codigos_display[10] = {
 
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

 //Función para convertir un número decimal a un array de dígitos
void decimal_a_digitos(unsigned int numero, unsigned char *digitos){
        digitos[0] = numero / 1000;
        numero %= 1000;
        
        digitos[1] = numero / 100;
        numero %= 100;
        
        digitos[2] = numero / 10;
        
        digitos[3] = numero % 10;
}

 //Función para mostrar un dígito en el display
 void mostrar_digito(unsigned char digito, unsigned char posicion){
 
      //Activar la seleccion del dígito
      switch(posicion){
           case 0: PORTD = 0b00001110; break;
           case 1: PORTD = 0b00001101; break;
           case 2: PORTD = 0b00001011; break;
           case 3: PORTD = 0b00000111; break;
      
//switch
}
            PORTC = codigos_display[digito];
}


void main() {

      ADCON1 = 0x7;
      
      TRISB = 1;

      TRISC = 0;
      TRISD = 0;
      
      PORTC = 0;
      PORTD = 0b00001110;

 while(1){
 
          valor_puertoB = PORTB;
          
          decimal_a_digitos(valor_puertoB, digitos);
          
          for(i = 0; i < 4; i++){
                mostrar_digito(digitos[i], i);
                delay_ms(15);

//bucle for
}
 
//WHILE
}




}