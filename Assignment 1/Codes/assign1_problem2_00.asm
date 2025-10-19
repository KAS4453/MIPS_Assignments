# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.text
.globl main

main:
	# Case 1: A = 0, B = 0
	li $t0, 0		# A = 0
	li $t1, 0		# B = 0
	
	# Half Adder Logic (Sum = A XOR B, Carry = A AND B)
	nor $t3, $t1, $t1	# NOT B
	and $t4, $t0, $t3	# A AND (NOT B)
	nor $t5, $t0, $t0	# NOT A
	and $t6, $t5, $t1	# (NOT A) AND B
	or  $s0, $t4, $t6	# Sum
	and $s1, $t0, $t1	# Carry
	
	# Half Subtractor Logic (Difference = A XOR B, Borrow = (NOT A) AND B)
	move $s2, $s0		# Difference
	move $s3, $t6		# Borrow
	
	li $v0, 10
	syscall