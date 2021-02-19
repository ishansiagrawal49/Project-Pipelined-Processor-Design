.data 
array: .word 3, 8, -4, 4, 6, 9, 1, 9 #-4, 1, 3, 4, 6, 8, 9, 9

.text
la $t1, array
addi $t2, $t1, 28	# @last element
move $t7, $t2		# @max

OuterLoop:
la $t1, array		# t1 = @j = 0
beq $t2, $t1, Print

add $t6, $0, $t2	# t6 = @max



InnerLoop:
beq $t1, $t2, Swap

lw $t7, 0($t6)		# t7 = max
lw $t3, 0($t1)		# t3 = a[j]

slt $t4, $t3, $t7	# t4 = a[j] > max?
blez  $t4, UpdateMax

addi $t1, $t1, 4
j InnerLoop




UpdateMax:
add $t6, $0, $t1

addi $t1, $t1, 4
j InnerLoop

Swap:
lw $t3, 0($t2)		#last element
lw $t7, 0($t6)		#max
sw $t7, 0($t2)
sw $t3, 0($t6)

addi $t2, $t2, -4
j OuterLoop

Print:
la $t1, array
li $t2, 8

loop:
beqz $t2, exit
lw $a0, 0($t1)
li $v0, 1
syscall
addi $t1, $t1, 4
addi $t2, $t2, -1
j loop


exit:
li $v0, 10
syscall