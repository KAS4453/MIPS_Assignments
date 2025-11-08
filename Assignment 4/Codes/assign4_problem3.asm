# Assignment 8: Iterative Construct
# Programmed By : Kunwar Arpit Singh

.data
    msg_J: .asciiz "Programmed By: Kunwar Arpit Singh \n\nFinal J: "
    msg_a: .asciiz "Final a: "
    newline: .asciiz "\n"

.text
.globl main
main:
    li $s0, 1
    
    li $s1, 0
    
loop1_start:
    li $t0, 20
    sgt $t1, $s1, $t0
    
    bne $t1, $zero, loop1_end
    
    addi $s0, $s0, 1
    
    addi $s1, $s1, 2
    
    j loop1_start
    
loop1_end:

loop2_start:
    addi $s0, $s0, 1
    
    li $t0, 100
    slt $t1, $s0, $t0
    bne $t1, $zero, loop2_start
    
loop2_end:

loop3_start:
    sgt $t1, $s1, $zero
    beq $t1, $zero, loop3_end
    
    addi $s0, $s0, -1
    
    addi $s1, $s1, -1
    
    j loop3_start
    
loop3_end:

    li $v0, 4
    la $a0, msg_J
    syscall
    
    li $v0, 1
    move $a0, $s0
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 4
    la $a0, msg_a
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall