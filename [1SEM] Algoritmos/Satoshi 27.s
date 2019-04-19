#Receba o número de voltas, a extensão do circuito (em metros) e o tempo de duração (minutos). 
#Calcule e mostre a velocidade média em km/h. 

.data
		intro:	.asciiz "Calculadora de velocidade média em circuito\n"
		ipt1:	.asciiz "Número de voltas percorridas: " 
		ipt2:	.asciiz "Extensão do circuito (m): " 
		ipt3:	.asciiz "Duração da corrida (min): " 
		opt1:	.asciiz "Velocidade Média: "
		opt2:	.asciiz " km/h"
.text
main:

ler:
li $v0, 4
la $a0, intro
syscall
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

li $v0, 4
la $a0, ipt3
syscall
li $v0, 6
syscall
mov.s $f3, $f0

calcular:
li.s $f7, 1000.0
li.s $f8, 60.0
mul.s $f2, $f2, $f1
div.s $f5, $f2, $f7
div.s $f6, $f3, $f8
div.s $f4, $f5, $f6

output:
li $v0, 4
la $a0, opt1
syscall
li $v0, 2
mov.s $f12, $f4
syscall
li $v0, 4
la $a0, opt2
syscall

finalizar: