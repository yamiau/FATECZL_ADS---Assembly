#Receba 3 valores obrigatoriamente em ordem crescente e um 4º valor não necessariamente em ordem. 
#Mostre os 4 números em ordem crescente 

.data
		intro:	.asciiz	"Insira 3 valores inteiros em ordem crescente e 1 valor fora de ordem e receba-os de volta em ordem crescente.\n"
		ipt1:	.asciiz "Primeiro valor: " 
		ipt2:	.asciiz "Segundo valor: "
		ipt3:	.asciiz "Terceiro valor: "
		ipt4:	.asciiz "Quarto valor (fora de ordem): "
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

li $v0, 4
la $a0, ipt3
syscall
li $v0, 5
syscall
add $t3, $v0, 0

li $v0, 4
la $a0, ipt4
syscall
li $v0, 5
syscall
add $t4, $v0, 0

calcular:
ble $t4, $t1, primeiro
ble $t4, $t2, segundo
ble $t4, $t3, terceiro
j output

primeiro:
add $t5, $t1, 0
li $t1, 0
add $t1, $t4, 0
li $t4, 0
add $t4, $t3, 0
li $t3, 0
add $t3, $t2, 0
li $t2, 0
add $t2, $t5, 0
j output

segundo:
add $t5, $t2, 0
li $t2, 0
add $t2, $t4, 0
li $t4, 0
add $t4, $t3, 0
li $t3, 0
add $t3, $t5, 0
j output

terceiro:
add $t5, $t3, 0
li $t3, 0
add $t3, $t4, 0
li $t4, 0
add $t4, $t5, 0
j output

output:
li $v0, 1
add $a0, $t1, 0
syscall
li $v0, 4
la $a0, seta
syscall
li $v0, 1
add $a0, $t2, 0
syscall
li $v0, 4
la $a0, seta
syscall
li $v0, 1
add $a0, $t3, 0
syscall
li $v0, 4
la $a0, seta
syscall
li $v0, 1
add $a0, $t4, 0
syscall
j finalizar

finalizar: