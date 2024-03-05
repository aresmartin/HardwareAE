
_main:

;Practica2aa.c,20 :: 		void main()
;Practica2aa.c,22 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica2aa.c,26 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica2aa.c,27 :: 		TRISA = 0;
	CLRF        TRISA+0 
;Practica2aa.c,29 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Practica2aa.c,30 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;Practica2aa.c,31 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;Practica2aa.c,35 :: 		while(1) //bucle infinito
L_main0:
;Practica2aa.c,37 :: 		for(i = 0; i < 25; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       25
	SUBWF       _i+0, 0 
L__main10:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica2aa.c,39 :: 		PORTD = numbers[decenas];
	MOVLW       _numbers+0
	ADDWF       _decenas+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      _decenas+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Practica2aa.c,40 :: 		PORTA.B0 = 1;
	BSF         PORTA+0, 0 
;Practica2aa.c,42 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;Practica2aa.c,43 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;Practica2aa.c,45 :: 		PORTD = numbers[unidades];
	MOVLW       _numbers+0
	ADDWF       _unidades+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      _unidades+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Practica2aa.c,46 :: 		PORTA.B1 = 1;
	BSF         PORTA+0, 1 
;Practica2aa.c,48 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;Practica2aa.c,49 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;Practica2aa.c,37 :: 		for(i = 0; i < 25; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Practica2aa.c,51 :: 		}
	GOTO        L_main2
L_main3:
;Practica2aa.c,53 :: 		unidades = unidades + 1;
	INFSNZ      _unidades+0, 1 
	INCF        _unidades+1, 1 
;Practica2aa.c,55 :: 		if( unidades == 10)
	MOVLW       0
	XORWF       _unidades+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       10
	XORWF       _unidades+0, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Practica2aa.c,57 :: 		unidades = 0;
	CLRF        _unidades+0 
	CLRF        _unidades+1 
;Practica2aa.c,58 :: 		decenas  = decenas + 1;
	INFSNZ      _decenas+0, 1 
	INCF        _decenas+1, 1 
;Practica2aa.c,60 :: 		}
L_main7:
;Practica2aa.c,61 :: 		if(decenas == 6)
	MOVLW       0
	XORWF       _decenas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       6
	XORWF       _decenas+0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;Practica2aa.c,63 :: 		decenas = 0;
	CLRF        _decenas+0 
	CLRF        _decenas+1 
;Practica2aa.c,64 :: 		unidades = 0;
	CLRF        _unidades+0 
	CLRF        _unidades+1 
;Practica2aa.c,66 :: 		}
L_main8:
;Practica2aa.c,68 :: 		}
	GOTO        L_main0
;Practica2aa.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
