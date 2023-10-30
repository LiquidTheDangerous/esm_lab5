



section .text
    ; rdi - qword signed
    global lpositive
    lpositive:
    push rbp
    mov rbp, rsp

    cmp rdi, 0
    setg al
    movzx rax, al

    leave
    ret