#Receba um valor inteiro. Verifique e mostre se é divisível por 2 e 3. 

.data
		intro:	.asciiz "Verifique se um valor inteiro é divisível por 2 e 3.\n" 
		ipt1:	.asciiz "Insira seu valor: "
		opt1:	.asciiz "  é divisível por "
		opte:	.asciiz " e " 
		opt2: 	.asciiz "  não é divisível por "
		optn:	.asciiz " nem por "
		ponto:	.asciiz "."
		linha:	.asciiz "\n"
.text
main:

ler:
li$v0, 4
la $a0, intro
syscall
li $v0, 4
la $a0, ipt1
syscall
li $v0, 5
syscall
add $s1, $v0, 0

calcular2:
rem $s2, $s1, 2
beq $s2, 0, incrementar2
j calcular3

calcular3:
sub $s2, $s2, $s2
rem $s2, $s1, 3
beq $s2, 0, incrementar3
j testar

incrementar2:
add $s3, $s3, 2
j calcular3

incrementar3:
add $s3, $s3, 3
j testar

testar:
blt $s3, 2, nenhum
blt $s3, 3, por2
bgt $s3, 3, ambos
j por3

por2:
li $v0, 4
la $a0, linha
syscall
li $v0, 1
add $a0, $s1, 0
syscall
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
la $a0, 2
syscall
li $v0, 4
la $a0, ponto
syscall
j finalizar

por3:
li $v0, 4
la $a0, linha
syscall
li $v0, 1
add $a0, $s1, 0
syscall
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
la $a0, 3
syscall
li $v0, 4
la $a0, ponto
syscall
j finalizar

ambos:
li $v0, 4
la $a0, linha
syscall
li $v0, 1
add $a0, $s1, 0
syscall
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
la $a0, 2
syscall
li $v0, 4
la $a0, opte
syscall
li $v0, 1
la $a0, 3
syscall
li $v0, 4
la $a0, ponto
syscall
j finalizar

nenhum:
li $v0, 4
la $a0, linha
syscall
li $v0, 1
add $a0, $s1, 0
syscall
li $v0, 4
la $a0, opt2
syscall
li $v0, 1
la $a0, 2
syscall
li $v0, 4
la $a0, optn
syscall
li $v0, 1
la $a0, 3
syscall
li $v0, 4
la $a0, ponto
syscall
j finalizar

finalizar: