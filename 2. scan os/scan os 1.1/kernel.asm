[org 0x8000]
[BITS 16]
start:
    mov ax, 0x0003
    int 0x10
    mov ax,cs
    mov ds,ax
    mov si, msg
print:
    lodsb
    or al,al
    jz code
    mov ah,0x0e
    int 0x10
    jmp print
code:
    mov ah, 0x10
    int 0x16
    cmp al, 0x0D
    je newline
    cmp al, 0x08
    je backspace
    mov ah, 0x0e
    int 0x10
    jmp code
newline:
    mov ah, 0x0e
    mov al, 0x0A
    int 0x10
    mov al, 0x0D
    int 0x10
    jmp code
backspace:
    mov ah, 0x0e
    mov al, 0x08
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 0x08
    int 0x10
    jmp code
msg db "Welcome to scan os!", 0x0D, 0x0A, 0