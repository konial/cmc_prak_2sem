%include "io.inc"

section .bss
    a resd 4
    b resd 4
    c resd 4
    d resd 4

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 4, a
    GET_DEC 4, b
    GET_DEC 4, c
    GET_DEC 4, d
    
    push dword[a]
    push dword[b]
    call GCD
    
    push dword[c]
    push dword[d]
    call GCD
    
    call GCD
    
    pop eax
    
    PRINT_DEC 4, eax
    NEWLINE
    
    xor eax, eax
    ret
    
GCD:
    pop ecx
    pop ebx
    pop eax
    cycle:
        cdq
        div ebx
        mov eax, ebx
        mov ebx, edx
        cmp ebx, 0
            je finish
        jmp cycle
    finish:
        push eax
        push ecx
        ret
