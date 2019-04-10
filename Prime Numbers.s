.data 
		msgr: 		.asciiz			"\nInsert an integer between 1 and 10000: "
		msgo1: 		.asciiz 		"\nThe primes between 1 and " 
		msgo2: 		.asciiz 		" are:\n"
		msgret:		.asciiz			"\nWanna try again? YES = 1, NO = 0."
		msgnret:	.asciiz			"\nGoodbye, world!"
		closure:	.asciiz			"\n" 
.text 
main: 

read:
li $v0, 4 
la $a0, msgr 
syscall 
li $v0, 5 
syscall 
add $t0, $v0, 0 
add $s0, $t0, 0						#copycat
li $t1, 1							#number counter
li $t4, 1							#internal counter
j testrange

testrange:
blt $t0, 1, read
bgt $t0, 10000, read

firstnumber: 
bgt $t1, $s0, retry
blt $t1, $t4, output

remainders: 
rem $t2, $t1, $t4
beq $t2, 0, factors
j increment

factors:
add $t3, $t3, 1

increment:
add $t4, $t4, 1
j firstnumber

output:
beq $t3, 2, outprint1
j nextnumber

nextnumber:
add $t1, $t1, 1
li $t4, 1
li $t3, 0
j firstnumber

outprint2:
li $v0, 4
la $a0, closure
syscall
li $v0, 1
add $a0, $t1, 0
syscall
j nextnumber

outprint1:
bgt $t5, 0, outprint2
add $t5, $t5, 1
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
add $a0, $t1, 0
syscall
j nextnumber

retry:
li $v0, 4
la $a0, msgret
syscall
li $v0, 5
syscall
add $t1, $v0, 0
beq $t1, 1, read
j noretry

noretry:
li $v0, 4
la $a0, msgnret
syscall

ending:
