
_decimal_a_digitos:

;Practica2b.c,20 :: 		void decimal_a_digitos(unsigned int numero, unsigned char *digitos){
;Practica2b.c,21 :: 		digitos[0] = numero / 1000;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_decimal_a_digitos_numero+0, 0 
	MOVWF       R0 
	MOVF        FARG_decimal_a_digitos_numero+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVFF       FARG_decimal_a_digitos_digitos+0, FSR1L+0
	MOVFF       FARG_decimal_a_digitos_digitos+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Practica2b.c,22 :: 		numero %= 1000;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_decimal_a_digitos_numero+0, 0 
	MOVWF       R0 
	MOVF        FARG_decimal_a_digitos_numero+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_decimal_a_digitos_numero+0 
	MOVF        R1, 0 
	MOVWF       FARG_decimal_a_digitos_numero+1 
;Practica2b.c,24 :: 		digitos[1] = numero / 100;
	MOVLW       1
	ADDWF       FARG_decimal_a_digitos_digitos+0, 0 
	MOVWF       FLOC__decimal_a_digitos+0 
	MOVLW       0
	ADDWFC      FARG_decimal_a_digitos_digitos+1, 0 
	MOVWF       FLOC__decimal_a_digitos+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVFF       FLOC__decimal_a_digitos+0, FSR1L+0
	MOVFF       FLOC__decimal_a_digitos+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Practica2b.c,25 :: 		numero %= 100;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_decimal_a_digitos_numero+0, 0 
	MOVWF       R0 
	MOVF        FARG_decimal_a_digitos_numero+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_decimal_a_digitos_numero+0 
	MOVF        R1, 0 
	MOVWF       FARG_decimal_a_digitos_numero+1 
;Practica2b.c,27 :: 		digitos[2] = numero / 10;
	MOVLW       2
	ADDWF       FARG_decimal_a_digitos_digitos+0, 0 
	MOVWF       FLOC__decimal_a_digitos+0 
	MOVLW       0
	ADDWFC      FARG_decimal_a_digitos_digitos+1, 0 
	MOVWF       FLOC__decimal_a_digitos+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVFF       FLOC__decimal_a_digitos+0, FSR1L+0
	MOVFF       FLOC__decimal_a_digitos+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Practica2b.c,29 :: 		digitos[3] = numero % 10;
	MOVLW       3
	ADDWF       FARG_decimal_a_digitos_digitos+0, 0 
	MOVWF       FLOC__decimal_a_digitos+0 
	MOVLW       0
	ADDWFC      FARG_decimal_a_digitos_digitos+1, 0 
	MOVWF       FLOC__decimal_a_digitos+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_decimal_a_digitos_numero+0, 0 
	MOVWF       R0 
	MOVF        FARG_decimal_a_digitos_numero+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVFF       FLOC__decimal_a_digitos+0, FSR1L+0
	MOVFF       FLOC__decimal_a_digitos+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Practica2b.c,30 :: 		}
L_end_decimal_a_digitos:
	RETURN      0
; end of _decimal_a_digitos

_mostrar_digito:

;Practica2b.c,33 :: 		void mostrar_digito(unsigned char digito, unsigned char posicion){
;Practica2b.c,36 :: 		switch(posicion){
	GOTO        L_mostrar_digito0
;Practica2b.c,37 :: 		case 0: PORTD = 0b00001110; break;
L_mostrar_digito2:
	MOVLW       14
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;Practica2b.c,38 :: 		case 1: PORTD = 0b00001101; break;
L_mostrar_digito3:
	MOVLW       13
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;Practica2b.c,39 :: 		case 2: PORTD = 0b00001011; break;
L_mostrar_digito4:
	MOVLW       11
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;Practica2b.c,40 :: 		case 3: PORTD = 0b00000111; break;
L_mostrar_digito5:
	MOVLW       7
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;Practica2b.c,43 :: 		}
L_mostrar_digito0:
	MOVF        FARG_mostrar_digito_posicion+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_mostrar_digito2
	MOVF        FARG_mostrar_digito_posicion+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_mostrar_digito3
	MOVF        FARG_mostrar_digito_posicion+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_mostrar_digito4
	MOVF        FARG_mostrar_digito_posicion+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_mostrar_digito5
L_mostrar_digito1:
;Practica2b.c,44 :: 		PORTC = codigos_display[digito];
	MOVLW       _codigos_display+0
	ADDWF       FARG_mostrar_digito_digito+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_codigos_display+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_codigos_display+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTC+0
;Practica2b.c,45 :: 		}
L_end_mostrar_digito:
	RETURN      0
; end of _mostrar_digito

_main:

;Practica2b.c,48 :: 		void main() {
;Practica2b.c,50 :: 		ADCON1 = 0x7;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica2b.c,52 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica2b.c,54 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica2b.c,55 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica2b.c,57 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica2b.c,58 :: 		PORTD = 0b00001110;
	MOVLW       14
	MOVWF       PORTD+0 
;Practica2b.c,60 :: 		while(1){
L_main6:
;Practica2b.c,62 :: 		valor_puertoB = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _valor_puertoB+0 
;Practica2b.c,64 :: 		decimal_a_digitos(valor_puertoB, digitos);
	MOVF        _valor_puertoB+0, 0 
	MOVWF       FARG_decimal_a_digitos_numero+0 
	MOVLW       0
	MOVWF       FARG_decimal_a_digitos_numero+1 
	MOVLW       _digitos+0
	MOVWF       FARG_decimal_a_digitos_digitos+0 
	MOVLW       hi_addr(_digitos+0)
	MOVWF       FARG_decimal_a_digitos_digitos+1 
	CALL        _decimal_a_digitos+0, 0
;Practica2b.c,66 :: 		for(i = 0; i < 4; i++){
	CLRF        _i+0 
L_main8:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;Practica2b.c,67 :: 		mostrar_digito(digitos[i], i);
	MOVLW       _digitos+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_digitos+0)
	MOVWF       FSR0L+1 
	MOVF        _i+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_mostrar_digito_digito+0 
	MOVF        _i+0, 0 
	MOVWF       FARG_mostrar_digito_posicion+0 
	CALL        _mostrar_digito+0, 0
;Practica2b.c,68 :: 		delay_ms(15);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
;Practica2b.c,66 :: 		for(i = 0; i < 4; i++){
	INCF        _i+0, 1 
;Practica2b.c,71 :: 		}
	GOTO        L_main8
L_main9:
;Practica2b.c,74 :: 		}
	GOTO        L_main6
;Practica2b.c,79 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
