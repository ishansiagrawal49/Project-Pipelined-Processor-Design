addi $2,$0,31
addi $1, $1, 1
loop:
slt $5, $0, $2
beq $5, $0 , end
andi $3,$2,0x01
add $7,$3,$7
srl $2,$2,1
j loop


end:
li $v0, 1
move $a0, $7
syscall
li $v0, 10
syscall