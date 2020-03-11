%include "io.inc"

section .data
    f_in db `%u`, 0
    f_out db `0x%08X\n`, 0
    a dd 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp;

    sub esp, 16
    
    cycle:
        mov dword[esp], f_in
        mov dword[esp + 4], a
        call scanf
        test eax, eax
            js exit
        mov dword[esp], f_out
        mov ecx, dword[a]
        mov dword[esp + 4], ecx
        call printf
        jmp cycle
    
    exit:
    
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
