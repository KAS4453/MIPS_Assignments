# Assignment 6: Sequential Construct-II
# Problem 3
# Programmed By : Kunwar Arpit Singh

.data
    prompt: .asciiz "Programmed By: Kunwar Arpit Singh\nEnter a 3-character string: "
    message: .asciiz "\nThe 2nd char in the string: "
    buffer: .space 5

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 8
    la $a0, buffer
    li $a1, 5
    syscall

    li $v0, 4
    la $a0, message
    syscall

    la $t0, buffer
    lbu $a0, 1($t0)
    
    li $v0, 11
    syscall
    
    li $v0, 10
    syscall