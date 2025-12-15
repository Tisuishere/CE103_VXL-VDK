
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 0000fH   
mov bx, 0f000H     

mov cx, 0f000H   
mov dx, 0000fH     

sub bx, dx
jc carry        
jmp not_carry     

carry:
sub ax, 1         
jc carry2        
mov dl, 0         
jmp not_carry
carry2:
mov dl, 1         

not_carry:
sub ax, cx
jc carry3        
mov dl, 0         
jmp end
carry3:
mov dl, 1        

end:
push bx           
push ax          

mov bl, dl
mov ah, 2
mov dl, '0'
test bl, 1
jz zero
mov dl, '1'
zero:
int 21h

pop bx
mov cx, 16
print:
mov ah, 2
mov dl, '0'
test bx, 8000h
jz zero2
mov dl, '1'
zero2:
int 21h 
shl bx, 1
loop print

pop bx
mov cx, 16
print2:
mov ah, 2
mov dl, '0'
test bx, 8000h
jz zero3
mov dl, '1'
zero3:
int 21h
shl bx, 1
loop print2
     
ret



