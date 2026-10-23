section .data
    prompt db "Enter a string: "
    prompt_len equ $ - prompt
    
    msg_rev db "Reversed: "
    msg_rev_len equ $ - msg_rev

    newline db 10

section .bss
    buffer resb 100
    length resd 1

section .text
    global _start

_start:
    mov ecx, prompt
    mov edx, prompt_len
    call print_string

    call read_string
    dec eax
    mov [length], eax
    mov byte [buffer + eax], 0

    call reverse_string

    mov ecx, msg_rev
    mov edx, msg_rev_len
    call print_string

    mov ecx, buffer
    mov edx, [length]
    call print_string

    mov ecx, newline
    mov edx, 1
    call print_string

    mov eax, 1
    xor ebx, ebx
    int 0x80

reverse_string:
    mov esi, buffer
    mov ecx, [length]

push_loop:
    cmp ecx, 0
    je pop_start
    
    xor eax, eax
    mov al, [esi]
    push eax
    inc esi
    dec ecx
    jmp push_loop

pop_start:
    mov edi, buffer
    mov ecx, [length]

pop_loop:
    cmp ecx, 0
    je done_rev
    
    pop eax
    mov [edi], al
    inc edi
    dec ecx
    jmp pop_loop

done_rev:
    ret

print_string:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

read_string:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 100
    int 0x80
    ret