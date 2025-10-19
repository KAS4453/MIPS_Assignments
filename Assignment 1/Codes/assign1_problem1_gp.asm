# Assignment 1: Sequential Construct-I
# Programmed By : Kunwar Arpit Singh

.text
.globl main

main:
	# $t0 = a=
	li $t0, 4
	
	# $t1 = r=
	li $t1, 2

	# Calculate the 4th term
	# Formula: an = a * r^(n-1)
	# For n=4, this is a * r^3
	mul $t3, $t1, $t1     # $t3 = r^2
	mul $t3, $t3, $t1     # $t3 = r^3
	mul $s2, $t0, $t3     # Result: a * r^3. Stored in $s2

	# Calculate the sum of the first 4 terms
	# Formula: Sn = a * (r^n - 1) / (r - 1)
	# For n=4, this is a * (r^4 - 1) / (r - 1)

	# Calculate r^n - 1 part
	mul $t4, $t3, $t1     # $t4 = r^4 (since $t3 holds r^3)
	addi $t5, $t4, -1     # $t5 = r^4 - 1

	# Numerator: a * (r^n - 1)
	mul $t6, $t0, $t5

	# Denominator: r - 1
	addi $t7, $t1, -1

	# Final division
	div $t6, $t7          # Numerator / Denominator. Quotient stored in 'lo'
	mflo $s3              # Move result from 'lo' into $s3

	li $v0, 10
	syscall