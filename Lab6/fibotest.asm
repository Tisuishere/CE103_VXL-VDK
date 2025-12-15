
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
;Code for Program to Print the Fibonacci series in Assembly Language

ORG 1000H
MOV SI, 1100H
MOV CL, [SI]
INC SI
MOV AL, 00H
MOV [SI], AL
INC SI
INC AL
MOV [SI], AL
SUB CL, 02H
FIBOO:
DEC SI
MOV AL, [SI]
INC SI
MOV BL, [SI]
ADD AL, BL
INC SI
MOV [SI], AL
LOOP FIBOO