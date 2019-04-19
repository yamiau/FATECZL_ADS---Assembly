#Receba 2 números inteiros. Verifique e mostre se o maior número é múltiplo do menor. 

.data
		intro:	.asciiz "Insira dois números inteiros e receba sua multiplicidade\n"
		ipt1:	.asciiz "Primeiro número: "
		ipt2:	.asciiz "Segundo número: " 
		opt1:	.asciiz " é múltiplo de "
		opt2:	.asciiz " não"
		linha:	.asciiz "\n" 
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

comparar:
blt $t1, $t2, troca
rem $t0, $t1, $t2
beq $t0, 0, outputsim
j outputnao

troca:
add $t0, $t2, 0
sub $t2, $t2, $t2
add $t2, $t1, 0
sub $t1, $t1, $t1
add $t1, $t0, 0
j comparar


outputsim:
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
add $a0, $t2, 0
syscall
j finalizar

outputnao:
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, opt2
syscall
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
add $a0, $t2, 0
syscall
j finalizar

finalizar: