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

    call circle

    ; mov rsp, rbp
    ; pop rbp
    
    mov rax, 60     ; Exit
    mov rdi, 0      ; Exit status
    syscall         ; Calls the above 2.


area: 
    section .data
    .fmt_area db "The area is %f", 10, 0 ; string we will be printing
    section .text

    movsd xmm0, [radius]
    mulsd xmm0, [radius]
    mulsd xmm0, [pi]

    push rbp
    mov rbp, rsp
    mov rax, 1 ; 1 xmm registers involved

    mov rdi, .fmt_area ; first argument for printf   
    call printf ; call the function



    ret ; breaks the function

circum:
    ; enter
    section .data
        .fmt_circum db "the circumference is %f", 10, 0 ; string we will be printing
    section .text


    movsd xmm0, [radius]
    mulsd xmm0, [two]
    mulsd xmm0, [pi]

    push rbp
    mov rbp, rsp
    mov rax, 1 ; 1 xmm registers involved

    mov rdi, .fmt_circum ; first argument for printf   
    call printf ; call the function

    ret ; exits out of function


circle:  
    section .data
        .fmt_raduis db "the circle has a radius of %f", 10, 0
    section .text


    movsd xmm0, [radius]; prepares the xmm register

    mov rax, 1 ; no xmm registers involved
    mov rdi, .fmt_raduis ; first argument for printf   
    call printf ; call the function


    call circum

    call area
    ret             ; Exits out of function

