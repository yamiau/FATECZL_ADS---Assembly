#Calcule e mostre o quadrado dos números entre 10 e 150.

.data
		intro:	.asciiz "Quadrado dos números entre 10 e 150: " 
		linha:	.asciiz "\n"
.text
main:

ler:
li $v0, 4
la $a0, intro
syscall
li $v0, 4
la $a0, linha
syscall

li $s0, 10

calcular:
bgt $s0, 150, finalizar
mul $s1, $s0, $s0
add $s0, $s0, 1

li $v0, 1
add $a0, $s1, 0
syscall
li $v0, 4
la $a0, linha
syscall

j calcular


finalizar: