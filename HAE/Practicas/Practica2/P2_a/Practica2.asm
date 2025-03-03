
_reload_timer:

;Practica2.c,24 :: 		void reload_timer(){
;Practica2.c,26 :: 		TMR0H = (alfa >> 8);      // Carga primero los bits altos
	MOVF        _alfa+1, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       _alfa+1, 7 
	MOVLW       255
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       TMR0H+0 
;Practica2.c,27 :: 		TMR0L = alfa & 0xFF;      // Carga después los bits bajos mascara and
	MOVLW       255
	ANDWF       _alfa+0, 0 
	MOVWF       TMR0L+0 
;Practica2.c,29 :: 		}
L_end_reload_timer:
	RETURN      0
; end of _reload_timer

_interrupt:

;Practica2.c,31 :: 		void interrupt(){
;Practica2.c,32 :: 		if(INTCON.TMR0IF == 1){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;Practica2.c,33 :: 		PORTE.B2 = 0;
	BCF         PORTE+0, 2 
;Practica2.c,34 :: 		PORTE.B0 = 1;
	BSF         PORTE+0, 0 
;Practica2.c,38 :: 		ADCON0.B2 = 1; // Iniciar conversión
	BSF         ADCON0+0, 2 
;Practica2.c,39 :: 		while (ADCON0.B2); // Esperar a que la conversión termine
L_interrupt1:
	BTFSS       ADCON0+0, 2 
	GOTO        L_interrupt2
	GOTO        L_interrupt1
L_interrupt2:
;Practica2.c,41 :: 		vout = ADRESL + (ADRESH << 8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _vout+0 
	MOVF        R1, 0 
	MOVWF       _vout+1 
;Practica2.c,42 :: 		volt = vout * resolucion;
	CALL        _int2double+0, 0
	MOVF        _resolucion+0, 0 
	MOVWF       R4 
	MOVF        _resolucion+1, 0 
	MOVWF       R5 
	MOVF        _resolucion+2, 0 
	MOVWF       R6 
	MOVF        _resolucion+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _volt+0 
	MOVF        R1, 0 
	MOVWF       _volt+1 
	MOVF        R2, 0 
	MOVWF       _volt+2 
	MOVF        R3, 0 
	MOVWF       _volt+3 
;Practica2.c,43 :: 		temperatura = volt * 100;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura+0 
	MOVF        R1, 0 
	MOVWF       _temperatura+1 
	MOVF        R2, 0 
	MOVWF       _temperatura+2 
	MOVF        R3, 0 
	MOVWF       _temperatura+3 
;Practica2.c,45 :: 		FloatToStr(temperatura, txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Practica2.c,46 :: 		Lcd_Out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica2.c,49 :: 		}
L_interrupt0:
;Practica2.c,50 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Practica2.c,51 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica2.c,53 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;Practica2.c,55 :: 		void main() {
;Practica2.c,57 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica2.c,60 :: 		ADCON1 = 0b10000000; // Configura AN2 como entrada analógica, los demás como digitales
	MOVLW       128
	MOVWF       ADCON1+0 
;Practica2.c,61 :: 		ADCON0 = 0b10100001; // Seleccionar canal AN2, habilitar ADC
	MOVLW       161
	MOVWF       ADCON0+0 
;Practica2.c,63 :: 		TRISA = 0xFF; // Configura PORTA como entrada
	MOVLW       255
	MOVWF       TRISA+0 
;Practica2.c,64 :: 		TRISD = 0x00; // Configura PORTD como salida
	CLRF        TRISD+0 
;Practica2.c,65 :: 		TRISE = 0x00; // Configura PORTE como salida
	CLRF        TRISE+0 
;Practica2.c,67 :: 		T0CON = 0x05;
	MOVLW       5
	MOVWF       T0CON+0 
;Practica2.c,68 :: 		reload_timer();
	CALL        _reload_timer+0, 0
;Practica2.c,69 :: 		T0CON.TMR0ON = 1;
	BSF         T0CON+0, 7 
;Practica2.c,71 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Practica2.c,72 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;Practica2.c,73 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Practica2.c,74 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;Practica2.c,75 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Practica2.c,76 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica2.c,78 :: 		while(1){
L_main3:
;Practica2.c,83 :: 		}
	GOTO        L_main3
;Practica2.c,84 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
