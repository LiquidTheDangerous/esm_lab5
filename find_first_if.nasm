

section .text
global find_first_if

    ; rdi - long* pointer to array
    ; rsi - long sizeof array
    ; rdx - bool(*predicate)(long)
    find_first_if:
    push rbp
    mov rbp, rsp

    sub rsp, 0x20
    mov qword[rbp - 0x8], rdi   ; long*
    mov qword[rbp - 0x10], rsi  ; long
    mov qword[rbp - 0x18], rdx  ; predicate

    xor rcx, rcx
    .loop:
    cmp rcx, qword[rbp - 0x10]
    jge .bad_exit

    mov rdx, qword[rbp - 0x8]
    mov rdi, qword[rdx + rcx*8]
    mov r9, qword[rbp - 0x18]

    push rcx
    sub rsp, 8
    call r9
    add rsp, 8
    pop rcx

    cmp eax, 0
    jg .success_exit

    inc rcx
    jmp .loop


    .bad_exit:
    mov rax, -1
    jmp .exit

    .success_exit:
    mov rax, rcx
    .exit

    leave
    ret