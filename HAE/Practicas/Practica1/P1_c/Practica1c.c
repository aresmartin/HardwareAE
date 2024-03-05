/*Estructura básica de un programa */

//declaracion de variables globales

//declaracion (y definicion) de funciones

//declaracion y definicion de la ISR (rutina de servicio de interrupciones)
unsigned char values[] = { 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3F, 0x7F, 0xFF, 0x80, 0xFF, 0xE0, 0xFF, 0xF8, 0xFF, 0xFE, 0xFF};
int i;
void main()
{
 //declaracion de variables

 ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales

 //configuracion e inicializacion de los módulos del PIC que se vayan a utilizar
 TRISC = 0;
 PORTC = 0;
 
 TRISB = 1;
 PORTB.B5 = 1;

 //configuración de interrupciones (si se utilizan)

 while(1) //bucle infinito
 {
      if(i == 0) i = 16;
      if(PORTB.B5 == 0){
                  i = i - 1;
                  PORTC = values[i];

}
      //poner fuera del if para que la cpu descanse este pulsado o no el interruptor
      delay_ms(100);
 }
}
// Componentes ISIS: PIC18F452, RES, LED-BLUE