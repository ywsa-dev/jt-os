[org 0x8000]
[BITS 16]

start:
    mov ax, cs
    mov bl,40
    mov ds, ax
    mov ss, ax
    mov sp, 0x7c00
    mov ax,0x0013
    int 0x10
    mov ax, 0xA000
    mov es,ax
draw:
    mov ax,0x0013
    mov di,32160
    mov byte [es:di], bl
    add bx,1
    add di,1
    mov byte [es:di], bl
    jmp draw