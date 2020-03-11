%include "io.inc"

section .rodata
    name_r db `input.txt`, 0
    name_w db `output.txt`, 0

section .bss
    a resd 1000
    val resd 1
    file_r resd 1
    file_w resd 1

section .data
    b dd 4
    f_in db `%d`, 0
    f_out db `%d `, 0
    f_r db `r`, 0
    f_w db `w`, 0

section .text
CEXTERN qsort
CEXTERN fopen
CEXTERN fclose
CEXTERN fscanf
CEXTERN fprintf

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp;
    
    sub esp, 16
    mov dword[esp], name_r
    mov dword[esp + 4], f_r
    call fopen
    mov dword[file_r], eax
    
    mov dword[esp], name_w
    mov dword[esp + 4], f_w
    call fopen
    mov dword[file_w], eax
    
    mov ebx, dword[file_r]
    mov dword[esp], ebx
    mov dword[esp + 4], f_in
    mov dword[esp + 8], val
    xor ecx, ecx
    
    read:
        mov dword[esp + 12], ecx
        call fscanf
        mov ecx, dword[esp + 12]
        test eax, eax
            js quit
        mov ebx, dword[val]
        mov dword[a + 4 * ecx], ebx
        inc ecx
        jmp read
    
    quit:
    cmp ecx, 0
        je exit

    mov ebx, dword[b]
    mov dword[esp], a
    mov dword[esp + 4], ecx
    mov dword[esp + 8], ebx
    mov dword[esp + 12], COMP
    call qsort
    mov esi, dword[esp + 4]
    
    mov ebx, dword[file_w]
    mov dword[esp], ebx
    mov dword[esp + 4], f_out
    xor ecx, ecx
    
    write:
        mov ebx, dword[a + 4 * ecx]
        mov dword[esp + 8], ebx
        mov dword[esp + 12], ecx
        call fprintf
        mov ecx, dword[esp + 12]
        inc ecx
        cmp ecx, esi
            je exit
        jmp write
    
    exit:
        
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret

COMP:
    mov eax, dword[esp + 4]
    mov eax, dword[eax]
    mov edx, dword[esp + 8]
    mov edx, dword[edx]
    
    cmp eax, 0
        jg sec
    jmp sec2
    sec:
        cmp edx, 0
            jg kek
    jmp gre
    sec2:
        cmp edx, 0
            jl kek
    low:
        mov eax, 0
        sub eax, 1
    jmp ex
    gre:
        mov eax, 0
        add eax, 1
    jmp ex
    kek:
    sub eax, edx
    ex:
    ret