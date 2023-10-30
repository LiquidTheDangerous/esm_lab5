

extern realloc
extern printf
extern putchar

section .rodata
    fmt_int db "%d", 0x0
    fmt_char db "%c",0x0
    fmt_string db "%s",0x0
    comma_string db ", ", 0x0
    lb db "{", 0x0
    rb db "}", 0xa, 0x0

section .text
    global print_long_array

    ; rdi - (qword) long*
    ; rsi - (qword) sizeof array
    print_long_array:
    push rbp
    mov rbp, rsp

    sub rsp, 0x10
    mov qword[rbp - 0x8], rdi  ; pointer to arr
    mov qword[rbp - 0x10], rsi ; sizeof arr
    xor rax, rax
    lea rdi, [lb]
    call printf

    xor rcx, rcx

    .loop:
    cmp rcx, qword[rbp - 0x10]
    jge .exit

    mov rdx, qword[rbp - 0x8]
    mov rsi, qword[rdx + rcx*8]
    lea rdi, [fmt_int]

    push rcx
    sub rsp, 8
    xor rax, rax
    call printf
    add rsp, 8
    pop rcx

    inc rcx
    cmp rcx, qword[rbp - 0x10]
    jge .false
    mov rdi, fmt_string
    mov rsi, comma_string
    push rcx
    xor rax, rax
    sub rsp, 8
    call printf
    add rsp, 8
    pop rcx
    .false:
    jmp .loop
    .exit:

    xor rax, rax
    lea rdi, [rb]
    call printf

    leave
    ret