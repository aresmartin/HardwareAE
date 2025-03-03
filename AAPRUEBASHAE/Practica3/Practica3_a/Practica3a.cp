#line 1 "C:/Users/marti/Documents/HardwareAE/AAPRUEBASHAE/Practica3/Practica3_a/Practica3a.c"
void main() {
 unsigned char estado = 1;

 ADCON1 = 0x07;

 TRISB.B2 = 1;
 TRISB.B3 = 0;
 PORTB = 0;

 while(1){
 delay_ms(100);
 if(estado = 1 && PORTB.B2 == 0){
 PORTB.B3 = !PORTB.B3;
 estado = 0;

}
 else if(estado = 0 && PORTB.B2 == 1){
 estado = 1;

}

}
}
