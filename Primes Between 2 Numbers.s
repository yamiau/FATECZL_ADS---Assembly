.data 
		msgr1: 		.asciiz			"\nInsert an integer: "
		msgr2:		.asciiz			"\nInsert another integer:"
		msgo1: 		.asciiz 		"\nThe primes between " 
		msgo2:		.asciiz			" and "
		msgo3: 		.asciiz 		" are:\n"
		msgret:		.asciiz			"\nWanna try again? YES = 1, NO = 0."
		msgnret:	.asciiz			"\nGoodbye, world!"
		closure:	.asciiz			"\n" 
.text 
main: 

read1:
li $v0, 4 
la $a0, msgr1 
syscall 
li $v0, 5 
syscall 
add $t0, $v0, 0 					#number n
add $s0, $t0, 0						#copycat1

read2:
li $v0, 4 
la $a0, msgr2 
syscall 
li $v0, 5 
syscall 
add $t1, $v0, 0 					#number m
add $s1, $t1, 0						#copycat2
li $t5, 1							#internal counter

comparison:
bgt $t0, $t1, sorting
j firstnumber

sorting:
add $s2, $t0, 0
li $t0, 0
li $s0, 0
add $t0, $t1, 0
add $s0, $t1 ,0 
li $t1, 0
li $s1, 0
add $t1, $s2, 0
add $s1, $s2, 0

firstnumber:
bgt $s0, $s1, retry
blt $s0, $t5, output

remainders:
rem $t3, $s0, $t5
beq $t3, 0, factors
j increment

factors:
add $t4, $t4, 1

increment:
add $t5, $t5, 1
j firstnumber

output:
beq $t4, 2, outprint1
j nextnumber

nextnumber:
add $s0, $s0, 1
li $t5, 1
li $t4, 0
j firstnumber

outprint2:
li $v0, 4
la $a0, closure
syscall
li $v0, 1
add $a0, $s0, 0
syscall
j nextnumber

outprint1:
bgt $t6, 0, outprint2
add $t6, $t6, 1
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
li $v0, 4
la $a0, msgo3
syscall
li $v0, 1
add $a0, $s0, 0
syscall
j nextnumber

retry:
li $v0, 4
la $a0, msgret
syscall
li $v0, 4
la $a0, closure
syscall
li $v0, 5
syscall
add $t1, $v0, 0
beq $t1, 1, read1
j noretry

noretry:
li $v0, 4
la $a0, msgnret
syscall

ending: