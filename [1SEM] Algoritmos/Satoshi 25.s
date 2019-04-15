#Receba a hora de início e de final de um jogo (HH,MM)
#Calcular o tempo do jogo em horas e minutos, sabendo que o tempo máximo é menor que 24 horas e pode começar num dia e terminar noutro

.data
		intro: 	.asciiz "Bem-vindo à calculadora de duração de eventos\n" 
		hi:		.asciiz "Horas iniciais: " 
		mi:		.asciiz "Minutos iniciais: " 
		hf:		.asciiz "Horas finais: " 
		mf:		.asciiz "Minutos finais: " 
		opt1:	.asciiz "\nDuração do evento: " 
		opt2:	.asciiz "h "
		opt3:	.asciiz "min"
.text
main:

ler:
li $v0, 4
la $a0, intro
syscall
li $v0, 4
la $a0, hi
syscall
li $v0, 5
syscall
add $t1, $v0, 0

li $v0, 4
la $a0, mi
syscall
li $v0, 5
syscall
add $t2, $v0, 0

li $v0, 4
la $a0, hf
syscall
li $v0, 5
syscall
add $t3, $v0, 0

li $v0, 4
la $a0, mf
syscall
li $v0, 5
syscall
add $t4, $v0, 0
j calcularh1

hf_lt_hi:
add $t5, $t5, 24
j calcularm1

mf_lt_mi:
add $t6, $t6, 60
j calcularm2

calcularm2:
beq $t1, $t3, horamax
sub $t5, $t5, 1
j output

horamax:
li $t5, 23
j output

calcularh1:
sub $t5, $t3, $t1
blt $t5, 0, hf_lt_hi

calcularm1:
sub $t6, $t4, $t2
blt $t6, 0, mf_lt_mi

output:
li $v0, 4
la $a0, opt1
syscall
li $v0, 1
add $a0, $t5, 0
syscall
li $v0, 4
la $a0, opt2
syscall
li $v0, 1
add $a0, $t6, 0
syscall
li $v0, 4
la $a0, opt3
syscall

finalizar: