# Assignment 6: Sequential Construct-II
# Programmed By : Kunwar Arpit Singh

.data
    promptP: .asciiz "Programmed By: Kunwar Arpit Singh \n\nEnter Principle (P) as an integer: "
    promptR: .asciiz "Enter Rate (R) as an integer: "
    promptT: .asciiz "Enter Time (T) as an integer: "
    msgSI:   .asciiz "\nSimple Interest (SI): "
    msgAbs:  .asciiz "\nAbsolute SI: "

.text
.globl main
main:
    li $v0, 4
    la $a0, promptP
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    

    li $v0, 4
    la $a0, promptR
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, promptT
    syscall
    li $v0, 5
    syscall
    move $t2, $v0


    mtc1 $t0, $f1
    cvt.s.w $f1, $f1


    mtc1 $t1, $f2
    cvt.s.w $f2, $f2
    
    mtc1 $t2, $f3
    cvt.s.w $f3, $f3

    li.s $f10, 100.0

    mul.s $f4, $f1, $f2
    mul.s $f4, $f4, $f3
    

    div.s $f12, $f4, $f10
    
    li $v0, 4
    la $a0, msgSI
    syscall
    
    li $v0, 2
    syscall
    
    abs.s $f12, $f12
    
    li $v0, 4
    la $a0, msgAbs
    syscall
    
    li $v0, 2
    syscall
    
    li $v0, 10
    syscall