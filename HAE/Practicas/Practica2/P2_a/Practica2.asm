
_main:

;Practica2.c,20 :: 		void main()
;Practica2.c,22 :: 		ADCON1 = 0x07; //configuración de los canales analógicos (AN) como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica2.c,26 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica2.c,27 :: 		TRISA = 0;
	CLRF        TRISA+0 
;Practica2.c,29 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Practica2.c,30 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;Practica2.c,31 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;Practica2.c,35 :: 		while(1) //bucle infinito
L_main0:
;Practica2.c,68 :: 		}
	GOTO        L_main0
;Practica2.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
