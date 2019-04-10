.data
		msgr:		.asciiz		"\n Converta uma temperatura de Celsius a Fahrenheit: " 
		msgo:		.asciiz		"\n Temperatura em Fahrenheit: "
		closure:	.asciiz		"\n"
.text
main:

#Receba a temperatura em graus Celsius. Calcule e mostre a sua temperatura convertida em fahrenheit F = (9*C+160)/5. 

read:
li $v0, 4
la $a0, msgr
syscall
li $v0, 6
syscall
mov.s $f1, $f0

conversion:
li.s $f3, 1.8
li.s $f4, 32.0
mul.s $f2, $f1, $f3
add.s $f2, $f2, $f4

output:
li $v0, 4
la $a0, msgo
syscall
li $v0, 2
mov.s $f12, $f2
syscall
li $v0, 4
la $a0, closure
syscall

