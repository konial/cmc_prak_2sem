%include "io.inc"

section .text

global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, ecx
    
    mov ebx, 1
    mov edx, 1
    mov esi, 1
    sal ebx, 31
    sal edx, 31
    sal esi, 31

    jmp cycle
    sw1:
        mov esi, edx
        mov edx, ebx
        mov ebx, eax
        jmp continue
    sw2:
        mov esi, edx
        mov edx, eax
        jmp continue
    sw3:
        mov esi, eax
        jmp continue
    cycle:
        GET_DEC 4, eax
        
        cmp eax, ebx
        jg sw1
        cmp eax, edx
        jg sw2
        cmp eax, esi
        jg sw3
        continue:
        ;ebx - first
        ;edx - second
        ;esi - third
        dec ECX
        jnz cycle
        
    PRINT_DEC 4, ebx
    NEWLINE
    PRINT_DEC 4, edx
    NEWLINE
    PRINT_DEC 4, esi
    NEWLINE
        
    xor eax, eax
    ret
