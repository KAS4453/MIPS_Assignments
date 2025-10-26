# Assignment 6: Conditional Construct
# Programmed By : Kunwar Arpit Singh

.data
  prompt_marks: .asciiz "Programmed By: Kunwar Arpit Singh 22185\n\nEnter marks (0-100): "
  grade_a:      .asciiz "Grade: A\n"
  grade_b:      .asciiz "Grade: B\n"
  grade_c:      .asciiz "Grade: C\n"
  grade_f:      .asciiz "Grade: F\n"

.text
.globl main

main:
  li $v0, 4
  la $a0, prompt_marks
  syscall

  li $v0, 5
  syscall
  move $s0, $v0

  li $t0, 40
  blt $s0, $t0, grade_F
  
  li $t0, 60
  blt $s0, $t0, grade_C
  
  li $t0, 80
  blt $s0, $t0, grade_B
  
grade_A:
  li $v0, 4
  la $a0, grade_a
  syscall
  j exit           

grade_B:
  li $v0, 4
  la $a0, grade_b
  syscall
  j exit

grade_C:
  li $v0, 4
  la $a0, grade_c
  syscall
  j exit

grade_F:
  li $v0, 4
  la $a0, grade_f
  syscall

exit:
  li $v0, 10
  syscall
