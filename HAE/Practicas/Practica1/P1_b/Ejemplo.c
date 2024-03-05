/*Estructura básica de un programa */

//declaracion de variables globales

//declaracion (y definicion) de funciones

//declaracion y definicion de la ISR (rutina de servicio de interrupciones)


void main()
{
 //declaracion de variables

 ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales
 
 // configuracion de puertos
 TRISC.B0 = 0; //se declara RC0 como una salida digital
 PORTC.B0 = 0; //se pone el terminal RC0 a 0
 
 TRISC.B1 = 0;
 PORTC.B1 = 0;
 
 TRISC.B2 = 0;
 PORTC.B2 = 0;
 
 TRISC.B3 = 0;
 PORTC.B3 = 0;
 
 TRISC.B4 = 0;
 PORTC.B4 = 0;
 
 TRISC.B5 = 0;
 PORTC.B5 = 0;
 
 TRISC.B6 = 0;
 PORTC.B6 = 0;
 
 TRISC.B7 = 0;
 PORTC.B7 = 0;
 
 


 //configuracion e inicializacion de los módulos del PIC que se vayan a utilizar
 
 //configuración de interrupciones (si se utilizan)

 while(1) //bucle infinito
 {
  PORTC.B0 = 1; //se pone el terminal RC0 a 1
  delay_ms(100); //se introduce un retardo de 200ms en la ejecución del código
  PORTC.B1 = 1; //se pone el terminal RC0 a 0
  delay_ms(100); //se introduce un retardo de 200ms en la ejecución del código
  
  PORTC.B2 = 1;
  delay_ms(100);
  PORTC.B3 = 1;
  delay_ms(100);
  
  PORTC.B4 = 1;
  delay_ms(100);
  PORTC.B5 = 1;
  delay_ms(100);
  
  PORTC.B6 = 1;
  delay_ms(100);
  PORTC.B7 = 1;
  delay_ms(100);
  
  PORTC.B0 = 0;
  PORTC.B1 = 0;
  PORTC.B2 = 0;
  PORTC.B3 = 0;
  PORTC.B4 = 0;
  PORTC.B5 = 0;
  PORTC.B6 = 0;
  PORTC.B7 = 0;
  delay_ms(100);


 }
}
// Componentes ISIS: PIC18F452, RES, LED-BLUE