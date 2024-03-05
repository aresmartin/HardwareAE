
unsigned char values[] = {0x00, 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3F, 0X7F, 0xFF};
int i;
//, 0x03, 0x07,
void main() {
       ADCON1 = 0x07;
       
       TRISC = 0;
       PORTC = 0;

     while(1){

        for(i = 0; i < 9; i++){
              PORTC = values[i];
              delay_ms(100);
                    
//bulce for
}
//WHILE
}
}