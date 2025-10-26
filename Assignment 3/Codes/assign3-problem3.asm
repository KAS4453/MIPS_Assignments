# Assignment 6: Conditional Construct
# Programmed By : Kunwar Arpit Singh

.data
  prompt_name:    .asciiz "Programmed By: Kunwar Arpit Singh 22185\n\nEnter student name: "
  prompt_total:   .asciiz "Enter total number of classes held: "
  prompt_attended:.asciiz "Enter number of classes attended: "
  is_allowed:     .asciiz " is allowed to sit in the exam.\n"
  not_allowed:    .asciiz " is not allowed to sit in the exam.\n"

  student_name:   .space 256

.text
.globl main

main:
  li $v0, 4
  la $a0, prompt_name
  syscall

  li $v0, 8
  la $a0, student_name
  li $a1, 256
  syscall
  
  la $t0, student_name
  
find_newline_loop:
  lb $t1, 0($t0)
  beq $t1, 10, replace_newline
  beq $t1, 0, done_checking
  addi $t0, $t0, 1
  j find_newline_loop

replace_newline:
  sb $zero, 0($t0)
  
done_checking:
  li $v0, 4
  la $a0, prompt_total
  syscall

  li $v0, 5
  syscall
  move $s0, $v0

  li $v0, 4
  la $a0, prompt_attended
  syscall

  li $v0, 5
  syscall
  move $s1, $v0

  li $t0, 100
  mult $s1, $t0
  mflo $t2
  
  li $t0, 75
  mult $s0, $t0
  mflo $t3
  
  blt $t2, $t3, not_allowed_label

  li $v0, 4
  la $a0, student_name
  syscall
  
  li $v0, 4
  la $a0, is_allowed
  syscall
  
  j exit
  
not_allowed_label:
  li $v0, 4
  la $a0, student_name
  syscall
  
  li $v0, 4
  la $a0, not_allowed
  syscall
  
exit:
  li $v0, 10
  syscall