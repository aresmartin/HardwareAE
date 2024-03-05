
_main:

;Practica1c.c,10 :: 		void main()
;Practica1c.c,14 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica1c.c,17 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1c.c,18 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1c.c,20 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica1c.c,21 :: 		PORTB.B5 = 1;
	BSF         PORTB+0, 5 
;Practica1c.c,25 :: 		while(1) //bucle infinito
L_main0:
;Practica1c.c,27 :: 		if(i == 16) i = 0;
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main6
	MOVLW       16
	XORWF       _i+0, 0 
L__main6:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
;Practica1c.c,28 :: 		if(PORTB.B5 == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_main3
;Practica1c.c,29 :: 		i = i + 1;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Practica1c.c,30 :: 		PORTC = values[i];
	MOVLW       _values+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_values+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica1c.c,32 :: 		}
L_main3:
;Practica1c.c,34 :: 		delay_ms(100);
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
;Practica1c.c,35 :: 		}
	GOTO        L_main0
;Practica1c.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
