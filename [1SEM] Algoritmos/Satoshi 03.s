#Receba a base e a altura de um triângulo. Calcule e mostre a sua área

.data
		msgr1:		.asciiz		"\n Base do triângulo: " 
		msgr2:		.asciiz		"Altura do triângulo: "
		msgo:		.asciiz		"\n Área do triângulo: "
		closure:	.asciiz		"\n"
.text
main:

read:
li $v0, 4
la $a0, msgr1
syscall
li $v0, 6
syscall
mov.s $f1, $f0
li $v0, 4
la $a0, msgr2
syscall
li $v0, 6
syscall
mov.s $f2, $f0
 
area:
li.s $f4, 2.0
mul.s $f3, $f1, $f2
div.s $f3, $f3, $f4

output:
li $v0, 4
la $a0, msgo
syscall
li $v0, 2
mov.s $f12, $f3
syscall
li $v0, 4
la $a0, closure
syscall
