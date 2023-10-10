; Name: Kassidy Maberry
; Date: 2023/12/05
; Assignment: Functions Assembly

extern printf           ; Declares printf for use later
section .data
    radius dq 10.0 ; The raduis of the circle
    pi dq 3.14159 ; Pi
    two dq 2.0 ; The number 2 as a float
section .bss

section .text

    global main 

main:

    call circle     ; Calls circle function.
    
    mov rax, 60     ; Exit
    mov rdi, 0      ; Exit status
    syscall         ; Calls the above 2.


area: 
    section .data
        .fmt_area db "The area is %f", 10, 0 ; string we will be printing
    section .text

    movsd xmm0, [radius] ; Moves radius into the xmm register
    mulsd xmm0, [radius] ; Multiplies raduis by radius
    mulsd xmm0, [pi]     ; Multiplies by pi.

    push rbp    ;Prepares the print f
    mov rbp, rsp
    mov rax, 1 ; 1 xmm registers involved

    mov rdi, .fmt_area ; first argument for printf   
    ; Xmm0 is the arguement for the %f
    call printf ; call the function


    leave   ; Part of exiting the function
    ret ; breaks the function

circum:
    ; enter
    section .data
        .fmt_circum db "the circumference is %f", 10, 0 ; string we will be printing
    section .text

    

    movsd xmm0, [radius] ; Moves raduis into the xmm register.
    mulsd xmm0, [two] ;  Multiplies raduis by 2.
    mulsd xmm0, [pi] ; Multiplies by pi.

    push rbp    ; Prepares the printf
    mov rbp, rsp
    mov rax, 1 ; 1 xmm registers involved

    mov rdi, .fmt_circum ; first argument for printf   
    ; Xmm0 is the arguement for the %f
    call printf ; call the function

    leave   ; Part of exiting the function
    ret ; exits out of function


circle:  
    section .data
        .fmt_raduis db "the circle has a radius of %f", 10, 0 ; String we are printing
    section .text


    movsd xmm0, [radius]; Places raduis into the xmm register

    mov rax, 1 ; 1 xmm registers involved
    mov rdi, .fmt_raduis ; first argument for printf   
    call printf ; call the function


    call circum ; Calls circum

    call area ; calls area

    ret             ; Exits out of function
