%include "io.inc"

section .bss
    s1 resb 1001
    s2 resb 1001
    len1 resd 1
    len2 resd 1

section .data
    f_in db `%s`, 0
    f_out1 db `%d %d`, 0
    f_out2 db `%d`, 0

section .text
global CMAIN
CEXTERN strlen
CMAIN:
    ;write your code here
    push ebp
    mov ebp, esp
    sub esp, 16
    mov dword[esp], f_in
    mov dword[esp + 4], s1
    call scanf
    mov dword[esp + 4], s2
    call scanf

    mov dword[esp], s1
    call strlen
    mov dword[len1], eax
    mov dword[esp], s2
    call strlen
    mov dword[len2], eax
    
    mov eax, dword[len1]
    mov ebx, dword[len2]
    cmp eax, ebx
        jge swp
    mov ecx, 2
    jmp continue
    swp:
        mov ecx, 1
    
    continue:
    call SEARCH
    mov eax, dword[esp]
    mov ebx, dword[esp + 4]
    cmp eax, 0
        je q2
    q1:
        mov dword[esp], f_out1
        mov dword[esp + 4], eax
        mov dword[esp + 8], ebx
        call printf
        jmp eee
    
    q2:
        mov dword[esp], f_out2
        mov dword[esp + 4], eax
        call printf
    
    eee:    
    
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
    
SEARCH:
    mov edx, 0
    mov esi, 0
    cmp ecx, 2
        je cycle2
    cycle:
        mov al, byte[s1 + edx]
        mov bl, byte[s2 + esi]
        cmp al, bl
            je qwe
        inc edx
        mov esi, 0
        jmp contin
        qwe:
            inc edx
            inc esi
        contin:
        cmp esi, dword[len2]
            je yes
        cmp edx, dword[len1]
            je no
        jmp cycle
    yes:
    mov dword[esp + 4], 2
    mov dword[esp + 8], 1
    ret
    no:
    mov dword[esp + 4], 0
    ret
    
    cycle2:
        mov al, byte[s1 + edx]
        mov bl, byte[s2 + esi]
        cmp al, bl
            je qwe2
        inc esi
        mov edx, 0
        jmp contin2
        qwe2:
            inc edx
            inc esi
        contin2:
        cmp edx, dword[len1]
            je yes2
        cmp esi, dword[len2]
            je no2
        jmp cycle2
    yes2:
    mov dword[esp + 4], 1
    mov dword[esp + 8], 2
    ret
    no2:
    mov dword[esp + 4], 0
    ret