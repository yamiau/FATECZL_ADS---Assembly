.data
		msgr:		.asciiz		"\n Salário: "
		msgo:		.asciiz		"\n Saláraio com reajuste: "
		closure:	.asciiz		"\n" 
.text
main:

#Receba o salário de um funcionário e mostre o novo salário com reajuste de 15%. 

read:
li $v0, 4
la $a0, msgr
syscall
li $v0, 6
syscall
mov.s $f1, $f0

calc:
li.s $f3, 1.15
mul.s $f2, $f1, $f3

output:
li $v0, 4
la $a0, msgo
syscall
li $v0, 2
mov.s $f12, $f2
syscall
li $v0, 4
la $a0, closure

