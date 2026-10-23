;Zack Gabriel J. Valenzuela
;Assembly stack problem 2
;Test 2.4

section .data
    expr        db "((X))", 0

section .text
global _start

_start:
    mov esi, expr
    xor ecx, ecx

check_loop:
    mov al, [esi]
    test al, al
    jz check_done

    cmp al, '('
    je found_opening

    cmp al, ')'
    je found_closing

    jmp next_char

found_opening:
    push dword 1
    inc ecx
    jmp next_char

found_closing:
    cmp ecx, 0
    jle unbalanced
    
    pop eax
    dec ecx
    jmp next_char

next_char:
    inc esi
    jmp check_loop

check_done:
    cmp ecx, 0
    jne unbalanced

balanced:
    mov eax, 1
    jmp exit_prog

unbalanced:
    mov eax, 0

exit_prog:
    mov ebx, eax
    mov eax, 1
    int 0x80