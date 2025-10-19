.data
	myName: .asciiz "Kunwar Arpit Singh\n"
	inputs_00: .asciiz "\nInputs: A=0, B=0"
	inputs_01: .asciiz "\n\nInputs: A=0, B=1"
	inputs_10: .asciiz "\n\nInputs: A=1, B=0"
	inputs_11: .asciiz "\n\nInputs: A=1, B=1"

	adder_title: .asciiz "\nHalf Adder Results:"
	sum_msg: .asciiz "\nSum: "
	carry_msg: .asciiz "\nCarry: "
	sub_title: .asciiz "\nHalf Subtractor Results"
	diff_msg: .asciiz "\nDifference: "
	borrow_msg: .asciiz "\nBorrow: "

.text
.globl main

main:
	# Print name
	li $v0, 4
	la $a0, myName
	syscall

	li $t0, 0
	li $t1, 0
	li $v0, 4
	la $a0, inputs_00
	syscall
	# Calculations
	xor $s0, $t0, $t1
	and $s1, $t0, $t1
	xor $s2, $t0, $t1
	not $t5, $t0
	and $s3, $t5, $t1
	jal PrintResults


	li $t0, 0
	li $t1, 1
	li $v0, 4
	la $a0, inputs_01
	syscall

	xor $s0, $t0, $t1
	and $s1, $t0, $t1
	xor $s2, $t0, $t1
	not $t5, $t0
	and $s3, $t5, $t1
	jal PrintResults

	li $t0, 1
	li $t1, 0
	li $v0, 4
	la $a0, inputs_10
	syscall

	xor $s0, $t0, $t1
	and $s1, $t0, $t1
	xor $s2, $t0, $t1
	not $t5, $t0
	and $s3, $t5, $t1
	jal PrintResults

	li $t0, 1
	li $t1, 1
	li $v0, 4
	la $a0, inputs_11
	syscall

	xor $s0, $t0, $t1
	and $s1, $t0, $t1
	xor $s2, $t0, $t1
	not $t5, $t0
	and $s3, $t5, $t1
	jal PrintResults

	li $v0, 10
	syscall

PrintResults:
	li $v0, 4; la $a0, adder_title; syscall
	li $v0, 4; la $a0, sum_msg; syscall
	li $v0, 1; move $a0, $s0; syscall
	li $v0, 4; la $a0, carry_msg; syscall
	li $v0, 1; move $a0, $s1; syscall

	li $v0, 4; la $a0, sub_title; syscall
	li $v0, 4; la $a0, diff_msg; syscall
	li $v0, 1; move $a0, $s2; syscall
	li $v0, 4; la $a0, borrow_msg; syscall
	li $v0, 1; move $a0, $s3; syscall

	jr $ra