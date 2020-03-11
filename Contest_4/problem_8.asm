%include "io.inc"

section .bss
    k resd 1
    a resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, a
    GET_UDEC 4, k
    
    mov ecx, dword[a]
    mov esi, dword[a]
    
    cycle:
    push esi
    xor esi, esi
    call COUNT
    add ecx, esi
    cmp esi, dword[k]
        jge cycle
    
    add ecx, esi
    PRINT_UDEC 4, ecx
    xor eax, eax
    
    ret
    
COUNT:
    pop ebx
    pop eax
    xor edx, edx
    div dword[k]
    add esi, edx
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