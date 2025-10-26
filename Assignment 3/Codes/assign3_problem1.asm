# Assignment 6: Conditional Construct
# Programmed By : Kunwar Arpit Singh

.data
  # --- Strings for Prompts and Output ---
  prompt1:    .asciiz "Programmed By: Kunwar Arpit Singh 22185\n\nEnter the first floating-point number: "
  prompt2:    .asciiz "Enter the second floating-point number: "
  is_greater: .asciiz " is greater than "
  newline:    .asciiz "\n"

.text
.globl main

main:
  li $v0, 4
  la $a0, prompt1
  syscall

  li $v0, 6
  syscall
  
  mov.s $f1, $f0

  li $v0, 4
  la $a0, prompt2
  syscall

  li $v0, 6
  syscall
  
  c.lt.s $f0, $f1

  bc1t num1_is_greater

  li $v0, 2
  mov.s $f12, $f0
  syscall
  
  li $v0, 4
  la $a0, is_greater
  syscall
  
  li $v0, 2
  mov.s $f12, $f1
  syscall
  
  j exit

num1_is_greater:

  li $v0, 2
  mov.s $f12, $f1
  syscall
  
  li $v0, 4
  la $a0, is_greater
  syscall
  
  li $v0, 2
  mov.s $f12, $f0
  syscall

exit:
  li $v0, 4
  la $a0, newline
  syscall
  
  li $v0, 10
  syscall