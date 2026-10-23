;Zack Gabriel J. Valenzuela
;Assembly stack problem 3
;TEST 3.3

section .text
global _start

_start:
    mov eax, 100
    mov ebx, 50
    mov ecx, 25
    mov edx, 5

    call calculate_foo

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_foo:
    push eax
    push ebx
    push ecx
    push edx

    sub eax, ebx
    imul ecx, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret