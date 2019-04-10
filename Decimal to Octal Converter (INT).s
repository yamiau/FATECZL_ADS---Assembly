.data
		msgr:		.asciiz		"\nInsert an integer between 1 and 10000: "
		msgo1:		.asciiz 	"\nThe decimal number #"
		msgo2:		.asciiz 	" in octal base is #"
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
j testrangemin 

testrangemin:
blt $t0, 1, read
bgt $t0, 10000, read
j preconversion 

preconversion: 
add $t1, $t0, 0
li $t2, 1

conversion:
rem $t3, $t1, 8
mul $t4, $t3, $t2
add $t5, $t5, $t4
mul $t2, $t2, 10
div $t1, $t1, 8
beq $t1, $zero, output
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