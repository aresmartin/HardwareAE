
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
//declaracion de variables
int unidades = 1;
int decenas = 0;
int i;

void main()
{
 ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales

 //configuracion e inicializacion de los módulos del PIC que se vayan a utilizar

    TRISD = 0;
    TRISA = 0;
    
    PORTD = 0;
    PORTA.B0 = 0;
    PORTA.B1 = 0;

 //configuración de interrupciones (si se utilizan)

 while(1) //bucle infinito
 {
    for(i = 0; i < 25; i++)
{
         PORTD = numbers[unidades];
         PORTA.B0 = 1;

         delay_ms(20);
         PORTA.B0 = 0;
         
         PORTD = numbers[decenas];
         PORTA.B1 = 1;
         
         delay_ms(20);
         PORTA.B1 = 0;
//Bucle fotogramas
}
 
 unidades = unidades + 1;
 
     if( unidades == 10)
{
      unidades = 0;
      decenas  = decenas + 1;
 //cambio de decenas
}     
      if(decenas == 6)
{
       decenas = 0;
       unidades = 0;
//reseteo de contadores
}
 //WHILE
}
 //MAIN
}
// Componentes ISIS: PIC18F452, RES, LED-BLUE