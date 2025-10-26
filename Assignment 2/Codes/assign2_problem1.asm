# Assignment 6: Sequential Construct-II
# Programmed By : Kunwar Arpit Singh

.data
    prompt_msg:     .asciiz "Programmed By: Kunwar Arpit Singh 22185\n\nPlease enter your first name: "
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
    
    la $t0, user_name
    
find_newline:
    lb $t1, 0($t0)
    
    beq $t1, 10, replace_newline
    beq $t1, 0, exit_loop
    
    addi $t0, $t0, 1
    j find_newline

replace_newline:
    sb $zero, 0($t0)
    
exit_loop:

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