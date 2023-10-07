; Name: Kassidy Maberry
; Date: 2023/12/05
; Assignment: Functions Assembly

extern printf           ; Declares printf for use later
section .data
    radius db 10
    pi dq 3.14159
section .bss

section .text

    global main 

main:

    call circle

    mov rax, 60     ; Exit
    mov rdi, 0      ; Exit status
    syscall         ; Calls the above 2.


area: 
    section .data
    .fmt_area db "The area is %f", 10, 0 ; string we will be printing
    section .text
    push rbp            ; Initiates the printf call.
    mov rbp, rsp
    mov rdi, .fmt_area        ; The string.
    mov rsi, rax        ; The result of .
    mov rax, 0          ; Print out to the terminal.

    call printf         ; Calls printf.
    mov rsp, rbp
    pop rbp
    ret             ; Cleans up the printf call.

circum:
    section .data
    .fmt_circum db "the circumference is %f" 10 0
    section .text


circle:
    section .data
    fmt_raduis db "the circle has a radius of %f" 10 0
    section .text
    push rbp            ; Initiates the printf call.
    mov rbp, rsp
    mov rdi, .fmt_area        ; The string.
    mov rsi, [radius]        ; The radius.
    mov rax, 0          ; Print out to the terminal.

    call printf         ; Calls printf.
    mov rsp, rbp
    pop rbp
    ret             ; Cleans up the printf call.