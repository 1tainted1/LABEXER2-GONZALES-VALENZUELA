;Zack Gabriel J. Valenzuela
;Assembly stack problem 5
;TEST 5.6

section .data
    source_array    dd 3, 1, 4, 1, 5
    array_len       equ 5

section .bss
    dest_array      resd 5

section .text
global _start

_start:
    mov ecx, array_len
    mov esi, source_array

push_loop:
    mov eax, [esi]
    push eax
    add esi, 4
    loop push_loop

    mov ecx, array_len
    mov edi, dest_array
    xor eax, eax

pop_loop:
    pop edx
    mov [edi], edx
    add eax, edx
    add edi, 4
    loop pop_loop

    mov ebx, eax
    mov eax, 1
    int 0x80