BITS 16
ORG 0

jmp 0x7c0:start
start:
        cli ; clear Interrupts
        mov ax, 0x7c0
        mov ds, ax
        mov es, ax
        mov ax, 0x00
        mov ss, ax
        mov sp, 0x7c00
        sti
        mov ah, 0eh
        mov si, message
print:
        mov al, [si]
        cmp al, 0
        je done
        int 0x10
        inc si
        jmp print
done:
        cli
        hlt
message:
        db "Hello, world!", 0
times 510-($ - $$) db 0
dw 0xAA55
