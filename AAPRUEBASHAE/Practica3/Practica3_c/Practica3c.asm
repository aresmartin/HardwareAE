
_interrupt:

;Practica3c.c,6 :: 		void interrupt(){
;Practica3c.c,8 :: 		if(INTCON.INT0IF == 1 && INTCON.INT0IE == 1){
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt2
L__interrupt23:
;Practica3c.c,9 :: 		unidades++;
	INFSNZ      _unidades+0, 1 
	INCF        _unidades+1, 1 
;Practica3c.c,10 :: 		if(unidades == 10 && decenas == 9){
	MOVLW       0
	XORWF       _unidades+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt26
	MOVLW       10
	XORWF       _unidades+0, 0 
L__interrupt26:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       0
	XORWF       _decenas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt27
	MOVLW       9
	XORWF       _decenas+0, 0 
L__interrupt27:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
L__interrupt22:
;Practica3c.c,11 :: 		unidades = 0;
	CLRF        _unidades+0 
	CLRF        _unidades+1 
;Practica3c.c,12 :: 		decenas = 0;
	CLRF        _decenas+0 
	CLRF        _decenas+1 
;Practica3c.c,14 :: 		}
L_interrupt5:
;Practica3c.c,15 :: 		if(unidades == 10){
	MOVLW       0
	XORWF       _unidades+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt28
	MOVLW       10
	XORWF       _unidades+0, 0 
L__interrupt28:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
;Practica3c.c,16 :: 		decenas ++;
	INFSNZ      _decenas+0, 1 
	INCF        _decenas+1, 1 
;Practica3c.c,17 :: 		unidades = 0;
	CLRF        _unidades+0 
	CLRF        _unidades+1 
;Practica3c.c,19 :: 		}
L_interrupt6:
;Practica3c.c,21 :: 		}
L_interrupt2:
;Practica3c.c,23 :: 		if(INTCON3.INT1IF == 1 && INTCON3.INT1IE == 1 && (unidades != 0 || decenas != 0)){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt11
	BTFSS       INTCON3+0, 3 
	GOTO        L_interrupt11
	MOVLW       0
	XORWF       _unidades+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt29
	MOVLW       0
	XORWF       _unidades+0, 0 
L__interrupt29:
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt21
	MOVLW       0
	XORWF       _decenas+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt30
	MOVLW       0
	XORWF       _decenas+0, 0 
L__interrupt30:
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt21
	GOTO        L_interrupt11
L__interrupt21:
L__interrupt20:
;Practica3c.c,24 :: 		if(unidades == 0){
	MOVLW       0
	XORWF       _unidades+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt31
	MOVLW       0
	XORWF       _unidades+0, 0 
L__interrupt31:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt12
;Practica3c.c,25 :: 		unidades = 10;
	MOVLW       10
	MOVWF       _unidades+0 
	MOVLW       0
	MOVWF       _unidades+1 
;Practica3c.c,26 :: 		decenas --;
	MOVLW       1
	SUBWF       _decenas+0, 1 
	MOVLW       0
	SUBWFB      _decenas+1, 1 
;Practica3c.c,28 :: 		}
L_interrupt12:
;Practica3c.c,29 :: 		unidades --;
	MOVLW       1
	SUBWF       _unidades+0, 1 
	MOVLW       0
	SUBWFB      _unidades+1, 1 
;Practica3c.c,31 :: 		}
L_interrupt11:
;Practica3c.c,32 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;Practica3c.c,33 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3c.c,35 :: 		}
L_end_interrupt:
L__interrupt25:
	RETFIE      1
; end of _interrupt

_main:

;Practica3c.c,37 :: 		void main() {
;Practica3c.c,39 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica3c.c,41 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica3c.c,42 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Practica3c.c,44 :: 		TRISE = 0;
	CLRF        TRISE+0 
;Practica3c.c,45 :: 		PORTE = 0;
	CLRF        PORTE+0 
;Practica3c.c,47 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;Practica3c.c,48 :: 		PORTB = 0;
	CLRF        PORTB+0 
;Practica3c.c,50 :: 		INTCON2.INTEDG0 = 1;
	BSF         INTCON2+0, 6 
;Practica3c.c,51 :: 		INTCON2.INTEDG1 = 1;
	BSF         INTCON2+0, 5 
;Practica3c.c,53 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3c.c,54 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;Practica3c.c,56 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;Practica3c.c,57 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;Practica3c.c,59 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica3c.c,61 :: 		while(1){
L_main13:
;Practica3c.c,62 :: 		for(i = 0; i < 25; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main15:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVLW       25
	SUBWF       _i+0, 0 
L__main33:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
;Practica3c.c,63 :: 		PORTD = numbers[unidades];
	MOVLW       _numbers+0
	ADDWF       _unidades+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      _unidades+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Practica3c.c,64 :: 		PORTE.B1 = 0;
	BCF         PORTE+0, 1 
;Practica3c.c,66 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	NOP
	NOP
;Practica3c.c,68 :: 		PORTE.B1 = 1;
	BSF         PORTE+0, 1 
;Practica3c.c,70 :: 		PORTD = numbers[decenas];
	MOVLW       _numbers+0
	ADDWF       _decenas+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers+0)
	ADDWFC      _decenas+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Practica3c.c,71 :: 		PORTE.B0 = 0;
	BCF         PORTE+0, 0 
;Practica3c.c,73 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	NOP
	NOP
;Practica3c.c,75 :: 		PORTE.B0 = 1;
	BSF         PORTE+0, 0 
;Practica3c.c,62 :: 		for(i = 0; i < 25; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Practica3c.c,77 :: 		}
	GOTO        L_main15
L_main16:
;Practica3c.c,79 :: 		}
	GOTO        L_main13
;Practica3c.c,80 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
