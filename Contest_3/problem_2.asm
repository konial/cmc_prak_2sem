%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_UDEC 4, eax
    mov ecx, 32
    mov ebx, 1
    xor edi, edi
    jmp cycle
    cnt:
        inc edi
        jmp continue
    cycle:
        mov esi, eax
        and esi, ebx
        cmp esi, 0
        jne cnt
        continue:
        sal ebx, 1
        dec ecx
        jnz cycle
        
    PRINT_DEC 4, edi
    xor eax, eax
    ret