.data
	myName:   .asciiz "Kunwar Arpit Singh\n\n"
	term_msg: .asciiz "The 4th term is: "
    	sum_msg:  .asciiz "\nThe sum of the first 4 terms is: "

.text
.globl main

main:
	li $v0, 4
	la $a0, myName
	syscall

	# $t0 = a
	li $t0, 4
	
	# $t1 = r
	li $t1, 2
	
	# $t2 = n
	li $t2, 4

	mul $t3, $t1, $t1
	mul $t3, $t3, $t1

	mul $s2, $t0, $t3

	# Calculate the sum of the first 4 terms (n=4)
	
	mul $t4, $t3, $t1
	addi $t5, $t4, -1
	mul $t6, $t0, $t5
	addi $t7, $t1, -1

	div $t6, $t7
	mflo $s3

	li $v0, 4
	la $a0, term_msg
	syscall

	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 4
	la $a0, sum_msg
	syscall

	li $v0, 1
	move $a0, $s3
	syscall

	li $v0, 10
    	syscall
	