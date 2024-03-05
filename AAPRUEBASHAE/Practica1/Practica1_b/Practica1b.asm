
_main:

;Practica1b.c,5 :: 		void main() {
;Practica1b.c,6 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica1b.c,8 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1b.c,9 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1b.c,12 :: 		while(1){
L_main0:
;Practica1b.c,14 :: 		for(i = 0; i < 9; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       9
	SUBWF       _i+0, 0 
L__main7:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica1b.c,15 :: 		PORTC = values[i];
	MOVLW       _values+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_values+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica1b.c,16 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;Practica1b.c,14 :: 		for(i = 0; i < 9; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Practica1b.c,19 :: 		}
	GOTO        L_main2
L_main3:
;Practica1b.c,27 :: 		}
	GOTO        L_main0
;Practica1b.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
