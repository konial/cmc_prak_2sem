%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, eax
    
    xor ecx, ecx
    
    push eax
    call COUNT
    
    PRINT_DEC 4, ecx
    
    xor eax, eax
    ret
    
COUNT:
    jmp continue1
    increment:
        inc ecx
        jmp continue2
    continue1:
    pop ebx
    pop eax
    mov esi, 3
    xor edx, edx
    div esi
    cmp edx, 1
        je increment
    cmp edx, -1
        je increment
    continue2:
    push ebx
    push eax
    cmp eax, 0
        je exit1
    call COUNT
    jmp exit2
    exit1:
        pop eax
    exit2:
    ret