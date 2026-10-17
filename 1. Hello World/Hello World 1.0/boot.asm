[org 0x7c00]
[BITS 16]
start:
    xor ax,ax
    mov ds,ax
    mov es,ax
    mov ss, ax
    mov sp, 0x7c00
    mov si,msg
    mov ah, 0x00
    mov al, 0x03
    int 0x10
code:
    lodsb
    or al,al
    jz final
    mov ah, 0x0E
    int 0x10
    jmp code
final:
    jmp $
msg db "Hello world!", 0
times 510-($-$$) db 0
dw 0xaa55