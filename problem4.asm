section .data   
    prompt db "Enter a number: "
    prompt_len equ $ - prompt
    
    digit db '0'
    newline db 10

section .bss
    buffer resb 10

section .text 
    global _start

_start:
    ; Print the prompt
    mov ecx, prompt
    mov edx, prompt_len
    call print_string

    ; Read the input
    call read_string

    mov esi, buffer
    mov eax, 0

convert_loop:
    mov ebx, 0
    mov bl, [esi]

    cmp bl, 10
    je convert_done
    cmp bl, 13
    je convert_done

    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    
    inc esi
    jmp convert_loop

convert_done:
    mov bx, 2
    mov cx, 0

push_loop:
    mov dx, 0
    div bx
    
    push dx
    inc cx
    
    cmp ax, 0
    jne push_loop

    ; Pop and Print
pop_loop:
    pop dx
    mov al, dl
    
    push cx
    call print_digit
    pop cx
    
    dec cx
    cmp cx, 0
    jne pop_loop

    mov ecx, newline
    mov edx, 1
    call print_string

    mov eax, 1
    mov ebx, 0
    int 0x80

print_digit:
    add al, '0'
    mov [digit], al
    
    mov eax, 4
    mov ebx, 1
    mov ecx, digit
    mov edx, 1
    int 0x80
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
    mov edx, 10
    int 0x80
    ret