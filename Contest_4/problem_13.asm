%include "io.inc"

section .bss
    N resd 1
    K resd 1
    M resd 1
    visited resd 10
    arr resd 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, N
    GET_UDEC 4, K
    GET_UDEC 4, M
    
    mov esi, 0
    xor edx, edx
    call RECURSION
    xor eax, eax
    ret

RECURSION:
    cmp edx, dword[K]
        je exit
    xor ecx, ecx
    jmp compare
    
    continue:
    mov dword[visited + 4 * ecx], 1
    inc ecx
    mov [arr + 4 * edx], ecx
    push ecx
    inc edx
    call RECURSION 
    dec edx
    pop ecx
    dec ecx
    mov dword[visited + 4 * ecx], 0
    inc ecx
    
    compare:
    cmp ecx, dword[N]
        je exit2
    cmp dword[visited + 4 * ecx], 0
        je continue
    inc ecx
    jmp compare

    exit:
        inc esi
        push esi
        cmp esi, dword[M]
            jne exit1
        mov esi, 0
        cycle:
            cmp esi, dword[K]
                je exit1
            PRINT_DEC 4, [arr + 4 * esi]
            PRINT_CHAR ' '
            inc esi
            jmp cycle
    exit1:
    pop esi
    exit2:
    ret