%include "io.inc"

section .bss
    a_11 resd 4
    a_12 resd 4
    a_21 resd 4
    a_22 resd 4
    b_1 resd 4
    b_2 resd 4

section .data
    x dd 0
    y dd 0

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_UDEC 4, a_11
    GET_UDEC 4, a_12
    GET_UDEC 4, a_21
    GET_UDEC 4, a_22
    GET_UDEC 4, b_1
    GET_UDEC 4, b_2
    
    ;calculate y
    mov eax, dword[b_1]
    and eax, dword[a_21]
    
    mov ebx, dword[b_2]
    and ebx, dword[a_11]
    
    xor eax, ebx
    add dword[y], eax
    
    mov eax, dword[b_1]
    or eax, dword[b_2]
    
    ;det[A]
    mov ebx, dword[a_11]
    and ebx, dword[a_22]
    mov ecx, dword[a_12]
    and ecx, dword[a_21]
    xor ebx, ecx
    not ebx

    and eax, ebx
    or dword[y], eax
    
    ;calculate x
    mov eax, dword[b_1]
    
    mov ebx, dword[a_12]
    and ebx, dword[y]
    
    xor eax, ebx
    and eax, dword[a_11]
    add dword[x], eax
    
    mov eax, dword[b_2]
    
    mov ebx, dword[a_22]
    and ebx, dword[y]
    
    xor eax, ebx
    and eax, dword[a_21]
    or dword[x], eax
    
    PRINT_UDEC 4, x
    NEWLINE
    PRINT_UDEC 4, y

    xor eax, eax
    ret