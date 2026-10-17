[org 0x8000]
[BITS 16]
start:
    mov ax, 0x0003
    int 0x10
    mov ax, 0xB800
    mov es, ax
    mov ax, cs
    mov ds, ax
    mov si, msg
    xor di, di
print:
    lodsb
    or al, al
    jz hang
    mov [es:di], al
    mov byte [es:di+1], 0x0C
    add di, 2
    jmp print
msg db "Hello kernel!!!", 0x0D, 0x0A, 0
hang:
    jmp $