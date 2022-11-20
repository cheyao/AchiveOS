section .text
bits 64
extern main
global _start
_start:
    call clear_screen
    call main

    jmp $

global clear_screen
clear_screen:
    mov rdi, 0xB8000
    mov rax, 0x0F200F200F200F20 ; Clear screen :)
    mov rcx, 500
    rep stosq

    ret

global call_detect
call_detect:
    push bx
    mov di, 0x500
    xor bx, bx
    mov edx, 0x534D4150
    mov rax, 0xE820
    int 0x15
    pop bx
    ret