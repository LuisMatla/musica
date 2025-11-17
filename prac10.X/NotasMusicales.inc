;==============================================================================
;Archivo: NotasMusicales.inc
;Para PIC16F877A con cristal de 4MHz (Tcy = 1us)
;Salida del altavoz: PORTD, 0
;==============================================================================

;--- DEFINICIÓN DE REGISTROS DE PROPÓSITO GENERAL ---
;Se asume que estos registros no están siendo utilizados por el programa principal.
CBLOCK 0x20
    ;Registros para subrutinas de Retardo
    DELAY_REG1
    DELAY_REG2
    ;Registros para Generación de Tono
    NOTE_DELAY                       ;contador para la mitad del periodo del tono (K).
    NOTE_COUNTER                     ;contador de bucle (Loop Counter).
ENDC

;--- CONSTANTES PARA RETARDOS (K = Contador del bucle interior) ---
;K ~= (Ciclos_Totales - 6) / 3 * N_veces_llamado_Tone_Gen. Ajuste empírico.
#define D_1MS d'125'                 ;(Para un bucle doble).
#define D_20MS d'250'
#define D_50MS d'250'
#define D_100MS d'250'
#define D_200MS d'250'

;--- CONSTANTES DE FRECUENCIA PARA OCTAVA 7 (K = Contador del bucle TGen_Loop) ---
;K ~= (Ciclos_T_Half - 4) / 4. Ajuste para frecuencias altas (2kHz - 4kHz).
#define K_SI_7OCT d'31'              ;B7 (~3951 Hz).
#define K_LAS_70CT d'33'             ;A#7 (~3730 Hz).
#define K_LA_7OCT d'35'              ;A7 (~3520 Hz).
#define K_SOL_7OCT d'39'             ;G7 (~3136 Hz).
#define K_FAS_7OCT d'41'             ;F#7 (~2960 Hz) - Usado también para SOLB.
#define K_SOLB_7OCT d'41'            ;G_flat7 (~2960 Hz) - Enharmónico.
#define K_FA_7OCT d'44'              ;F7 (~2794 Hz).
#define K_MI_7OCT d'46'              ;E7 (~2637 Hz).
#define K_RE_7OCT d'52'              ;D7 (~2349 Hz).
#define K_DOS_7OCT d'55'             ;C#7 (~2217 Hz) - Usado también para REB.
#define K_REB_70CT d'55'             ;D_flat7 (~2217 Hz) - Enharmónico.
#define K_DO_70CT d'59'              ;C7 (~2093 Hz).

;--- RUTINAS PARA ESTABLECER LA FRECUENCIA DE LA NOTA ---
;La rutina de nota solo carga el valor de K en NOTE_DELAY.

MI_7OCT                              ;subrutina para configurar la nota Mi de la séptima octava.
MOVLW K_MI_7OCT                      ;mueve la constante K_MI_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

RE_7OCT                              ;subrutina para configurar la nota Re de la séptima octava.
MOVLW K_RE_7OCT                      ;mueve la constante K_RE_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

DO_70CT                              ;subrutina para configurar la nota Do de la séptima octava.
MOVLW K_DO_70CT                      ;mueve la constante K_DO_70CT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

SI_7OCT                              ;subrutina para configurar la nota Si de la séptima octava.
MOVLW K_SI_7OCT                      ;mueve la constante K_SI_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

LA_7OCT                              ;subrutina para configurar la nota La de la séptima octava.
MOVLW K_LA_7OCT                      ;mueve la constante K_LA_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

SOLB_70CT                            ;subrutina para configurar la nota Sol Bemol / Fa Sostenido de la séptima octava.
MOVLW K_SOLB_7OCT                    ;mueve la constante K_SOLB_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

FA_7OCT                              ;subrutina para configurar la nota Fa de la séptima octava.
MOVLW K_FA_7OCT                      ;mueve la constante K_FA_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

SOL_70CT                             ;subrutina para configurar la nota Sol de la séptima octava.
MOVLW K_SOL_7OCT                     ;mueve la constante K_SOL_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

LAS_70CT                             ;subrutina para configurar la nota La Sostenido de la séptima octava.
MOVLW K_LAS_70CT                     ;mueve la constante K_LAS_70CT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

REB_70CT                             ;subrutina para configurar la nota Re Bemol / Do Sostenido de la séptima octava.
MOVLW K_REB_70CT                     ;mueve la constante K_REB_70CT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

FAS_7OCT                             ;subrutina para configurar la nota Fa Sostenido / Sol Bemol de la séptima octava.
MOVLW K_FAS_7OCT                     ;mueve la constante K_FAS_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

DOS_7OCT                             ;subrutina para configurar la nota Do Sostenido de la séptima octava.
MOVLW K_DOS_7OCT                     ;mueve la constante K_DOS_7OCT al registro W.
MOVWF NOTE_DELAY                     ;guarda el valor en NOTE_DELAY.
RETURN                               ;regresa de la subrutina.

;--- GENERADOR DE TONO (1/2 PERIODO) ---
Tone_Gen                             ;generador de tono que alterna el pin del altavoz.
BTG PORTD, 0                         ;alterna el bit 0 del PORTD (pin del altavoz) (1 ciclo).
MOVF NOTE_DELAY, W                   ;carga el valor de NOTE_DELAY en W.
MOVWF NOTE_COUNTER                   ;guarda el valor en NOTE_COUNTER (1 ciclo).

TGen_Loop                            ;bucle del generador de tono.
NOP                                  ;operación no operativa (1 ciclo).
DECFSZ NOTE_COUNTER, F               ;decrementa NOTE_COUNTER y salta si es cero (1/2 ciclos).
GOTO TGen_Loop                       ;regresa al inicio del bucle (2 ciclos).
RETURN                               ;regresa de la subrutina.
;Nota: Esta rutina genera un pulso de un solo medio período (T/2)
;con una duración aproximada de T/2_cycles ~= 2 + (K * 4) us.

;-----------------------------------------------------------------------------
;--- RUTINAS DE RETARDO DE TIEMPO (DURACIÓN DE LA NOTA) ---
;Las rutinas de retardo llaman repetidamente a Tone_Gen para mantener la frecuencia.
;Se utilizan bucles de doble registro (DELAY_REG1 y DELAY_REG2) para milisegundos.

Retardo_1ms                          ;subrutina de retardo de 1 milisegundo.
MOVLW d'1'                           ;mueve el valor decimal 1 al registro W (bucle exterior).
MOVWF DELAY_REG1                     ;guarda el valor en DELAY_REG1.

Delay_1ms_Loop1                      ;bucle exterior de 1 milisegundo.
MOVLW D_1MS                          ;mueve la constante D_1MS (125) al registro W (bucle interior).
MOVWF DELAY_REG2                     ;guarda el valor en DELAY_REG2.

Delay_1ms_Loop2                      ;bucle interior de 1 milisegundo.
CALL Tone_Gen                        ;llama al generador de tono (genera un ciclo de la nota).
DECFSZ DELAY_REG2, F                 ;decrementa DELAY_REG2 y salta si es cero.
GOTO Delay_1ms_Loop2                ;regresa al inicio del bucle interior.
DECFSZ DELAY_REG1, F                 ;decrementa DELAY_REG1 y salta si es cero.
GOTO Delay_1ms_Loop1                ;regresa al inicio del bucle exterior.
RETURN                               ;regresa de la subrutina.

Retardo_20ms                         ;subrutina de retardo de 20 milisegundos.
MOVLW d'20'                          ;mueve el valor decimal 20 al registro W (bucle exterior ~20).
MOVWF DELAY_REG1                     ;guarda el valor en DELAY_REG1.

Delay_20ms_Loop1                     ;bucle exterior de 20 milisegundos.
MOVLW D_20MS                         ;mueve la constante D_20MS (250) al registro W (bucle interior).
MOVWF DELAY_REG2                     ;guarda el valor en DELAY_REG2.

Delay_20ms_Loop2                     ;bucle interior de 20 milisegundos.
CALL Tone_Gen                        ;llama al generador de tono.
DECFSZ DELAY_REG2, F                 ;decrementa DELAY_REG2 y salta si es cero.
GOTO Delay_20ms_Loop2                ;regresa al inicio del bucle interior.
DECFSZ DELAY_REG1, F                 ;decrementa DELAY_REG1 y salta si es cero.
GOTO Delay_20ms_Loop1               ;regresa al inicio del bucle exterior.
RETURN                               ;regresa de la subrutina.

Retardo_50ms                         ;subrutina de retardo de 50 milisegundos.
MOVLW d'50'                          ;mueve el valor decimal 50 al registro W (bucle exterior ~50).
MOVWF DELAY_REG1                     ;guarda el valor en DELAY_REG1.

Delay_50ms_Loop1                     ;bucle exterior de 50 milisegundos.
MOVLW D_50MS                         ;mueve la constante D_50MS (250) al registro W (bucle interior).
MOVWF DELAY_REG2                     ;guarda el valor en DELAY_REG2.

Delay_50ms_Loop2                     ;bucle interior de 50 milisegundos.
CALL Tone_Gen                        ;llama al generador de tono.
DECFSZ DELAY_REG2, F                 ;decrementa DELAY_REG2 y salta si es cero.
GOTO Delay_50ms_Loop2                ;regresa al inicio del bucle interior.
DECFSZ DELAY_REG1, F                 ;decrementa DELAY_REG1 y salta si es cero.
GOTO Delay_50ms_Loop1               ;regresa al inicio del bucle exterior.
RETURN                               ;regresa de la subrutina.

Retardo_100ms                        ;subrutina de retardo de 100 milisegundos.
MOVLW d'100'                         ;mueve el valor decimal 100 al registro W (bucle exterior ~100).
MOVWF DELAY_REG1                     ;guarda el valor en DELAY_REG1.

Delay_100ms_Loop1                    ;bucle exterior de 100 milisegundos.
MOVLW D_100MS                        ;mueve la constante D_100MS (250) al registro W (bucle interior).
MOVWF DELAY_REG2                     ;guarda el valor en DELAY_REG2.

Delay_100ms_Loop2                    ;bucle interior de 100 milisegundos.
CALL Tone_Gen                        ;llama al generador de tono.
DECFSZ DELAY_REG2, F                 ;decrementa DELAY_REG2 y salta si es cero.
GOTO Delay_100ms_Loop2               ;regresa al inicio del bucle interior.
DECFSZ DELAY_REG1, F                 ;decrementa DELAY_REG1 y salta si es cero.
GOTO Delay_100ms_Loop1               ;regresa al inicio del bucle exterior.
RETURN                               ;regresa de la subrutina.

Retardo_200ms                        ;subrutina de retardo de 200 milisegundos.
MOVLW d'200'                         ;mueve el valor decimal 200 al registro W (bucle exterior ~200).
MOVWF DELAY_REG1                     ;guarda el valor en DELAY_REG1.

Delay_200ms_Loop1                    ;bucle exterior de 200 milisegundos.
MOVLW D_200MS                        ;mueve la constante D_200MS (250) al registro W (bucle interior).
MOVWF DELAY_REG2                     ;guarda el valor en DELAY_REG2.

Delay_200ms_Loop2                    ;bucle interior de 200 milisegundos.
CALL Tone_Gen                        ;llama al generador de tono.
DECFSZ DELAY_REG2, F                 ;decrementa DELAY_REG2 y salta si es cero.
GOTO Delay_200ms_Loop2               ;regresa al inicio del bucle interior.
DECFSZ DELAY_REG1, F                 ;decrementa DELAY_REG1 y salta si es cero.
GOTO Delay_200ms_Loop1               ;regresa al inicio del bucle exterior.
RETURN                               ;regresa de la subrutina.

Retardo_170ms                        ;subrutina de retardo de 170 milisegundos.
MOVLW d'170'                         ;mueve el valor decimal 170 al registro W (bucle exterior ~170).
MOVWF DELAY_REG1                     ;guarda el valor en DELAY_REG1.

Delay_170ms_Loop1                    ;bucle exterior de 170 milisegundos.
MOVLW D_200MS                        ;mueve la constante D_200MS (250) al registro W (bucle interior).
MOVWF DELAY_REG2                     ;guarda el valor en DELAY_REG2.

Delay_170ms_Loop2                    ;bucle interior de 170 milisegundos.
CALL Tone_Gen                        ;llama al generador de tono.
DECFSZ DELAY_REG2, F                 ;decrementa DELAY_REG2 y salta si es cero.
GOTO Delay_170ms_Loop2               ;regresa al inicio del bucle interior.
DECFSZ DELAY_REG1, F                 ;decrementa DELAY_REG1 y salta si es cero.
GOTO Delay_170ms_Loop1               ;regresa al inicio del bucle exterior.
RETURN                               ;regresa de la subrutina.
