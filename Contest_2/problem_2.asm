%include "io.inc"

section .bss
    A resd 4
    B resd 4
    C resd 4
    D resd 4

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, A
    GET_DEC 4, B
    GET_DEC 4, C
    GET_DEC 4, D

    mov eax, dword[A]
    mul dword[B]
    mov esi, edx
    mul dword[C]
    imul esi, dword[C]
    add edx, esi
    div dword[D]

    PRINT_DEC 4, eax

    xor eax, eax
    ret
