# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.text
.globl main

main:
	li $s0, 12345
	li $s1, 56789

	# s0 = s0 XOR s1
	and $t0, $s0, $s1
	nor $t1, $t0, $t0
	or  $t2, $s0, $s1
	and $s0, $t2, $t1

	# s1 = s1 XOR s0
	and $t0, $s1, $s0
	nor $t1, $t0, $t0
	or  $t2, $s1, $s0
	and $s1, $t2, $t1

	# s0 = s0 XOR s1
	and $t0, $s0, $s1
	nor $t1, $t0, $t0
	or  $t2, $s0, $s1
	and $s0, $t2, $t1

	li $v0, 10
	syscall