# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.data
    prompt1:  .asciiz "Programmed By: Kunwar Arpit Singh 22185\n\nEnter first 2-char string: "
    prompt2:  .asciiz "\nEnter second 2-char string: "
    result:   .asciiz "\nHamming distance: "
    
    buffer1:  .space 3
    buffer2:  .space 3

.text
.globl main
main:

    li $t0, 0
    
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 8
    la $a0, buffer1
    li $a1, 3
    syscall
    
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 8
    la $a0, buffer2
    li $a1, 3
    syscall
    

    la $t1, buffer1
    la $t2, buffer2
    
    lbu $t3, 0($t1) 
    lbu $t4, 0($t2)

    sne $t5, $t3, $t4
    add $t0, $t0, $t5
    
    lbu $t3, 1($t1) 
    lbu $t4, 1($t2)
    
    sne $t5, $t3, $t4
    add $t0, $t0, $t5
    
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1 
    move $a0, $t0
    syscall
    
    li $v0, 10
    syscall