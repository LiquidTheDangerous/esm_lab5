

extern printf
extern scanf
extern malloc

section .data
    message db "enter sizeof array: ", 0xa, 0x0
    message_enter_arri db "array[%ld]=",0x0
    scan_int db "%ld", 0x0

section .text
    ; returns
    ; rax - pointer to array
    ; rdx - sizeof array
    global stdio_array
    stdio_array:
    push rbp
    mov rbp, rsp

    sub rsp, 0x20

    xor rax, rax
    lea rdi, [message]
    call printf

    xor rax, rax
    lea rdi, [scan_int]
    lea rsi, qword[rbp - 0x8]
    call scanf

    mov rax, qword[rbp - 0x8]
    mov rdx, 0x8
    mul rdx
    mov rdi, rax
    call malloc
    mov qword[rbp - 0x10], rax
;    mov rdx, qword[rbp - 0x8]

    xor rcx, rcx

    .loop:
    cmp rcx, qword[rbp - 0x8]
    jge .exit_loop

    push rcx
    sub rsp, 0x8

    xor rax, rax
    lea rdi, [message_enter_arri]
    mov rsi, rcx
    call printf

    xor rax, rax
    lea rdi, [scan_int]
    lea rsi, qword[rbp - 0x18]
    call scanf


    add rsp, 0x8
    pop rcx

    mov rsi, qword[rbp - 0x18]
    mov rdx, qword[rbp - 0x10]
    mov qword[rdx + rcx*8], rsi


    inc rcx
    jmp .loop
    .exit_loop:

    mov rax, qword[rbp - 0x10]
    mov rdx, qword[rbp - 0x8]

    leave
    ret