;Zack Gabriel J. Valenzuela
;Assembly stack problem 3
;TEST 3.1

section .text
global _start

_start:
    mov eax, 10
    mov ebx, 20
    mov ecx, 30
    mov edx, 40

    call calculate_foo

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_foo:
    push eax
    push ebx
    push ecx
    push edx

    imul eax, ebx
    add ecx, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret