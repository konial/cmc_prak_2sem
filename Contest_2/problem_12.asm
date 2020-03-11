%include "io.inc"

section .bss
    number resd 4
    
section .data
    arr1 db '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'
    arr2 db 'S', 'C', 'D', 'H'

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, number
    mov eax, dword[number]
    sub eax, 1
    mov ebx, 13
    xor edx, edx
    div ebx
    PRINT_CHAR [arr1 + edx]
    PRINT_CHAR [arr2 + eax]
    xor eax, eax
    ret