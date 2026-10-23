;Zack Gabriel J. Valenzuela
;Assembly stack problem 3
;TEST 3.5

section .text
global _start

_start:
    mov eax, 88
    mov ebx, 11
    mov ecx, 4
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
    mov ecx, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret