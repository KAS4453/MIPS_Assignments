.data
	author_msg: .asciiz "Kunwar Arpit Singh\n"
	result_msg: .asciiz ", The weighted average is: "
	val_A_msg: .asciiz "\n A = "
	val_B_msg: .asciiz ", B = "
	val_C_msg: .asciiz ", C = "
	val_D_msg: .asciiz ", D = "

.text
.globl main

main:
	li $v0, 4
    	la $a0, author_msg
    	syscall
    
	li $a0, 800      
	li $a1, 400      
	li $a2, 200      
	li $a3, 100
	jal calculate_and_print

	li $a0, 160
	li $a1, 160
	li $a2, 160
	li $a3, 160
	jal calculate_and_print

	li $a0, 64
	li $a1, 32
	li $a2, 16
	li $a3, 8
    	jal calculate_and_print

	li $a0, 80
	li $a1, 40
	li $a2, 0
	li $a3, 0
	jal calculate_and_print

	li $a0, 1000
	li $a1, 500
	li $a2, 250
	li $a3, 120
	jal calculate_and_print

	li $v0, 10
	syscall

calculate_and_print:

	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3


	li $v0, 4
	la $a0, val_A_msg
	syscall

	li $v0, 1
	move $a0, $s0
	syscall


	li $v0, 4
	la $a0, val_B_msg
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, val_C_msg
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 4
	la $a0, val_D_msg
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	srl $t4, $s0, 3  # $t4 = A / 8
	srl $t5, $s1, 2  # $t5 = B / 4
	srl $t6, $s2, 1  # $t6 = C / 2
	srl $t7, $s3, 1  # $t7 = D / 2

	add $s4, $t4, $t5
	add $s4, $s4, $t6
	add $s4, $s4, $t7

	li $v0, 4
	la $a0, result_msg
	syscall

	li $v0, 1
	move $a0, $s4
	syscall

	jr $ra