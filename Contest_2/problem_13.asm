%include "io.inc"

section .bss
    c resd 1

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_CHAR c
    mov eax, dword[c]
    GET_CHAR c
    mov ebx, dword[c]
    GET_CHAR c
    GET_CHAR c
    sub eax, dword[c]
    GET_CHAR c
    sub ebx, dword[c]

    mov esi, eax
    mov edi, ebx
    sar esi, 31
    sar edi, 31
    imul esi, eax
    imul edi, ebx

    add eax, esi
    add eax, esi
    add ebx, edi
    add ebx, edi
    add eax, ebx

    PRINT_DEC 4, eax

    xor eax, eax
    ret