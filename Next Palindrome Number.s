# Coded by Murillo Meira de Azedino [RA 1110481822024]

# 12)Faça um algoritmo que leia um número (1 < número < 10000) e caso ele não seja um número palíndromo, apontar qual o número palíndromo mais próximo a seguir dele.

.data
		msgr:		.asciiz		"\nInsert a number between 1 and 10000: "
		msgo1:		.asciiz		" is a palindrome \n. "
		msgo1.2:	.asciiz		"The next palindrome number is: "
		msgo0:		.asciiz		" is not a palindrome \n."
		closure:	.asciiz		"\n"
		retry:		.asciiz		"\nDo you want to try another one?\n"
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
j testrange

testrange:
blt $v0, 1, read
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
beq $t0, $t1, turntrue
j turnfalse

turntrue:
bgt $t5, 0, lmsgo1.2
j lmsgo1

turnfalse:
bgt $t5, 0, nextpalindrome 
j lmsgo0 

lmsgo0:
add $t5, $t5, 1 
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
j nextpalindrome  

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

lmsgo1.2:
li $v0, 4
la $a0, msgo1.2
syscall
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, closure
syscall 
j redo

nextpalindrome:
add $t0, $t0, 1
add $t3, $t0, 0
li $t1, 0
li $t2, 0
li $t4, 0
j palindromism 

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
