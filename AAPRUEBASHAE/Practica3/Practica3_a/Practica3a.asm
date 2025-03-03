
_main:

;Practica3a.c,1 :: 		void main() {
;Practica3a.c,2 :: 		unsigned char estado = 1;
;Practica3a.c,4 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica3a.c,6 :: 		TRISB.B2 = 1;
	BSF         TRISB+0, 2 
;Practica3a.c,7 :: 		TRISB.B3 = 0;
	BCF         TRISB+0, 3 
;Practica3a.c,8 :: 		PORTB = 0;
	CLRF        PORTB+0 
;Practica3a.c,10 :: 		while(1){
L_main0:
;Practica3a.c,11 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;Practica3a.c,12 :: 		if(estado = 1 && PORTB.B2 == 0){
	CLRF        R1 
	BTFSC       PORTB+0, 2 
	INCF        R1, 1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
L__main8:
;Practica3a.c,13 :: 		PORTB.B3 = !PORTB.B3;
	BTG         PORTB+0, 3 
;Practica3a.c,16 :: 		}
	GOTO        L_main6
L_main5:
;Practica3a.c,20 :: 		}
L_main7:
L_main6:
;Practica3a.c,22 :: 		}
	GOTO        L_main0
;Practica3a.c,23 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
