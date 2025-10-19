.data
	myName:     .asciiz "Kunwar Arpit Singh\n\n"
    	before_msg: .asciiz "Before Swap: A = "
    	after_msg:  .asciiz "\nAfter Swap:  A = "
    	b_val_msg:  .asciiz ", B = "

    	header1:    .asciiz "\nSwap 1: Positive Integers:\n"
    	header2:    .asciiz "\nSwap 2: A is zero:\n"
    	header3:    .asciiz "\nSwap 3: B is zero:\n"
    	header4:    .asciiz "\nSwap 4: Negative Integers:\n"
    	header5:    .asciiz "\nSwap 5: Mixed Signs:\n"
    	header6:    .asciiz "\nSwap 6: Identical Values:\n"

.text
.globl main

main:
	li   $v0, 4
    	la   $a0, myName
    	syscall

    	li $s0, 12345         # A
    	li $s1, 98765         # B
    	la $a1, header1
    	jal RunSingleSwap

    	li   $s0, 0
    	li   $s1, 55555
    	la   $a1, header2
    	jal  RunSingleSwap

    	li   $s0, 44444
    	li   $s1, 0
    	la   $a1, header3
    	jal  RunSingleSwap

    	li   $s0, -100
    	li   $s1, -250
    	la   $a1, header4
    	jal  RunSingleSwap

    	li   $s0, 789
    	li   $s1, -123
    	la   $a1, header5
    	jal  RunSingleSwap
    
    	li   $s0, 999
    	li   $s1, 999
    	la   $a1, header6
    	jal  RunSingleSwap

    	li $v0, 10
    	syscall

RunSingleSwap:
    	addi $sp, $sp, -4
	sw $ra, 0($sp)

    	li $v0, 4
    	move $a0, $a1
    	syscall
    
    	li $v0, 4
    	la $a0, before_msg
    	syscall
    	jal PrintState
    	
	and $t0, $s0, $s1
    	nor $t1, $t0, $t0
    	or  $t2, $s0, $s1
    	and $s0, $t2, $t1

    	and $t0, $s0, $s1
    	nor $t1, $t0, $t0
    	or  $t2, $s0, $s1
    	and $s1, $t2, $t1

    	and $t0, $s0, $s1
    	nor $t1, $t0, $t0
    	or  $t2, $s0, $s1
    	and $s0, $t2, $t1
    
    	li $v0, 4
    	la $a0, after_msg
    	syscall
    	
	jal PrintState
	
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

PrintState:
    	li $v0, 1
    	move $a0, $s0
    	syscall

    	li $v0, 4
    	la $a0, b_val_msg
    	syscall

    	li $v0, 1
    	move $a0, $s1
    	syscall

    	jr $ra