%include "io.inc"

section .bss
    x_1 resd 4
    y_1 resd 4
    x_2 resd 4
    y_2 resd 4
    x_3 resd 4
    y_3 resd 4
    
section .data
    two dd 2
    half dd 0.5

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, x_1
    GET_DEC 4, y_1
    GET_DEC 4, x_2
    GET_DEC 4, y_2
    GET_DEC 4, x_3
    GET_DEC 4, y_3
    
    mov eax, dword[x_2]
    sub eax, dword[x_1]
    
    mov ebx, dword[y_3]
    sub ebx, dword[y_1]

    mov ecx, dword[x_3]
    sub ecx, dword[x_1]
    
    mov edx, dword[y_2]
    sub edx, dword[y_1]
    
    imul eax, ebx
    imul ecx, edx
    
    sub eax, ecx
    
    mov esi, eax
    sar esi, 31
    imul esi, eax

    add eax, esi
    add eax, esi
    
    xor edx, edx
    div dword[two]
    
    PRINT_DEC 4, eax
    PRINT_CHAR '.'
    imul edx, 5
    PRINT_DEC 4, edx

    xor eax, eax
    ret