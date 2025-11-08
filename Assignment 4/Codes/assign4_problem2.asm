# Assignment 8: Iterative Construct
# Programmed By : Kunwar Arpit Singh

.data
    prompt: .asciiz "Programmed By: Kunwar Arpit Singh \n\nEnter a number: "
    newline: .asciiz "\n"

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0
    
countdown_loop:
    sgt $t0, $s0, $zero
    beq $t0, $zero, exit
    
    li $v0, 1
    move $a0, $s0
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    addi $s0, $s0, -1
    
    j countdown_loop
    
exit:
    li $v0, 10
    syscall