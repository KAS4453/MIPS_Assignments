# Assignment 8: Iterative Construct
# Programmed By : Kunwar Arpit Singh

.data
    prompt: .asciiz "Programmed By: Kunwar Arpit Singh \n\nEnter k: "
    newline: .asciiz "\n"
    space:   .asciiz " "
.text
.globl main
main:
    
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0
    
    li $s1, 1
    
outer_loop_start:
    sgt $t0, $s1, $s0
    bne $t0, $zero, exit

    li $s3, 0
    sub $t1, $s0, $s1

space_loop_start:
    bge $s3, $t1, inner_loop_1_start
    
    li $v0, 4
    la $a0, space
    syscall
    
    addi $s3, $s3, 1
    j space_loop_start

inner_loop_1_start:
    li $s2, 1

inner_loop_1:
    sgt $t0, $s2, $s1
    bne $t0, $zero, inner_loop_2_start
    
    li $v0, 1
    move $a0, $s2
    syscall
    
    addi $s2, $s2, 1
    
    j inner_loop_1
    
inner_loop_2_start:
    addi $s2, $s1, -1   # j = i - 1
    
inner_loop_2:
    slt $t0, $s2, 1     # $t0 = (j < 1)
    bne $t0, $zero, print_newline
    
    li $v0, 1
    move $a0, $s2
    syscall
    
    addi $s2, $s2, -1
    
    j inner_loop_2
    
print_newline:
    li $v0, 4
    la $a0, newline
    syscall
    
    addi $s1, $s1, 1    # i++
    
    j outer_loop_start
    
exit:
    li $v0, 10
    syscall