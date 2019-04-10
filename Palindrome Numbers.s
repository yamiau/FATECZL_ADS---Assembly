# Coded by Murillo Meira de Azedino [RA 1110481822024]

# 11)Faça um algoritmo que leia um número (1 < número < 10000) e diga se é ou não um número palíndromo.

# $t0 = read number
# $t3 = read number copycat
# $t4 = division remainder; $t3, 10
# $t1 = comparing number; $t1 * 10 + $t4:
# 	$t2 = $t1 * 10
# 	$t1 = $t1 + $t4
# $t3 = $t3 / 10
# Branch equality $t0, $t3; if true number is palindrome
#	if false number isn't palindrome

.data
		msgr:		.asciiz		"\nInsert a number between 1 and 10000: "
		msgo1:		.asciiz		" is a palindrome \n. "
		msgo0:		.asciiz		" is not a palindrome \n."
		closure:	.asciiz		"\n"
		retry:		.asciiz		"Do you want to try another one?\n"
		retryi:		.asciiz		"YES = 1. NO = 0.\n"
		msgend:		.asciiz		"\nSee you around, buddy! :) \n"
.text
main:

read:
li $v0, 4
la $a0, msgr
syscall
li $v0, 5
syscall
j testrangemin

testrangemin:
blt $v0, 1, read
j testrangemax

testrangemax:
bgt $v0, 10000, read
add $t0, $v0, 0
add $t3, $v0, 0

palindromism:
beq $t3, 0, output
rem $t4, $t3, 10
mul $t2, $t1, 10
add $t1, $t2, $t4
div $t3, $t3, 10
j palindromism

output:
beq $t0, $t1, lmsgo1
j lmsgo0

lmsgo0:
li $v0, 4
la $a0, closure
syscall
li $v0, 1
add $a0, $t0, 0
syscall
li $v0, 4
la $a0, msgo0
syscall
li $v0, 4
la $a0, closure
syscall
j redo

lmsgo1:
li $v0, 4
la $a0, closure
syscall
li $v0, 1
add $a0, $t0, 0
syscall
li $v0, 4
la $a0, msgo1
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
li $t0, 0
li $t1, 0
li $t2, 0
li $t3, 0
li $t4, 0
li $v0, 4
la $a0, msgend
syscall
