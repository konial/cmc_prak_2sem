%include "io.inc"

section .bss
    month resd 4
    day resd 4
    
section .data
    first dd 41
    both dd 83
    two dd 2

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, month
    GET_DEC 4, day

    mov eax, dword[month]
    sub eax, 1
    xor edx, edx
    div dword[two]
    mov esi, edx
    mul dword[both]
    imul esi, dword[first]
    add eax, esi
    add eax, dword[day]

    PRINT_DEC 4, eax

    xor eax, eax
    ret