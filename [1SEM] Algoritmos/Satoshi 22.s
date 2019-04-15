#Receba 2 valores inteiros e diferentes. Mostre seus valores em ordem crescente. 

.data
		intro:	.asciiz	"Insira dois valores inteiros e receba-os de volta em ordem crescente.\n"
		ipt1:	.asciiz "Primeiro valor: " 
		ipt2:	.asciiz "Segundo valor: "
		linha:	.asciiz "\n" 
		seta:	.asciiz " -> " 
.text
main:

ler:
li $v0, 4
la $a0, intro
syscall
li $v0, 4
la $a0, ipt1
syscall
li $v0, 5
syscall
add $t1, $v0, 0

li $v0, 4
la $a0, ipt2
syscall
li $v0, 5
syscall
add $t2, $v0, 0

calcular:
bge $t1, $t2, opt1ge2 
j opt2g1

opt1ge2:
li $v0, 1
add $a0, $t2, 0
syscall
li $v0, 4
la $a0, seta
syscall
li $v0, 1
add $a0, $t1, 0
syscall
j finalizar

opt2g1:
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, seta
syscall
li $v0, 1
add $a0, $t2, 0
syscall
j finalizar

finalizar: