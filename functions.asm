; Name: Kassidy Maberry
; Date: 2023/12/05
; Assignment: Functions Assembly

extern printf           ; Declares printf for use later
section .data
    radius dq 10.0
    pi dq 3.14159
    two dq 2.0
section .bss

section .text

    global main 

main:

    ; mov rdi, tes ; first argument for printf
    ; mov rsi, 50 ; second argument for printf
    ; mov rax, 0 ; no xmm registers involved

    ; call printf ; call the function

    call circle

    mov rsp, rbp
    pop rbp
    ret 
    
    mov rax, 60     ; Exit
    mov rdi, 0      ; Exit status
    syscall         ; Calls the above 2.


area: 
    section .data
    .fmt_area db "The area is %f", 10, 0 ; string we will be printing
    section .text



    ret ; breaks the function

circum:
    ; enter
    section .data
        .fmt_circum db "the circumference is %f %f", 10, 0 ; string we will be printing
    section .text

    movsd xmm0, [radius]
    movsd xmm1, [two]
    mulsd xmm0, xmm1
    mulsd xmm0, [pi]

    mov rax, 2 ; 1 xmm registers involved

    mov rdi, .fmt_circum ; first argument for printf   
    call printf ; call the function
    ret


circle:  
    section .data
        fmt_raduis db "the circle has a radius of %f", 10, 0
    section .text

    ; mov rax, [radius]

    movsd xmm0, [radius]; prepares the xmm register

    ; mov rax, 1 ; no xmm registers involved
    ; mov rdi, fmt_raduis ; first argument for printf   
    ; call printf ; call the function

    ; mov rsp, rbp
    ; pop rbp
    ; ret             ; Cleans up the printf call

    call circum

    ; call area
    ; leave
    ret             ; Cleans up the printf call.

