# Assignment 6: Conditional Construct
# Programmed By : Kunwar Arpit Singh

.data
  prompt_year: .asciiz "Programmed By: Kunwar Arpit Singh 22185\n\nEnter a year: "
  message_is_leap:     .asciiz "Input year is a leap year\n"
  message_not_leap:    .asciiz "Input year is not a leap year\n"

.text
.globl main

main:
  li $v0, 4
  la $a0, prompt_year
  syscall

  li $v0, 5
  syscall
  
  move $s0, $v0

  li $t1, 4
  div $s0, $t1
  mfhi $t2
  
  bne $t2, $zero, not_leap

  li $t1, 100
  div $s0, $t1
  mfhi $t2
  
  bne $t2, $zero, is_leap
  
  li $t1, 400
  div $s0, $t1
  mfhi $t2
  
  bne $t2, $zero, not_leap

is_leap:
  li $v0, 4
  la $a0, message_is_leap
  syscall
  j exit
  
not_leap:
  li $v0, 4
  la $a0, message_not_leap
  syscall

exit:
  li $v0, 10
  syscall
