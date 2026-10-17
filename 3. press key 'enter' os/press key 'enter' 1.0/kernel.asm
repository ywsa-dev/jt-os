[org 0x8000]
[BITS 16]
start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    mov si, msg
    call clear
print:
    lodsb
    or al, al
    jz code
    mov ah, 0x0E
    int 0x10
    jmp print
code:
    mov ah, 0x10
    int 0x16
    cmp al, 0x0D
    je enter
    cmp al, 0x63
    je ckey
    jmp code
enter:
    mov ah, 0x0E
    mov al, 'E'
    int 0x10
    mov al, 'n'
    int 0x10
    mov al, 't'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, '!'
    int 0x10
    call newline
    jmp code
clear:
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    ret
newline:
    mov ah, 0x0E
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    ret
ckey:
    call clear
    jmp code
msg db "press enter key.", 0x0d, 0x0a, "press c key to clear screen!", 0x0d, 0x0a, 0