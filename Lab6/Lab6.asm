
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data 
a      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1   
b      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   
temp   db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
msg    db 'Nhap so luong so fibo: $'   

.code  
start:   
    mov ax, @data
    mov ds, ax
    mov ah, 09h            
    lea dx, msg
    int 21h 
    
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al
    
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al
     
    mov al, bl
    mov ah, 0
    mov cl, 10
    mul cl
    add al,bh
    adc ah, 0
    mov cx, ax

    dec cx 
    
    call xuongdong       
    call print_arr
    call xuongdong

fibo:    
    call temp_a
    call add_2_array
    call b_temp
    call print_arr
    call xuongdong
    loop fibo

ret

temp_a proc 
    push cx
    mov cx, 10
    t_a: 
        mov si, cx 
        mov bl, a[si]
        mov temp[si], bl
        loop t_a
    pop cx
    ret
temp_a endp

b_temp proc 
    push cx
    mov cx, 10
    b_t: 
        mov si, cx 
        mov bl, temp[si]
        mov b[si], bl
        loop b_t
    pop cx
    ret
b_temp endp

add_2_array proc
    push cx
    mov cx, 10
    mov ax, 0             
    cong:     
        mov bl, 0
        mov si, cx
        add bl, al         
        add bl, a[si]
        add bl, b[si] 
        mov ah, 0
        mov al, bl
        mov bl, 10
        div bl            
        mov a[si], ah
        loop cong
    pop cx
    ret
add_2_array endp     

print_arr proc
    push cx
    mov cx, 10
    mov si, 1
    pri:
        mov dl, a[si]
        add dl, 48
        mov ah, 2
        int 21h   
        inc si
        loop pri
    pop cx
    ret
print_arr endp 

xuongdong proc
    mov ah, 2
    mov dl, 0ah    
    int 21h 
    mov dl, 0dh    
    int 21h
    ret
xuongdong endp





