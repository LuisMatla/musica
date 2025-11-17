;Contreras Matla Luis Fernando (S21020225).
;García Velandia Samuel Obed (S21002413).
;Practica 10. Generador de melodías.

__CONFIG _WDT_OFF & _PWRTE_ON & _XT_OSC & _LVP_OFF & _CP_OFF ;configura los fusibles del microcontrolador.
LIST P=16F877A                     ;especifica el microcontrolador a usar (PIC16F877A).
#include "P16F877A.INC"            ;incluye el archivo de definiciones del PIC16F877A.

ORG 0x00                           ;establece el origen del programa en la dirección 0x00 (vector de reset).
GOTO Inicio                        ;salta a la etiqueta Inicio al iniciar el programa.
ORG 0x04                           ;establece el origen en 0x04 (vector de interrupción externa).
GOTO MELODIA2                      ;salta a la rutina MELODIA2 cuando se presiona el pulsador (vector de interrupción).

Inicio                              ;etiqueta de inicio del programa.
BSF STATUS, RP0                    ;pone en 1 el bit RP0 del registro STATUS (selecciona banco 1).
BCF STATUS, RP1                    ;pone en 0 el bit RP1 del registro STATUS (banco 1).
MOVLW b'00000001'                  ;mueve el valor binario 00000001 (1 decimal) al registro W.
MOVWF TRISB                        ;configura PORTB como entrada parcial (RB0 como entrada, resto como salida).
MOVLW b'00000000'                  ;mueve el valor binario 00000000 (0 decimal) al registro W.
MOVWF TRISD                        ;configura PORTD como salida (todos los bits como salida).
BCF OPTION_REG, 6                  ;configura RB0 para interrupción por flanco ascendente.
BCF STATUS, RP0                    ;pone en 0 el bit RP0 del registro STATUS (regresa al banco 0).
MOVLW b'10010000'                  ;mueve el valor binario 10010000 (144 decimal) al registro W.
MOVWF INTCON                       ;habilita interrupciones globales y por RB0/INT.
CLRF PORTB                         ;apaga todos los bits del PORTB.
CLRF PORTD                         ;apaga todos los bits del PORTD.

principal                           ;etiqueta del bucle principal.
GOTO melodia1                      ;salta a la subrutina melodia1.
GOTO principal                      ;regresa al inicio del bucle principal (esta línea nunca se ejecuta).

melodia1                            ;subrutina de la primera melodía.
CALL Parte1_Melodia                ;llama a la primera parte de la melodía.
;===== 0:24 ======                 ;marca de tiempo 0:24.
CALL Parte1_Melodia                ;llama nuevamente a la primera parte de la melodía.
;===== 0:36 ======                 ;marca de tiempo 0:36.
CALL Parte2_Melodia                ;llama a la segunda parte de la melodía.
;===== 0:50 =======                ;marca de tiempo 0:50.
CALL Parte3_Melodia                 ;llama a la tercera parte de la melodía.
GOTO FIN                            ;salta a la etiqueta FIN (regresar al bucle principal).

Parte3_Melodia                      ;subrutina de la tercera parte de la melodía.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos (aproximado con Retardo_100ms + Retardo_50ms + Retardo_20ms).
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOLB_7OCT                     ;reproduce la nota Sol bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LAS_7OCT                      ;reproduce la nota La sostenido de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL REB_7OCT                      ;reproduce la nota Re bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL REB_7OCT                      ;reproduce la nota Re bemol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
RETURN                             ;regresa de la subrutina.

Parte1_Melodia                      ;subrutina de la primera parte de la melodía.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL SOLB_7OCT                     ;reproduce la nota Sol bemol de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
CALL Retardo_50ms                  ;llama a la subrutina de delay de 50 milisegundos.
CALL Retardo_20ms                  ;llama a la subrutina de delay de 20 milisegundos.
CALL Retardo_1ms                   ;llama a la subrutina de delay de 1 milisegundo.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_100ms                 ;llama a la subrutina de delay de 100 milisegundos.
RETURN                             ;regresa de la subrutina.

Parte2_Melodia                      ;subrutina de la segunda parte de la melodía.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOLB_7OCT                     ;reproduce la nota Sol bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL REB_7OCT                      ;reproduce la nota Re bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FAS_7OCT                      ;reproduce la nota Fa sostenido de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DOS_7OCT                      ;reproduce la nota Do sostenido de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DOS_7OCT                      ;reproduce la nota Do sostenido de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DOS_7OCT                      ;reproduce la nota Do sostenido de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOLB_7OCT                     ;reproduce la nota Sol bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL REB_7OCT                      ;reproduce la nota Re bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL REB_7OCT                      ;reproduce la nota Re bemol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL FAS_7OCT                      ;reproduce la nota Fa sostenido de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SI_7OCT                       ;reproduce la nota Si de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOLB_7OCT                     ;reproduce la nota Sol bemol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
RETURN                             ;regresa de la subrutina.

MELODIA2                            ;rutina de servicio de interrupción - THE BEATLES - LET IT BE.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
;2da vez                          ;marca para segunda repetición.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL LA_7OCT                       ;reproduce la nota La de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL SOL_7OCT                      ;reproduce la nota Sol de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_170ms                 ;llama a la subrutina de delay de 170 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL FA_7OCT                       ;reproduce la nota Fa de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL MI_7OCT                       ;reproduce la nota Mi de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL RE_7OCT                       ;reproduce la nota Re de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL DO_7OCT                       ;reproduce la nota Do de la séptima octava.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
CALL Retardo_200ms                 ;llama a la subrutina de delay de 200 milisegundos.
BCF INTCON, INTF                   ;limpia el flag de interrupción externa.
RETFIE                             ;retorna de la interrupción habilitando las interrupciones.

#include "NotasMusicales.inc"      ;incluye el archivo de definiciones de notas musicales.

FIN                                 ;etiqueta de fin del programa.
GOTO FIN                            ;bucle infinito (el programa termina aquí).

END                                ;fin del programa.

