;Zack Gabriel J. Valenzuela
;Assembly stack problem 3
;TEST 3.4


section .text
global _start

_start:
    mov eax, 1
    mov ebx, 2
    mov ecx, 3
    mov edx, 4

    call calculate_foo

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_foo:
    push eax
    push ebx
    push ecx
    push edx

    and eax, ebx
    or ecx, edx

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret