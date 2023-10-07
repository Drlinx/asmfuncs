; Name: Kassidy Maberry
; Date: 2023/12/05
; Assignment: Functions Assembly

extern printf           ; Declares printf for use later
section .data
    number dq 5         ;The number we are finding the factorial of .
    msg db "The factorial of 5 is %ld", 10, 0   ;The message we will print.
section .bss

section .text

    global main 

main:

    push rbp            ; Initiates the printf call.
    mov rbp, rsp
    mov rdi, msg        ; The string.
    mov rsi, rax        ; The result of 5!.
    mov rax, 0          ; Print out to the terminal.

    call printf         ; Calls printf.
    mov rsp, rbp
    pop rbp
    ret             ; Cleans up the printf call.

    mov rax, 60     ; Exit
    mov rdi, 0      ; Exit status
    syscall         ; Calls the above 2.