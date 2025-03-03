
_decimal_a_digitos:

;p1b.c,19 :: 		void decimal_a_digitos(unsigned int numero, unsigned char *digitos){
;p1b.c,21 :: 		digitos[0] = numero / 1000;
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
;p1b.c,22 :: 		numero %= 1000;
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
;p1b.c,24 :: 		digitos[1] = numero / 100;
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
;p1b.c,25 :: 		numero %= 100;
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
;p1b.c,27 :: 		digitos[2] = numero / 10;
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
;p1b.c,29 :: 		digitos[3] = numero % 10;
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
;p1b.c,32 :: 		}
L_end_decimal_a_digitos:
	RETURN      0
; end of _decimal_a_digitos

_mostrar_digito:

;p1b.c,34 :: 		void mostrar_digito(unsigned char digito, unsigned char posicion){
;p1b.c,37 :: 		switch(posicion){
	GOTO        L_mostrar_digito0
;p1b.c,38 :: 		case 0: PORTD = 0b00001110; break;
L_mostrar_digito2:
	MOVLW       14
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;p1b.c,39 :: 		case 1: PORTD = 0b00001101; break;
L_mostrar_digito3:
	MOVLW       13
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;p1b.c,40 :: 		case 2: PORTD = 0b00001011; break;
L_mostrar_digito4:
	MOVLW       11
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;p1b.c,41 :: 		case 3: PORTD = 0b00000111; break;
L_mostrar_digito5:
	MOVLW       7
	MOVWF       PORTD+0 
	GOTO        L_mostrar_digito1
;p1b.c,43 :: 		}
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
;p1b.c,44 :: 		PORTC = numbers[digito];
	MOVLW       _numbers+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers+0)
	MOVWF       FSR0L+1 
	MOVF        FARG_mostrar_digito_digito+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;p1b.c,46 :: 		}
L_end_mostrar_digito:
	RETURN      0
; end of _mostrar_digito

_main:

;p1b.c,48 :: 		void main() {
;p1b.c,49 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;p1b.c,51 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;p1b.c,53 :: 		TRISC = 0;
	CLRF        TRISC+0 
;p1b.c,54 :: 		PORTC = 0;
	CLRF        PORTC+0 
;p1b.c,56 :: 		TRISD = 0;
	CLRF        TRISD+0 
;p1b.c,57 :: 		PORTD = 0b00001110;
	MOVLW       14
	MOVWF       PORTD+0 
;p1b.c,60 :: 		while(1)
L_main6:
;p1b.c,66 :: 		}
	GOTO        L_main6
;p1b.c,68 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
