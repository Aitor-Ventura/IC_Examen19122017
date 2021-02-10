##EXAMEN 2017 19 DICIEMBRE
				
			.data
V:		.byte 3,2,4,5,6,1
		.align 2
		
res:	.space 4
		
			.text
main:	la $t0,V		#cargamos la direccion de V en $t0
		lb $t1,0($t0)	#t1 = V[1] = a
		li $t2,3		#comprueba si >3
		li $t3,6		#comprueba si <6
		li $t4,2		#t4 = i = 2
		li $t5,0		#t5 = resultado
		#s0 = V[i]
		#s1 almacena el resultado de la multiplicacion
		
para:	bgt $t4,$t3,finpara
		lb $s0,2($t0)
		
		ble $s0,$t2,finsi	#V[i] > 3
		
		bge $s0,$t3,finsi	#V[i] < 6
		
		mult $t1,$s0
		mflo $s1
		add $t5,$t5,$s1		#V[i]*a
		
finsi:	addi $t4,$t4,1
		addi $t0,$t0,1
		j para

finpara:	sw $t5,res
			jr $31