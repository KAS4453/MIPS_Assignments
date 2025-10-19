# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.data
    prompt_msg:     .asciiz "Please enter your first name: "
    greeting_start: .asciiz "Hi "
    greeting_end:   .asciiz ", MIPS assembly programming is very exciting to learn"
    user_name:      .space 20

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_msg
    syscall

    li $v0, 8
    la $a0, user_name
    li $a1, 20
    syscall

    li $v0, 4
    la $a0, greeting_start
    syscall

    li $v0, 4
    la $a0, user_name
    syscall
    
    li $v0, 4
    la $a0, greeting_end
    syscall

    li $v0, 10
    syscall