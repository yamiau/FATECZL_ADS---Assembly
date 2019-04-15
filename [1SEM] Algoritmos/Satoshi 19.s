#Receba 2 valores reais. Calcule e mostre o maior deles.

.data
		ipt1:	.asciiz	"Insira dois valores reais e receba o maior. Primeiro valor: "
		ipt2:	.asciiz "Segundo valor: "
		linha:	.asciiz "\n" 
		opt1:	.asciiz " é o maior entre os dois valores."
		opt2:	.asciiz "\nAmbos os valores são iguais"
.text
main:

ler:
li $v0, 4
la $a0, ipt1
syscall
li $v0, 6
syscall
mov.s $f1, $f0

li $v0, 4
la $a0, ipt2
syscall
li $v0, 6
syscall
mov.s $f2, $f0

calcular:
c.eq.s $f1, $f2
bc1t iguais
c.lt.s $f2, $f1
bc1t primeiro
j segundo

j finalizar

primeiro:
li $v0, 4
la $a0, linha
syscall
li $v0, 2
mov.s $f12, $f1
syscall
li $v0, 4
la $a0, opt1
syscall
j finalizar

segundo:
li $v0, 4
la $a0, linha
syscall
li $v0, 2
mov.s $f12, $f2
syscall
li $v0, 4
la $a0, opt1
syscall
j finalizar


iguais:
li $v0, 4
la $a0, opt2
syscall
j finalizar

finalizar: