#line 1 "C:/Users/marti/Documents/HardwareAE/AAPRUEBASHAE/Practica3/Practica3_c/Practica3c.c"
int unidades = 0;
int decenas = 0;
int i;
char numbers[10] = {63,6,91,79,102,109,125,7,127,111};

void interrupt(){

 if(INTCON.INT0IF == 1 && INTCON.INT0IE == 1){
 unidades++;
 if(unidades == 10 && decenas == 9){
 unidades = 0;
 decenas = 0;

}
 if(unidades == 10){
 decenas ++;
 unidades = 0;

}

}

 if(INTCON3.INT1IF == 1 && INTCON3.INT1IE == 1 && (unidades != 0 || decenas != 0)){
 if(unidades == 0){
 unidades = 10;
 decenas --;

}
 unidades --;

}
 INTCON3.INT1IF = 0;
 INTCON.INT0IF = 0;

}

void main() {

 ADCON1 = 0x07;

 TRISD = 0;
 PORTD = 0;

 TRISE = 0;
 PORTE = 0;

 TRISB = 1;
 PORTB = 0;

 INTCON2.INTEDG0 = 1;
 INTCON2.INTEDG1 = 1;

 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;

 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 1;

 INTCON.GIE = 1;

 while(1){
 for(i = 0; i < 25; i++){
 PORTD = numbers[unidades];
 PORTE.B1 = 0;

 delay_ms(20);

 PORTE.B1 = 1;

 PORTD = numbers[decenas];
 PORTE.B0 = 0;

 delay_ms(20);

 PORTE.B0 = 1;

}

}
}
