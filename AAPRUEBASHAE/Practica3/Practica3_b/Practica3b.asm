
_interrupt:

;Practica3b.c,1 :: 		void interrupt(){
;Practica3b.c,2 :: 		PORTB.B3 = !PORTB.B3;
	BTG         PORTB+0, 3 
;Practica3b.c,3 :: 		INTCON3.INT2IF = 0; //se borra el flag de la interrupcion INT2
	BCF         INTCON3+0, 1 
;Practica3b.c,5 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;Practica3b.c,8 :: 		void main() {
;Practica3b.c,9 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica3b.c,11 :: 		TRISB.B2 = 1;
	BSF         TRISB+0, 2 
;Practica3b.c,12 :: 		TRISB.B3 = 0;
	BCF         TRISB+0, 3 
;Practica3b.c,13 :: 		PORTB.B3 = 0;
	BCF         PORTB+0, 3 
;Practica3b.c,15 :: 		INTCON2.INTEDG2 = 1;
	BSF         INTCON2+0, 4 
;Practica3b.c,16 :: 		INTCON3.INT2IF = 0;
	BCF         INTCON3+0, 1 
;Practica3b.c,17 :: 		INTCON3.INT2IE = 1;
	BSF         INTCON3+0, 4 
;Practica3b.c,18 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica3b.c,20 :: 		while(1){
L_main0:
;Practica3b.c,24 :: 		}
	GOTO        L_main0
;Practica3b.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
