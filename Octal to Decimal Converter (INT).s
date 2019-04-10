# Coded by Murillo Meira [RA 1110481822024]

# 6) Faça um algoritmo que receba um número (1 < número < 10000) octal e converta para decimal.

.data
		msgr:		.asciiz		"\nInsert an octal integer between 1 and 23420: "
		msgre:		.asciiz		"Your number is too small!\n"
		msgre2:		.asciiz		"Your number is too big!\n"
		msgnb:		.asciiz		"Your number is not Octal.\n"
		msgo1:		.asciiz 	"\nThe octal number #"
		msgo2:		.asciiz 	" in decimal base is #"
		retry:		.asciiz		"\nDo you want to try another one?\n"
		retryi:		.asciiz		"YES = 1. NO = 0.\n"
		msgend:		.asciiz		"\nSee you around, buddy! :) \n"
		closure:	.asciiz 	"\n"
.text
main:

read:
li $v0, 4
la $a0, msgr
syscall
li $v0, 5
syscall
add $t0, $v0, 0
add $t7, $t0, 0
j testrange 

reade:
li $v0, 4
la $a0, msgre
syscall
j read

reade2:
li $v0, 4
la $a0, msgre2
syscall
j read

testrange:
add $t6, $t6, 1
blt $t0, 1, reade
bgt $t0, 23420, reade2 
j octalcheck

octalcheck:
beq $t7, 0, preconversion
rem $t2, $t7, 10
bge $t2, 8, nonoctal
div $t7, $t7, 10
j octalcheck

nonoctal:
li $v0, 4
la $a0, msgnb
syscall
j read

preconversion: 
add $t1, $t0, 0
li $t2, 1

conversion:
rem $t3, $t1, 10
mul $t4, $t2, $t3 
add $t5, $t5, $t4 
mul $t2, $t2, 8
div $t1, $t1, 10

beq $t1, 0, output
j conversion 

output:
li $v0, 4
la $a0, msgo1 
syscall 
li $v0, 1
add $a0, $t0, 0
syscall 
li $v0, 4
la $a0, msgo2 
syscall 
li $v0, 1
add $a0, $t5, 0
syscall 
li $v0, 4
la $a0, closure 
syscall 
j redo

redo:
li $t0, 0
li $t1, 0
li $t2, 0
li $t3, 0
li $t4, 0
li $v0, 4
la $a0, retry
syscall

input:
li $v0, 4
la $a0, retryi
syscall
li $v0, 5
syscall

beq $v0, 0, ending
beq $v0, 1, read
j input

ending: