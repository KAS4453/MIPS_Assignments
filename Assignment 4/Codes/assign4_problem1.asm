# Assignment 8: Iterative Construct
# Programmed By : Kunwar Arpit Singh

.data
    prompt:     .asciiz "Programmed By: Kunwar Arpit Singh \n\nEnter the number n: "
    msg_part1:  .asciiz " number of fibonacci series is stored at memory location "
    msg_nl:     .asciiz "\n"
    msg_final:  .asciiz "fibonacci series: "
    msg_comma:  .asciiz ","
    .align 2
    fib_array:  .space 400
.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0
    
    la $s1, fib_array
    li $s2, 1
    li $t0, 0
    li $t1, 1
    
    beq $s0, $zero, exit
    
store_loop:
    sgt $t7, $s2, $s0
    bne $t7, $zero, print_series_header 
    
    beq $s2, 1, case_f1
    beq $s2, 2, case_f2
    
    add $t3, $t1, $t0
    move $t0, $t1
    move $t1, $t3
    j store_and_print
    
case_f1:
    li $t3, 0
    j store_and_print
    
case_f2:
    li $t3, 1
    
store_and_print:
    sw $t3, 0($s1)
    
    li $v0, 1
    move $a0, $s2
    syscall
    
    li $v0, 4
    la $a0, msg_part1
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall
    
    li $v0, 4
    la $a0, msg_nl
    syscall
    
    addi $s2, $s2, 1
    addi $s1, $s1, 4
    
    j store_loop

print_series_header:
    li $v0, 4
    la $a0, msg_final
    syscall
    
    la $s1, fib_array
    li $t2, 0
    
print_loop:
    beq $t2, $s0, exit
    
    lw $a0, 0($s1)
    li $v0, 1
    syscall
    
    addi $t2, $t2, 1
    addi $s1, $s1, 4
    
    beq $t2, $s0, exit
    
    li $v0, 4
    la $a0, msg_comma
    syscall
    
    j print_loop
    
exit:
    li $v0, 10
    syscall