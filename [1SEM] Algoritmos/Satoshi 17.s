#Calcule a quantidade de litros gastos em uma viagem, sabendo que o automóvel faz 12 km/l. 
#Receber o tempo de percurso e a velocidade média. 

.data
		intro:	.asciiz "Bem-vindo à calculadora de consumo de gasolina"
		ipt1:	.asciiz "\nTempo de percurso em horas: "
		ipt2:	.asciiz "Velocidade média em km/h: "
		opt1:	.asciiz "\nConsumo de gasolina para sua viagem em litros: "
		
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

calcular:
li.s $f3, 12.0
mul.s $f1, $f1, $f2
div.s $f1, $f1, $f3

li $v0, 4
la $a0, opt1
syscall
li $v0, 2
mov.s $f12, $f1
syscall

finalizar: