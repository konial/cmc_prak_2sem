%include "io.inc"

section .bss
    k resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, k
    
    
    push 0
    cycle1:
        pop eax
        inc eax
        push eax
        push eax
        call CHECK
        pop ecx
        pop eax
        cmp ecx, eax
            jl qwe
        jmp cycle1
    
     qwe:
        dec dword[k]
        cmp dword[k], 0
            je finish
        jmp cycle1
    
    finish:
    PRINT_UDEC 4, eax
    
    pop eax
    xor eax, eax
    ret
    
CHECK:
    pop ebx
    mov ecx, 0
    push ecx
    mov esi, 0
    cycle:
        pop ecx
        inc ecx
        push ecx
        cmp ecx, eax
            je continue
        imul ecx, ecx
        cmp ecx, eax
            jle continue_cycle1
            jg continue
        continue_cycle1:
        pop ecx
        cdq
        div ecx
        pop eax
        push eax
        cmp edx, 0
            je sum
        continue_cycle2:
        push ecx
        jmp cycle
    sum:
        add esi, ecx
        push eax
        cmp ecx, 1
            je mark
        div ecx
        cmp eax, ecx
            je mark
        add esi, eax
        mark:
        pop eax
        jmp continue_cycle2
    continue:
    pop ecx
    push esi
    push ebx
    ret