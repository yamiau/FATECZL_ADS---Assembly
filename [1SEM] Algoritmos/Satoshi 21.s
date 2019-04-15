#Receba 4 notas bimestrais de um aluno. 
#Calcule e mostre a média aritmética. 
#Mostre a mensagem de acordo com a média: 
#a. Se a média for >= 6,0 exibir “APROVADO”; 
#b. Se a média for >= 3,0 ou < 6,0 exibir “EXAME”; 
#c. Se a média for < 3,0 exibir “RETIDO”. 

.data
		intro:	.asciiz "Insira as 4 notas bimestrais de um aluno e receba sua média bimestral.\n" 
		ipt1:	.asciiz "Primeira nota: " 
		ipt2:	.asciiz "Segunda nota: " 
		ipt3:	.asciiz "Terceira nota: " 
		ipt4:	.asciiz "Quarta nota: "
		opt0:	.asciiz "\nMédia bimestral: "
		opt1:	.asciiz ". Aluno aprovado!" 
		opt2:	.asciiz ". Aluno em exame!" 
		opt3:	.asciiz ". Aluno retido!" 
.text
main:

ler:
li $v0,4
la $a0, intro
syscall

li $v0,4
la $a0, ipt1
syscall
li $v0, 6
syscall
mov.s $f1, $f0

li $v0,4
la $a0, ipt2
syscall
li $v0, 6
syscall
mov.s $f2, $f0

li $v0,4
la $a0, ipt3
syscall
li $v0, 6
syscall
mov.s $f3, $f0

li $v0,4
la $a0, ipt4
syscall
li $v0, 6
syscall
mov.s $f4, $f0

calcular:
li.s $f6, 4.0
add.s $f5, $f1, $f2
add.s $f5, $f5, $f3
add.s $f5, $f5, $f4
div.s $f5, $f5, $f6

li $v0, 4
la $a0, opt0
syscall
li $v0, 2
mov.s $f12, $f5
syscall

resultado:
li.s $f6, 3.0
c.lt.s $f5, $f6
bc1t retido
li.s $f6, 6.0
bc1t exame

aprovado:
li $v0, 4
la $a0, opt1
syscall
j finalizar

exame:
li $v0, 4
la $a0, opt2
syscall
j finalizar

retido:
li $v0, 4
la $a0, opt3
syscall
j finalizar

finalizar: