.data
		msgr:		.asciiz		"\n Lado do quadrado: "
		msgo:		.asciiz		"\n Área: "
		closure:	.asciiz		"\n" 
.text
main:

#Coletar o valor do lado de um quadrado, calcular sua área e apresentar o resultado

read:
li $v0, 4
la $a0, msgr 
syscall
li $v0, 5
syscall
add $t0, $v0, 0

area:
mul $t1, $t0, $t0

output:
li $v0, 4
la $a0, msgo
syscall
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, closure
syscall 