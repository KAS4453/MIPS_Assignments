# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.text
.globl main

main:
	li $t0, 800
	li $t1, 400
	li $t2, 200
	li $t3, 100

	# Calculate the weighted terms.
	# The formula is (0.125*A + 0.25*B + 0.5*C + 0.5*D).
	# This is achieved using bit shifts, which is allowed and avoids the forbidden 'mult'/'div' instructions.

	srl $t4, $t0, 3		# $t4 = A / 8
	srl $t5, $t1, 2		# $t5 = B / 4
	srl $t6, $t2, 1		# $t6 = C / 2
	srl $t7, $t3, 1		# $t7 = D / 2

	# Sum the individual terms to get the final weighted average.
	add $s0, $t4, $t5
	add $s0, $s0, $t6
	add $s0, $s0, $t7

	# Move the final result into the specified return register, $a0.
	move $a0, $s0

	li $v0, 10
	syscall