%include "io.inc"

section .bss
    n resd 4
 
section .data
    ans dd 1

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, n
    mov ebx, 2
    jmp cycle
    move:
        mov dword[ans], eax
        jmp exit
    cycle:
        cdq
        mov eax, dword[n]
        div ebx
        cmp edx, 0
        je move
        inc ebx
        mov edi, ebx
        imul edi, edi
        cmp edi, dword[n]
        jz cycle
        jl cycle
        
    exit:
    PRINT_DEC 4, ans
    xor eax, eax
    ret