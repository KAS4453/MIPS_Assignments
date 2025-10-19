.data
	myName:   .asciiz "Kunwar Arpit Singh\n\n"
	term_msg: .asciiz "The 8th term is: "
   	sum_msg:  .asciiz "\nThe sum of the first 6 terms is: "
    	newline:  .asciiz "\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, myName
	syscall

	# $t0 = a
	li $t0, 1
	
	# $t1 = d
	li $t1, 10
	
	# $t2 = n
	li $t2, 8

	# Calculate the 8th term (n=8)

	addi $t3, $t2, -1

	mul $t4, $t3, $t1

	add $s0, $t0, $t4

	# Calculate the sum of the first 6 terms (n=6)

	li $t2, 6

	addi $t3, $t2, -1

	mul $t4, $t3, $t1

	mul $t5, $t0, 2

	add $t6, $t5, $t4

	li   $t8, 2
	div  $t2, $t8

	mflo $t7

	mul $s1, $t7, $t6

	li $v0, 4
	la $a0, term_msg
	syscall

	li $v0, 1
    	move $a0, $s0
    	syscall

	li $v0, 4
    	la $a0, sum_msg
    	syscall

	li $v0, 1
    	move $a0, $s1
    	syscall

	li $v0, 10
    	syscall