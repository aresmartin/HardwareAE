
_main:

;Practica1c.c,4 :: 		void main() {
;Practica1c.c,6 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica1c.c,8 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1c.c,9 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1c.c,11 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica1c.c,12 :: 		PORTB.B5 = 1;
	BSF         PORTB+0, 5 
;Practica1c.c,15 :: 		while(1){
L_main0:
;Practica1c.c,16 :: 		if(i == 0) i = 8;
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main6
	MOVLW       0
	XORWF       _i+0, 0 
L__main6:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
	MOVLW       8
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_main2:
;Practica1c.c,17 :: 		if(PORTB.B5 == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_main3
;Practica1c.c,18 :: 		i = i - 1;
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
;Practica1c.c,19 :: 		PORTC = values[i];
	MOVLW       _values+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_values+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica1c.c,23 :: 		}
L_main3:
;Practica1c.c,24 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;Practica1c.c,26 :: 		}
	GOTO        L_main0
;Practica1c.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
