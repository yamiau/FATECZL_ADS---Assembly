#Receba a quantidade de horas trabalhadas, o valor por hora, o percentual de desconto e o número de descendentes. 
#Calcule o salário que serão as horas trabalhadas x o valor por hora. 
#Calcule o salário líquido (= Salário Bruto – desconto). 
#A cada dependente será acrescido R$ 100 no Salário Líquido. Exiba o salário a receber. 

.data
		intro:	.asciiz "Bem-vindo à calculadora de salário"
		ipt1:	.asciiz "\nQuantidade de horas trabalhadas: "
		ipt2:	.asciiz "Valor por hora: "
		ipt3:	.asciiz "Percentual de desconto: "
		ipt4:	.asciiz "Número de dependentes: "
		opt1:	.asciiz "\nSalário bruto: "
		opt2:	.asciiz "\nSalário líquido: "
		opt3:	.asciiz "\nBônus por dependentes: "
		opt4:	.asciiz "\nSalário final: "
		plin:	.asciiz "\n"
		
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

li $v0, 4
la $a0, ipt4
syscall
li $v0, 6
syscall
mov.s $f4, $f0

#

calcular:
li $v0, 4
la $a0, opt1
syscall
mul.s $f5, $f1, $f2
li $v0, 2
mov.s $f12, $f5
syscall 

li $v0, 4
la $a0, opt2
syscall
li.s $f7, 100.0
div.s $f6, $f3, $f7 
mul.s $f6, $f6, $f5
sub.s $f5, $f5, $f6  
li $v0, 2
mov.s $f12, $f5
syscall 

li $v0, 4
la $a0, opt3 
syscall
mul.s $f4, $f4, $f7 
li $v0, 2
mov.s $f12, $f4
syscall 

li $v0, 4
la $a0, plin 
syscall 
li $v0, 4
la $a0, opt4
syscall
add.s $f5, $f5, $f4
li $v0, 2
mov.s $f12, $f5 
syscall 

#

finalizar:



