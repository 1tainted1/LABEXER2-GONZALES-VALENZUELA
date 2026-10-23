;Zack Gabriel J. Valenzuela
;Assembly stack problem 3
;TEST 3.2

section .text
global _start

_start:
    mov eax, 5
    mov ebx, 5
    mov ecx, 10
    mov edx, 2

    call calculate_foo

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_foo:
    push eax
    push ebx
    push ecx
    push edx

    xor edx, edx
    div ebx
    add ecx, eax

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret