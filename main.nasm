



extern print_long_array ; void(*)(long*, long)
extern find_first_if    ; int(*)(long*, long, int(*predicate)(long))
extern lpositive        ; int(*)(long)
extern stdio_array      ; struct {long, long} (*)(void)

extern printf
extern free



section .rodata
    message_result db "result: %ld", 0xa, 0x0
section .text
    global main
    main:
    push rbp
    mov rbp, rsp

    sub rsp, 0x10

    call stdio_array

    mov qword[rbp - 0x8], rax   ; pointer
    mov qword[rbp - 0x10], rdx  ; size

    mov rdi, qword[rbp - 0x8]
    mov rsi, qword[rbp - 0x10]
    call print_long_array

    mov rdi, qword[rbp - 0x8]
    mov rsi, qword[rbp - 0x10]
    mov rdx, lpositive
    call find_first_if

    mov rsi, rax
    lea rdi, [message_result]
    call printf

    mov rdi, qword[rbp - 0x8]
    call free

    leave
    ret