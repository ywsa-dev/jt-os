[org 0x7c00]
[BITS 16]
start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    push dx
    mov ax, 0x0003
    int 0x10
    pop dx
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov bx, 0x8000
    int 0x13
    jc disk_error
    jmp 0x0000:0x8000
disk_error:
    mov si, error_msg
print_err:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0e
    int 0x10
    jmp print_err
halt:
    cli
    hlt
error_msg db "Disk Read Error!", 0
times 510-($-$$) db 0
dw 0xaa55