#Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor valor. 

.data
		intro:	.asciiz	"Diferença do maior para o menor valor"
		ipt1:	.asciiz "\nInsira o primeiro número: "
		ipt2:	.asciiz "Insira o segundo número: "
		opt1:	.asciiz " - "
		opt2:	.asciiz " = " 
		
.text
main:

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
beq $t1, $t2, zero
bgt $t1, $t2, subtrair1
j subtrair2

zero:
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
add $a0, $t2, 0
syscall
li $v0, 4
la $a0, opt2
syscall
li $v0, 1
add $a0, $zero, 0
syscall
j finalizar

subtrair1:
li $v0, 1
add $a0, $t1, 0
syscall
li$v0, 4
la $a0, opt1
syscall
li $v0, 1
add $a0, $t2, 0
syscall
li $v0, 4
la $a0, opt2
syscall
li $v0, 1
sub $a0, $t1, $t2
syscall 
j finalizar

subtrair2:
li $v0, 1
add $a0, $t2, 0
syscall
li$v0, 4
la $a0, opt1
syscall
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, opt2
syscall
li $v0, 1
sub $a0, $t2, $t1
syscall 
j finalizar

finalizar: