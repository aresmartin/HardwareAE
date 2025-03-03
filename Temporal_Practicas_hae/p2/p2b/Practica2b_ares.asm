
_leer_digitos:

;Practica2b_ares.c,20 :: 		void leer_digitos(int numero){
;Practica2b_ares.c,22 :: 		int contador = 1000;
	MOVLW       232
	MOVWF       leer_digitos_contador_L0+0 
	MOVLW       3
	MOVWF       leer_digitos_contador_L0+1 
	CLRF        leer_digitos_calculo_L0+0 
	CLRF        leer_digitos_calculo_L0+1 
;Practica2b_ares.c,26 :: 		digitos[0] = numero / contador;
	MOVF        leer_digitos_contador_L0+0, 0 
	MOVWF       R4 
	MOVF        leer_digitos_contador_L0+1, 0 
	MOVWF       R5 
	MOVF        FARG_leer_digitos_numero+0, 0 
	MOVWF       R0 
	MOVF        FARG_leer_digitos_numero+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       Practica2b_ares_digitos+0 
	MOVF        R1, 0 
	MOVWF       Practica2b_ares_digitos+1 
;Practica2b_ares.c,27 :: 		calculo += digitos[0] * contador;
	MOVF        leer_digitos_contador_L0+0, 0 
	MOVWF       R4 
	MOVF        leer_digitos_contador_L0+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       leer_digitos_calculo_L0+0, 0 
	MOVWF       FLOC__leer_digitos+4 
	MOVF        R1, 0 
	ADDWFC      leer_digitos_calculo_L0+1, 0 
	MOVWF       FLOC__leer_digitos+5 
	MOVF        FLOC__leer_digitos+4, 0 
	MOVWF       leer_digitos_calculo_L0+0 
	MOVF        FLOC__leer_digitos+5, 0 
	MOVWF       leer_digitos_calculo_L0+1 
;Practica2b_ares.c,28 :: 		separar = numero - calculo;
	MOVF        FLOC__leer_digitos+4, 0 
	SUBWF       FARG_leer_digitos_numero+0, 0 
	MOVWF       FLOC__leer_digitos+0 
	MOVF        FLOC__leer_digitos+5, 0 
	SUBWFB      FARG_leer_digitos_numero+1, 0 
	MOVWF       FLOC__leer_digitos+1 
;Practica2b_ares.c,29 :: 		contador /= 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        leer_digitos_contador_L0+0, 0 
	MOVWF       R0 
	MOVF        leer_digitos_contador_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__leer_digitos+2 
	MOVF        R1, 0 
	MOVWF       FLOC__leer_digitos+3 
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       leer_digitos_contador_L0+0 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       leer_digitos_contador_L0+1 
;Practica2b_ares.c,31 :: 		digitos[1] = separar / contador;
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       R4 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       R5 
	MOVF        FLOC__leer_digitos+0, 0 
	MOVWF       R0 
	MOVF        FLOC__leer_digitos+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       Practica2b_ares_digitos+2 
	MOVF        R1, 0 
	MOVWF       Practica2b_ares_digitos+3 
;Practica2b_ares.c,32 :: 		calculo += digitos[1] * contador;
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       R4 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__leer_digitos+4, 1 
	MOVF        R1, 0 
	ADDWFC      FLOC__leer_digitos+5, 1 
	MOVF        FLOC__leer_digitos+4, 0 
	MOVWF       leer_digitos_calculo_L0+0 
	MOVF        FLOC__leer_digitos+5, 0 
	MOVWF       leer_digitos_calculo_L0+1 
;Practica2b_ares.c,33 :: 		separar = numero - calculo;
	MOVF        FLOC__leer_digitos+4, 0 
	SUBWF       FARG_leer_digitos_numero+0, 0 
	MOVWF       FLOC__leer_digitos+0 
	MOVF        FLOC__leer_digitos+5, 0 
	SUBWFB      FARG_leer_digitos_numero+1, 0 
	MOVWF       FLOC__leer_digitos+1 
;Practica2b_ares.c,34 :: 		contador /= 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       R0 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__leer_digitos+2 
	MOVF        R1, 0 
	MOVWF       FLOC__leer_digitos+3 
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       leer_digitos_contador_L0+0 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       leer_digitos_contador_L0+1 
;Practica2b_ares.c,36 :: 		digitos[2] = separar / contador;
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       R4 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       R5 
	MOVF        FLOC__leer_digitos+0, 0 
	MOVWF       R0 
	MOVF        FLOC__leer_digitos+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       Practica2b_ares_digitos+4 
	MOVF        R1, 0 
	MOVWF       Practica2b_ares_digitos+5 
;Practica2b_ares.c,37 :: 		calculo += digitos[2] * contador;
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       R4 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        FLOC__leer_digitos+4, 0 
	ADDWF       R0, 1 
	MOVF        FLOC__leer_digitos+5, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       leer_digitos_calculo_L0+0 
	MOVF        R1, 0 
	MOVWF       leer_digitos_calculo_L0+1 
;Practica2b_ares.c,38 :: 		separar = numero - calculo;
	MOVF        R0, 0 
	SUBWF       FARG_leer_digitos_numero+0, 0 
	MOVWF       FLOC__leer_digitos+0 
	MOVF        R1, 0 
	SUBWFB      FARG_leer_digitos_numero+1, 0 
	MOVWF       FLOC__leer_digitos+1 
;Practica2b_ares.c,39 :: 		contador /= 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__leer_digitos+2, 0 
	MOVWF       R0 
	MOVF        FLOC__leer_digitos+3, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       leer_digitos_contador_L0+0 
	MOVF        R1, 0 
	MOVWF       leer_digitos_contador_L0+1 
;Practica2b_ares.c,41 :: 		digitos[3] = separar / contador;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        FLOC__leer_digitos+0, 0 
	MOVWF       R0 
	MOVF        FLOC__leer_digitos+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       Practica2b_ares_digitos+6 
	MOVF        R1, 0 
	MOVWF       Practica2b_ares_digitos+7 
;Practica2b_ares.c,43 :: 		}
L_end_leer_digitos:
	RETURN      0
; end of _leer_digitos

_mostrar_digitos:

;Practica2b_ares.c,45 :: 		void mostrar_digitos(int digito, int posicion){
;Practica2b_ares.c,47 :: 		for(i = 0; i < 4; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_mostrar_digitos0:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mostrar_digitos11
	MOVLW       4
	SUBWF       _i+0, 0 
L__mostrar_digitos11:
	BTFSC       STATUS+0, 0 
	GOTO        L_mostrar_digitos1
;Practica2b_ares.c,48 :: 		PORTD = posicion;
	MOVF        FARG_mostrar_digitos_posicion+0, 0 
	MOVWF       PORTD+0 
;Practica2b_ares.c,49 :: 		PORTC = numbers[digitos[i]];
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       Practica2b_ares_digitos+0
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       hi_addr(Practica2b_ares_digitos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVLW       _numbers+0
	ADDWF       POSTINC2+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      POSTINC2+0, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica2b_ares.c,47 :: 		for(i = 0; i < 4; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Practica2b_ares.c,51 :: 		}
	GOTO        L_mostrar_digitos0
L_mostrar_digitos1:
;Practica2b_ares.c,53 :: 		}
L_end_mostrar_digitos:
	RETURN      0
; end of _mostrar_digitos

_main:

;Practica2b_ares.c,55 :: 		void main() {
;Practica2b_ares.c,57 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica2b_ares.c,59 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica2b_ares.c,61 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica2b_ares.c,62 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Practica2b_ares.c,64 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica2b_ares.c,65 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica2b_ares.c,67 :: 		while(1){
L_main3:
;Practica2b_ares.c,69 :: 		valor_portB = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _valor_portB+0 
	MOVLW       0
	MOVWF       _valor_portB+1 
;Practica2b_ares.c,71 :: 		leer_digitos(valor_portB);
	MOVF        _valor_portB+0, 0 
	MOVWF       FARG_leer_digitos_numero+0 
	MOVF        _valor_portB+1, 0 
	MOVWF       FARG_leer_digitos_numero+1 
	CALL        _leer_digitos+0, 0
;Practica2b_ares.c,75 :: 		for(i = 0; i < 25; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main5:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       25
	SUBWF       _i+0, 0 
L__main13:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;Practica2b_ares.c,76 :: 		mostrar_digitos(digitos[i], i);
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       Practica2b_ares_digitos+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(Practica2b_ares_digitos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_mostrar_digitos_digito+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_mostrar_digitos_digito+1 
	MOVF        _i+0, 0 
	MOVWF       FARG_mostrar_digitos_posicion+0 
	MOVF        _i+1, 0 
	MOVWF       FARG_mostrar_digitos_posicion+1 
	CALL        _mostrar_digitos+0, 0
;Practica2b_ares.c,79 :: 		delay_ms(15);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
;Practica2b_ares.c,75 :: 		for(i = 0; i < 25; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Practica2b_ares.c,82 :: 		}
	GOTO        L_main5
L_main6:
;Practica2b_ares.c,84 :: 		}
	GOTO        L_main3
;Practica2b_ares.c,85 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
