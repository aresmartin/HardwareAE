#line 1 "C:/Users/marti/Documents/HardwareAE/HAE/Practicas/Practica2/P2_a/Practica2.c"

 sbit LCD_RS at RD2_bit;
 sbit LCD_EN at RD3_bit;
 sbit LCD_D7 at RD7_bit;
 sbit LCD_D6 at RD6_bit;
 sbit LCD_D5 at RD5_bit;
 sbit LCD_D4 at RD4_bit;


 sbit LCD_RS_Direction at TRISD2_bit;
 sbit LCD_EN_Direction at TRISD3_bit;
 sbit LCD_D7_Direction at TRISD7_bit;
 sbit LCD_D6_Direction at TRISD6_bit;
 sbit LCD_D5_Direction at TRISD5_bit;
 sbit LCD_D4_Direction at TRISD4_bit;

int alfa = 18661;
float resolucion = 0.0048828125;
char txt[14];
int vout;
float volt;
float temperatura = 0;

void reload_timer(){

 TMR0H = (alfa >> 8);
 TMR0L = alfa & 0xFF;

}

void interrupt(){
 if(INTCON.TMR0IF == 1){
 PORTE.B2 = 0;
 PORTE.B0 = 1;



 ADCON0.B2 = 1;
 while (ADCON0.B2);

 vout = ADRESL + (ADRESH << 8);
 volt = vout * resolucion;
 temperatura = volt * 100;

 FloatToStr(temperatura, txt);
 Lcd_Out(1,1, txt);


}
 INTCON.TMR0IF = 0;
 PIR1.ADIF = 0;

}

void main() {

 Lcd_Init();


 ADCON1 = 0b10000000;
 ADCON0 = 0b10100001;

 TRISA = 0xFF;
 TRISD = 0x00;
 TRISE = 0x00;

 T0CON = 0x05;
 reload_timer();
 T0CON.TMR0ON = 1;

 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;
 PIR1.ADIF = 0;
 PIE1.ADIE = 1;
 INTCON.PEIE = 1;
 INTCON.GIE = 1;

 while(1){




}
}
