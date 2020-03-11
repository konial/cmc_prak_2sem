%include "io.inc"

section .bss
    n resd 4
    k resd 4

section .data
    first dd 33
    second dd 33
    ans dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 4, n
    GET_DEC 4, k
    mov eax, 1
    shl eax, 31
    xor ecx, ecx
    jmp cycle1
    L1:
        mov eax, 1
        cmp ebx, esi ; ebx - curr k, esi - max k
            jl L2
        jmp continue2
        L3:
            add dword[ans], eax
            inc ebx
            jmp L1
    L2:
        mov edi, dword[k]
        mov ecx, 0
        inc edi
        inc ecx
        mul edi
        cdq
        div ecx
        PRINT_DEC 4, eax
        NEWLINE
        cmp edi, ebx
            jg L3
        jmp L2
    cycle1:
        dec dword[first]
        mov ebx, dword[n]
        and ebx, eax
        shr eax, 1
        cmp eax, 0
            je continue1 
        cmp ebx, 0
            je cycle1
    mov edx, dword[first]
    mov dword[second], edx
    cycle2:
        dec dword[second]
        mov ebx, dword[n]
        and ebx, eax
        shr eax, 1
        cmp eax, 0
            je continue1
        cmp ebx, 0
            je cycle2
    continue1:
    mov esi, dword[first]
    sub esi, 2
    mov ebx, dword[k]
    cmp esi, ebx
        jz L1
        jg L1
    continue2:
    PRINT_DEC 4, first
    NEWLINE
    PRINT_DEC 4, second
    xor eax, eax
    ret