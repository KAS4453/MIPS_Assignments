# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.text
.globl main

main:
	# $t0 = a
	li $t0, 1
	
	# $t1 = d
	li $t1, 10
	
	# Calculate the 8th term
	# Formula: an = a + (n-1)d
	li $t2, 8             # n = 8
	addi $t3, $t2, -1     # Calculate (n-1)
	mul $t4, $t3, $t1     # Calculate (n-1) * d
	add $s0, $t0, $t4     # Result: a + (n-1)d. Stored in $s0

	# Calculate the sum of the first 6 terms
	# Formula: Sn = (n/2) * (2a + (n-1)d)
	li $t2, 6             # n = 6

	# Calculate (n-1)d part
	addi $t3, $t2, -1     # Calculate (n-1)
	mul $t4, $t3, $t1     # Calculate (n-1) * d

	# Calculate 2a part
	li $t8, 2             # Load immediate value 2 into a register
	mul $t5, $t0, $t8     # Correctly use mul with registers: 2 * a

	# Calculate (2a + (n-1)d)
	add $t6, $t5, $t4

	# Calculate n/2 part
	div  $t2, $t8         # n / 2. Quotient is stored in special register 'lo'
	mflo $t7              # Move the quotient (n/2) from 'lo' into $t7

	# Final sum calculation
	mul $s1, $t7, $t6     # (n/2) * (2a + (n-1)d). Result stored in $s1

	li $v0, 10
	syscall