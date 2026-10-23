;Zack Gabriel J. Valenzuela
;Assembly stack problem 3
;TEST 3.6

section .text
global _start

_start:
    mov eax, 0
    mov ebx, 15
    mov ecx, 15
    mov edx, 0

    call calculate_foo

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_foo:
    push eax
    push ebx
    push ecx
    push edx

    add eax, ebx
    sub ecx, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret