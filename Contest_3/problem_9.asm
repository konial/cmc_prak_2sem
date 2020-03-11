%include "io.inc"

section .data
    left dd 10000
    right dd -10000
    up dd -10000
    down dd 10000

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ecx, 4
    jmp cycle
    L:
        mov dword[left], eax
        jmp continue_x
    R:
        mov dword[right], eax
        jmp continue_x
    U:
        mov dword[up], ebx
        jmp continue_y
    D:
        mov dword[down], ebx
        jmp continue_y
    cycle:
        GET_DEC 4, eax
        GET_DEC 4, ebx
        cmp eax, dword[left]
        jl L
        cmp eax, dword[right]
        jg R
        continue_x:
        cmp ebx, dword[up]
        jg U
        cmp ebx, dword[down]
        jl D
        continue_y:
        dec ecx
        jnz cycle
    GET_DEC 4, eax
    GET_DEC 4, ebx
    cmp eax, dword[left]
        jz exit
        jl exit
    cmp eax, dword[right]
        jz exit
        jg exit
    cmp ebx, dword[up]
        jz exit
        jg exit
    cmp ebx, dword[down]
        jz exit
        jl exit
    PRINT_STRING 'YES'
    xor eax, eax
    ret
    exit:
        PRINT_STRING 'NO'
    xor eax, eax
    ret