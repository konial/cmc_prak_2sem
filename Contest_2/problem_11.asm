%include "io.inc"

section .bss
    pos resd 4
section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_STRING pos, 3
    mov eax, [pos]
    sub eax, 'A'
    PRINT_DEC , eax
    xor eax, eax
    ret